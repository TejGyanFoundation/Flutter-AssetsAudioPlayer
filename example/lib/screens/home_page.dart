import 'dart:convert';
import 'dart:typed_data';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../components/circular_loader.dart';
import '../database/database_helper.dart';
import '../player/audio_player_handler.dart';
import '../screens/dummy_screen.dart';
import '../services/service_locator.dart' as service_locator;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final AudioPlayerHandler _audioPlayerHandler =
      service_locator.locator<AudioPlayerHandler>();
  final CircularLoader _circularLoader = CircularLoader();
  final Dio _dio = Dio();
  final String url =
      'https://staging.cdn.happythoughts.in/cms/audio/103_meera_ki_jaise_bhakti.mp3';
  final DatabaseHelper databaseHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 48.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  fit: StackFit.passthrough,
                  children: <Widget>[
                    StreamBuilder<Playing?>(
                      stream: _audioPlayerHandler.currentPlayingAudio(),
                      builder: (context, currentSong) {
                        if (currentSong.data != null) {
                          final Audio myAudio =
                              _audioPlayerHandler.getCurrentAudio(
                            currentSong,
                          );
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: myAudio.metas.image?.path == null
                                  ? const SizedBox()
                                  : myAudio.metas.image?.type ==
                                          ImageType.network
                                      ? Image.network(
                                          myAudio.metas.image!.path,
                                          height: 150,
                                          width: 150,
                                          fit: BoxFit.contain,
                                        )
                                      : Image.asset(
                                          myAudio.metas.image!.path,
                                          height: 150,
                                          width: 150,
                                          fit: BoxFit.contain,
                                        ),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                _audioPlayerHandler.buildCurrentItemControls(),
                const SizedBox(
                  height: 20,
                ),
                _audioPlayerHandler.buildPlaylist(),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const DummyScreen(),
                      ),
                    );
                  },
                  child: const Text('Go to dummy screen'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    _downloadAndPlay();
                  },
                  child: const Text('Download & Play'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _audioPlayerHandler.playFirstSong();
    super.initState();
  }

  @override
  void dispose() {
    disposeResources();
    super.dispose();
  }

  Future<void> disposeResources() async {
    await _audioPlayerHandler.disposePlayer();
  }

  _downloadAndPlay() async {
    try {
      _circularLoader.showCircularLoader();
      Map<String, dynamic> data = await databaseHelper.readNote(
        url,
      );
      String str = data['data'];
      _audioPlayerHandler.playOffline(str);
      _circularLoader.hideCircularLoader();
    } catch (e) {
      Response<List<int>> rs = await _dio.get<List<int>>(
        url,
        options: Options(responseType: ResponseType.bytes),
      );

      final Uint8List uInt8List = Uint8List.fromList(rs.data!);
      String base64String = base64.encode(uInt8List);
      int? id = await databaseHelper.create(
        {
          'id': url,
          'data': base64String,
        },
      );
      if (id != null) {
        _audioPlayerHandler.playOffline(base64String);
      }
      _circularLoader.hideCircularLoader();
    }
  }
}
