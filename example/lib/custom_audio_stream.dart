import 'dart:async';
import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/services.dart';

class MyAudioStream extends AudioStream {
  String filePath;
  MyAudioStream(this.filePath,
      {super.playSpeed,
      super.pitch,
      super.metas,
      super.drmConfiguration,
      required super.mimeType,
      required super.fileExtension})
      : super(filePath);
  late Uint8List buffer;

  @override
  Future<int> get fileSize async {
    var data = await rootBundle.load(filePath);
    buffer = data.buffer.asUint8List();
    return buffer.length;
  }

  @override
  Future<List<int>> request([int? current, int? length]) async {
    length ??= buffer.length;
    current ??= 0;
    var bytesToRespond = min(buffer.length - current, length);
    var dataToRespond = buffer.sublist(current, current + bytesToRespond);
    return dataToRespond;
  }

  @override
  FutureOr<void> close() {
    // TODO: Clear buffer
  }
}