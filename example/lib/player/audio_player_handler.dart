import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import 'playing_controls.dart';
import 'position_seek_widget.dart';
import 'songs_selector.dart';

class AudioPlayerHandler {
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
  final List<Audio> audios = [
    Audio(
      'assets/audios/rock.mp3',
      metas: Metas(
        id: 'Rock',
        title: 'Rock',
        artist: 'Florent Champigny',
        album: 'RockAlbum',
        image: const MetasImage.network(
          'https://static.radio.fr/images/broadcasts/cb/ef/2075/c300.png',
        ),
      ),
    ),
    Audio.network(
      'https://staging.cdn.happythoughts.in/transcoded_audios/4bdf59e3-4a9f-4790-bae4-3489baed0e6c/hls.m3u8',
      metas: Metas(
        id: '4bdf59e3-4a9f-4790-bae4-3489baed0e6c',
        title: 'Antarman bhajan',
        image: const MetasImage.network(
          'https://staging.cdn.happythoughts.in/cms/audio/thumbnails/86_antarman_bhajan.jpg',
        ),
      ),
    ),
    Audio(
      'assets/audios/2 country.mp3',
      metas: Metas(
        id: 'Country',
        title: 'Country',
        artist: 'Florent Champigny',
        album: 'CountryAlbum',
        image: const MetasImage.asset('assets/images/country.jpg'),
      ),
    ),
    Audio(
      'assets/audios/electronic.mp3',
      metas: Metas(
        id: 'Electronics',
        title: 'Electronic',
        artist: 'Florent Champigny',
        album: 'ElectronicAlbum',
        image: const MetasImage.network(
          'https://99designs-blog.imgix.net/blog/wp-content/uploads/2017/12/attachment_68585523.jpg',
        ),
      ),
    ),
    Audio(
      'assets/audios/hiphop.mp3',
      metas: Metas(
        id: 'Hiphop',
        title: 'HipHop',
        artist: 'Florent Champigny',
        album: 'HipHopAlbum',
        image: const MetasImage.network(
          'https://beyoudancestudio.ch/wp-content/uploads/2019/01/apprendre-danser.hiphop-1.jpg',
        ),
      ),
    ),
    Audio(
      'assets/audios/pop.mp3',
      metas: Metas(
        id: 'Pop',
        title: 'Pop',
        artist: 'Florent Champigny',
        album: 'PopAlbum',
        image: const MetasImage.network(
          'https://image.shutterstock.com/image-vector/pop-music-text-art-colorful-600w-515538502.jpg',
        ),
      ),
    ),
    Audio(
      'assets/audios/instrumental.mp3',
      metas: Metas(
        id: 'Instrumental',
        title: 'Instrumental',
        artist: 'Florent Champigny',
        album: 'InstrumentalAlbum',
        image: const MetasImage.network(
          'https://99designs-blog.imgix.net/blog/wp-content/uploads/2017/12/attachment_68585523.jpg',
        ),
      ),
    ),
  ];

  Future<void> playFirstSong() async {
    await _assetsAudioPlayer.open(
      Playlist(audios: audios, startIndex: 0),
      audioFocusStrategy: const AudioFocusStrategy.request(
        resumeAfterInterruption: true,
        resumeOthersPlayersAfterDone: true,
      ),
      showNotification: true,
      autoStart: true,
    );
  }

  Future<void> disposePlayer() async {
    await _assetsAudioPlayer.dispose();
  }

  Audio _findAudio(
    List<Audio> source,
    String fromPath,
  ) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  Audio getCurrentAudio(
    AsyncSnapshot<dynamic> playing,
  ) {
    final Audio myAudio = _findAudio(
      audios,
      playing.data!.audio.assetAudioPath,
    );
    return myAudio;
  }

  ValueStream<Playing?> currentPlayingAudio() {
    return _assetsAudioPlayer.current;
  }

  Widget buildCurrentItemControls() {
    return _assetsAudioPlayer.builderCurrent(
      builder: (context, playing) {
        return PlayerBuilder.isPlaying(
          player: _assetsAudioPlayer,
          builder: (context, isPlaying) {
            return Column(
              children: <Widget>[
                _assetsAudioPlayer.builderLoopMode(
                  builder: (context, loopMode) {
                    return PlayerBuilder.isPlaying(
                      player: _assetsAudioPlayer,
                      builder: (context, isPlaying) {
                        return PlayingControls(
                          loopMode: loopMode,
                          isPlaying: isPlaying,
                          isPlaylist: true,
                          onStop: () {
                            _assetsAudioPlayer.stop();
                          },
                          toggleLoop: () {
                            _assetsAudioPlayer.toggleLoop();
                          },
                          onPlay: () {
                            _assetsAudioPlayer.playOrPause();
                          },
                          onNext: () {
                            _assetsAudioPlayer.next(
                              keepLoopMode: false,
                            );
                          },
                          onPrevious: () {
                            _assetsAudioPlayer.previous(
                              keepLoopMode: false,
                            );
                          },
                        );
                      },
                    );
                  },
                ),
                _assetsAudioPlayer.builderRealtimePlayingInfos(
                  builder: (context, RealtimePlayingInfos? info) {
                    if (info == null) {
                      return const SizedBox();
                    }
                    return Column(
                      children: [
                        PositionSeekWidget(
                          currentPosition: info.currentPosition,
                          duration: info.duration,
                          seekTo: (to) {
                            _assetsAudioPlayer.seek(to);
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget buildPlaylist() {
    return _assetsAudioPlayer.builderCurrent(builder: (
      BuildContext context,
      Playing? playing,
    ) {
      return SongsSelector(
        audios: audios,
        onPlaylistSelected: (myAudios) {
          _assetsAudioPlayer.open(
            Playlist(audios: myAudios),
            showNotification: true,
            headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplugPlayOnPlug,
            audioFocusStrategy: const AudioFocusStrategy.request(
              resumeAfterInterruption: true,
              resumeOthersPlayersAfterDone: true,
            ),
          );
        },
        onSelected: (myAudio) async {
          try {
            await _assetsAudioPlayer.open(
              myAudio,
              autoStart: true,
              showNotification: true,
              playInBackground: PlayInBackground.enabled,
              audioFocusStrategy: const AudioFocusStrategy.request(
                resumeAfterInterruption: true,
                resumeOthersPlayersAfterDone: true,
              ),
              headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplug,
              notificationSettings: const NotificationSettings(),
            );
          } catch (e) {
            debugPrint(e.toString());
          }
        },
        playing: playing,
      );
    });
  }

  Future<void> playOffline(
    String base64String,
  ) async {
    audios.add(Audio.base64(
      base64String,
      fileExtension: 'mp3',
      mimeType: 'audio/mp3',
      metas: Metas(
        id: '61e94145-bfcb-43cf-9019-065f6ac17abf',
        title: 'Meera ki jaise bhakti',
        image: const MetasImage.network(
          'https://staging.cdn.happythoughts.in/cms/audio/thumbnails/103_meera_ki_jaise_bhakti.jpg',
        ),
      ),
    ));
    await _assetsAudioPlayer.open(
      Playlist(audios: audios, startIndex: audios.length - 1),
      audioFocusStrategy: const AudioFocusStrategy.request(
        resumeAfterInterruption: true,
        resumeOthersPlayersAfterDone: true,
      ),
      showNotification: true,
      autoStart: true,
    );
  }
}
