package com.github.florent37.assets_audio_player.playerimplem

import android.content.Context
import android.media.MediaDataSource
import android.media.MediaPlayer
import android.media.MediaPlayer.*
import android.net.Uri
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.util.Log
import androidx.annotation.RequiresApi
import com.github.florent37.assets_audio_player.AssetAudioPlayerThrowable
import com.github.florent37.assets_audio_player.AssetsAudioPlayerPlugin
import com.github.florent37.assets_audio_player.Player
import com.google.android.exoplayer2.C
import com.google.android.exoplayer2.MediaItem
import com.google.android.exoplayer2.source.ProgressiveMediaSource
import io.flutter.embedding.engine.plugins.FlutterPlugin
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.TimeoutCancellationException
import kotlinx.coroutines.withContext
import java.util.concurrent.TimeoutException
import kotlin.coroutines.resume
import kotlin.coroutines.resumeWithException
import kotlin.coroutines.suspendCoroutine
import kotlin.math.min

class PlayerImplemTesterMediaPlayer : PlayerImplemTester {

    private var mediaPlayer: PlayerImplemMediaPlayer? = null


    private fun mapError(t: Throwable): AssetAudioPlayerThrowable {
        return AssetAudioPlayerThrowable.PlayerError(t)
    }


    @RequiresApi(Build.VERSION_CODES.ICE_CREAM_SANDWICH)
    override suspend fun open(configuration: PlayerFinderConfiguration): PlayerFinder.PlayerWithDuration {
        if (AssetsAudioPlayerPlugin.displayLogs) {
            Log.d("PlayerImplem", "trying to open with native mediaplayer")
        }
        val mediaPlayer = PlayerImplemMediaPlayer(
            onFinished = {
                configuration.onFinished?.invoke()
                //stop(pingListener = false)
            },
            onBuffering = {
                configuration.onBuffering?.invoke(it)
            },
            onSeeking = {
                configuration.onSeeking?.invoke(it)
            },
            onError = { t ->
                configuration.onError?.invoke(mapError(t))
            },
            onGetBytes = { start, end, current, onDone ->
                configuration.onGetBytes?.invoke(
                    start,
                    end,
                    current,
                    onDone
                )
            },
            onOpenClose = { name, type, onDone ->
                configuration.onOpenClose?.invoke(name, type, onDone)
            },
        )
        try {
            val durationMS = mediaPlayer?.open(
                context = configuration.context,
                assetAudioPath = configuration.assetAudioPath,
                audioType = configuration.audioType,
                assetAudioPackage = configuration.assetAudioPackage,
                networkHeaders = configuration.networkHeaders,
                flutterAssets = configuration.flutterAssets,
                drmConfiguration = configuration.drmConfiguration
            )
            return PlayerFinder.PlayerWithDuration(
                player = mediaPlayer!!,
                duration = durationMS!!
            )
        } catch (t: Throwable) {
            if (AssetsAudioPlayerPlugin.displayLogs) {
                Log.d("PlayerImplem", "failed to open with native mediaplayer")
            }

            mediaPlayer?.release()
            throw t
        }
    }
}

