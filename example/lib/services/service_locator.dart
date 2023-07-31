import 'package:get_it/get_it.dart';

import '../player/audio_player_handler.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(
    () => AudioPlayerHandler(),
  );
}

Future<void> resetPlayer(
  AudioPlayerHandler audioPlayerHandler,
) async {
  locator.resetLazySingleton(instance: audioPlayerHandler);
}
