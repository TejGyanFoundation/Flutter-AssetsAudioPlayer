import 'assets_audio_player.dart';
import 'player_group.dart';

enum AssetsAudioPlayerErrorType { Network, Player, Custom }

class ErrorHandler {
  final AssetsAudioPlayerError error;
  final AssetsAudioPlayer player;
  final Duration? currentPosition;
  final Playlist? playlist;
  final int? playlistIndex;

  const ErrorHandler({
    required this.error,
    required this.player,
    this.currentPosition,
    this.playlist,
    this.playlistIndex,
  });
}

typedef AssetsAudioPlayerErrorHandler = Function(ErrorHandler errorHandler);
typedef AssetsAudioPlayerGroupErrorHandler = Function(
    AssetsAudioPlayerGroup group, ErrorHandler errorHandler);

AssetsAudioPlayerErrorType parseAssetsAudioPlayerErrorType(String type) {
  switch (type) {
    case 'network':
      return AssetsAudioPlayerErrorType.Network;
    case 'custom':
      return AssetsAudioPlayerErrorType.Custom;
    default:
      return AssetsAudioPlayerErrorType.Player;
  }
}

class AssetsAudioPlayerError {
  final AssetsAudioPlayerErrorType errorType;
  final String message;

  const AssetsAudioPlayerError({
    required this.errorType,
    required this.message,
  });

  @override
  String toString() {
    return 'AssetsAudioPlayerError{errorType: $errorType, message: $message}';
  }
}

abstract class AssetsAudioPlayerCustomError extends AssetsAudioPlayerError
    with Exception {
  AssetsAudioPlayerCustomError({required String message})
      : super(errorType: AssetsAudioPlayerErrorType.Custom, message: message);
}