class PlayerImplemMediaPlayer(
    onFinished: (() -> Unit),
    onBuffering: ((Boolean) -> Unit),
    onSeeking: ((Boolean) -> Unit),
    onError: ((Throwable) -> Unit),
    onGetBytes: ((offset: Int, length: Int, currentItem: String, (ByteArray) -> Unit) -> Unit),
    onOpenClose: ((currentItem: String, type: String, onDone: ((size: Long) -> Unit)?) -> Unit)
) : PlayerImplem(
    onFinished = onFinished,
    onBuffering = onBuffering,
    onSeeking = onSeeking,
    onError = onError,
    onGetBytes = onGetBytes,
    onOpenClose = onOpenClose
) {
    private var mediaPlayer: MediaPlayer? = null

    override val isPlaying: Boolean
        get() = try {
            mediaPlayer?.isPlaying ?: false
        } catch (t: Throwable) {
            false
        }
    override val currentPositionMs: Long
        get() = try {
            mediaPlayer?.currentPosition?.toLong() ?: 0
        } catch (t: Throwable) {
            0
        }

    override var loopSingleAudio: Boolean
        @RequiresApi(Build.VERSION_CODES.CUPCAKE)
        get() = mediaPlayer?.isLooping ?: false
        set(value) {
            mediaPlayer?.isLooping = value
        }

    override fun stop() {
        mediaPlayer?.stop()
    }

    override fun play() {
        mediaPlayer?.start()
    }

    override fun pause() {
        mediaPlayer?.pause()
    }

    @RequiresApi(Build.VERSION_CODES.ICE_CREAM_SANDWICH)
    override suspend fun open(
        context: Context,
        flutterAssets: FlutterPlugin.FlutterAssets,
        assetAudioPath: String?,
        audioType: String,
        networkHeaders: Map<*, *>?,
        assetAudioPackage: String?,
        drmConfiguration: Map<*, *>?
    ): DurationMS = withContext(Dispatchers.IO) {
        suspendCoroutine<DurationMS> { continuation ->
            var onThisMediaReady = false

            this@PlayerImplemMediaPlayer.mediaPlayer = MediaPlayer()

            when (audioType) {
                Player.AUDIO_TYPE_NETWORK, Player.AUDIO_TYPE_LIVESTREAM -> {
                    mediaPlayer?.reset()
                    networkHeaders?.toMapString()?.let {
                        mediaPlayer?.setDataSource(context, Uri.parse(assetAudioPath), it)
                    } ?: run {
                        //without headers
                        mediaPlayer?.setDataSource(assetAudioPath)
                    }
                }
                Player.AUDIO_TYPE_FILE -> {
                    mediaPlayer?.reset();
                    mediaPlayer?.setDataSource(context, Uri.parse("file:///$assetAudioPath"))
                }
                Player.AUDIO_TYPE_CUSTOM -> {
                    if (networkHeaders != null && Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                        mediaPlayer?.reset();
                        mediaPlayer?.setDataSource(CustomMediaDataSource(onGetBytes, onOpenClose, assetAudioPath!!))
                    } else {
                        throw Exception("Item data found")
                    }
                }
                else -> { //asset
                    context.assets.openFd("flutter_assets/$assetAudioPath").also {
                        mediaPlayer?.reset();
                        mediaPlayer?.setDataSource(
                            it.fileDescriptor,
                            it.startOffset,
                            it.declaredLength
                        )
                    }.close()
                }
            }

            mediaPlayer?.setOnErrorListener { _, what, extra: Int ->
                // what
                //    MEDIA_ERROR_UNKNOWN
                //    MEDIA_ERROR_SERVER_DIED
                // extra
                //    MEDIA_ERROR_IO
                //    MEDIA_ERROR_MALFORMED
                //    MEDIA_ERROR_UNSUPPORTED
                //    MEDIA_ERROR_TIMED_OUT
                //    MEDIA_ERROR_SYSTEM - low-level system error.
                val error =
                    if (what == MEDIA_ERROR_SERVER_DIED || extra == MEDIA_ERROR_IO || extra == MEDIA_ERROR_TIMED_OUT) {
                        AssetAudioPlayerThrowable.NetworkError(Throwable(extra.toString()))
                    } else {
                        AssetAudioPlayerThrowable.PlayerError(Throwable(extra.toString()))
                    }

                if (!onThisMediaReady) {
                    continuation.resumeWithException(error)
                } else {
                    onError(error)
                }

                true
            }
            mediaPlayer?.setOnCompletionListener {
                this@PlayerImplemMediaPlayer.onFinished.invoke()
            }

            mediaPlayer?.setOnSeekCompleteListener {
                onSeeking.invoke(false)
            }

            try {
                mediaPlayer?.setOnPreparedListener {
                    //retrieve duration in seconds
                    val duration = mediaPlayer?.duration ?: 0
                    val totalDurationMs = duration.toLong()

                    continuation.resume(totalDurationMs)

                    onThisMediaReady = true
                }
                mediaPlayer?.prepare()
            } catch (error: Throwable) {
                if (!onThisMediaReady) {
                    continuation.resumeWithException(error)
                } else {
                    onError(AssetAudioPlayerThrowable.PlayerError(error))
                }
            }
        }
    }

    override fun release() {
        mediaPlayer?.release()
    }

    override fun seekTo(to: Long) {
        onSeeking.invoke(true)
        mediaPlayer?.seekTo(to.toInt())
    }

    override fun setVolume(volume: Float) {
        mediaPlayer?.setVolume(volume, volume)
    }

    override fun setPlaySpeed(playSpeed: Float) {
        //not possible
    }

    override fun setPitch(pitch: Float) {
        //not possible
    }

    @RequiresApi(Build.VERSION_CODES.GINGERBREAD)
    override fun getSessionId(listener: (Int) -> Unit) {
        mediaPlayer?.audioSessionId?.takeIf { it != 0 }?.let(listener)
    }
}

fun Map<*, *>.toMapString(): Map<String, String> {
    val result = mutableMapOf<String, String>()
    this.forEach {
        it.key?.let { key ->
            it.value?.let { value ->
                result[key.toString()] = value.toString()
            }
        }
    }
    return result
}

@RequiresApi(Build.VERSION_CODES.M)
class CustomMediaDataSource(
    private var getBytes: ((offset: Int, length: Int, currentItem: String, onDone: (data: ByteArray) -> Unit) -> Unit),
    private var onOpenClose: ((currentItem: String, type: String, onDone: ((size: Long) -> Unit)?) -> Unit),
    private var name: String,
    timeout: Int = 7000
) :
    MediaDataSource() {
    private val timeout: Int
    private var attempts: Int = 0
    private var size: Long = 0
    private var opened: Boolean = false

    init {
        this.timeout = timeout
    }

    override fun close() {
        Handler(Looper.getMainLooper()).post {
            onOpenClose(name, "close", null)
        }
    }

    override fun readAt(position: Long, buffer: ByteArray, offset: Int, size: Int): Int {
        if (!opened) {
            try {
                Handler(Looper.getMainLooper()).post {
                    onOpenClose(name, "open", fun(size) {
                        this.size = size
                    })
                }
                // Handler needs to be awaited before return
                while (size <= 0) {
                    if (attempts > timeout) throw TimeoutException()
                    attempts++
                    Thread.sleep(1)
                }
                attempts = 0

            } catch (e: InterruptedException) {
                //ignore
            }
            opened = true
        }
        var done = false
        val dataLength = min(size, (this.size - position).toInt())
        if (dataLength <= 0) {
            return C.RESULT_END_OF_INPUT
        }
        Handler(Looper.getMainLooper()).post {
            getBytes(position.toInt(), dataLength, name, fun(bytes) {
                System.arraycopy(bytes, 0, buffer, offset, dataLength)
                done = true
            })
        }

        // Handler needs to be awaited before return
        while (!done) {
            if (attempts > timeout) throw TimeoutException()
            attempts++
            Thread.sleep(1)
        }
        attempts = 0

        return size
    }

    override fun getSize(): Long {
        return size
    }

}