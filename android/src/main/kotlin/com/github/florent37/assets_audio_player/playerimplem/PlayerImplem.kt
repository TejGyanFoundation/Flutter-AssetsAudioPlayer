package com.github.florent37.assets_audio_player.playerimplem

import android.content.Context
import com.github.florent37.assets_audio_player.AssetAudioPlayerThrowable
import io.flutter.embedding.engine.plugins.FlutterPlugin

typealias DurationMS = Long

abstract class PlayerImplem(
        val onFinished: (() -> Unit),
        val onBuffering: ((Boolean) -> Unit),
        val onSeeking: ((Boolean) -> Unit),
        val onError: ((AssetAudioPlayerThrowable) -> Unit),
        val onGetBytes: ((offset: Int, length: Int, currentItem: String, onDone: (data: ByteArray) -> Unit) -> Unit),
        val onOpenClose: ((currentItem: String, type: String, onDone: ((size: Long) -> Unit)?) -> Unit)
) {
    abstract var loopSingleAudio: Boolean
    abstract val isPlaying: Boolean
    abstract val currentPositionMs: Long
    abstract fun stop()
    abstract fun play()
    abstract fun pause()
    abstract fun getSessionId(listener: (Int) -> Unit)
    abstract suspend fun open(context: Context,
                     flutterAssets: FlutterPlugin.FlutterAssets,
                     assetAudioPath: String?,
                     audioType: String,
                     networkHeaders: Map<*, *>?,
                     assetAudioPackage: String?,
                     drmConfiguration: Map<*, *>?
    ) : DurationMS
    abstract fun release()
    abstract fun seekTo(to: Long)
    abstract fun setVolume(volume: Float)
    abstract fun setPlaySpeed(playSpeed: Float)
    abstract fun setPitch(pitch: Float)
}