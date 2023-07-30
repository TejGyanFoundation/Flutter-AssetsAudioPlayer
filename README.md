# 🎧 assets_audio_player 🔊

[![pub package](https://img.shields.io/pub/v/assets_audio_player.svg)](https://pub.dartlang.org/packages/assets_audio_player)
<a href="https://github.com/Solido/awesome-flutter">
<img alt="Awesome Flutter" src="https://img.shields.io/badge/Awesome-Flutter-blue.svg?longCache=true&style=flat" />
</a>
<img src="https://img.shields.io/badge/platform-android%20%7C%20ios%20%7C%20macos%20%7C%20web%20-%23989898" />

[![Codemagic build status](https://api.codemagic.io/apps/5ed8002fe1907b001c67db52/5ed8002fe1907b001c67db51/status_badge.svg)](https://codemagic.io/apps/5ed8002fe1907b001c67db52/5ed8002fe1907b001c67db51/latest_build)
[![CodeFactor](https://www.codefactor.io/repository/github/florent37/flutter-assetsaudioplayer/badge)](https://www.codefactor.io/repository/github/florent37/flutter-assetsaudioplayer)

_This fork is based on [assets_audio_player](https://pub.dartlang.org/packages/assets_audio_player) and contains a few bug fixes and adds two new audio options: base64 and custom stream_

Play music/audio stored in assets files (simultaneously) directly from Flutter (android / ios / web / macos).

You can also use play audio files from **network** using their url, **radios/livestream** and **local files**

**Notification can be displayed on Android & iOS, and bluetooth actions are handled**

```yaml
flutter:
  assets:
    - assets/audios/
```

```Dart
AssetsAudioPlayer.newPlayer().open(
    Audio("assets/audios/song1.mp3"),
    autoPlay: true,
    showNotification: true,
);
```

[![sample1](./medias/sample1.png)](https://github.com/florent37/Flutter-AssetsAudioPlayer)
[![sample1](./medias/sample2.png)](https://github.com/florent37/Flutter-AssetsAudioPlayer)

# 📥 Import

```yaml
dependencies:
  assets_audio_player: ^3.0.6

or

assets_audio_player:
git:
url: https://github.com/florent37/Flutter-AssetsAudioPlayer.git
ref: master

ref can be latest commit id.
```

**Works with `flutter: ">=1.12.13+hotfix.6 <2.0.0"`, be sure to upgrade your sdk**

You like the package ? buy me a kofi :)

<a href='https://ko-fi.com/A160LCC' target='_blank'><img height='36' style='border:0px;height:36px;' src='https://az743702.vo.msecnd.net/cdn/kofi1.png?v=0' border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>

<table>
    <thead>
        <tr>
            <th>Audio Source</th>
            <th>Android</th>
            <th>iOS</th>
            <th>Web</th>
            <th>MacOS</th>
        </tr>
    </thead>
    <tbody>
        <tr>
          <td>🗄️ Asset file (asset path)</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
        </tr>
        <tr>
          <td>🌐 Network file (url)</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
        </tr>
        <tr>
          <td>📁 Local file (path)</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
        </tr>
        <tr>
          <td>📻 Network LiveStream / radio (url) <br/> (<b>Default, HLS, Dash, SmoothStream</b>)</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
        </tr>
        <tr>
          <td>📝 Base64 (string)</td>
          <td>✅</td>
          <td>✅</td>
          <td>🚫</td>
          <td>🚫</td>
        </tr>
        <tr>
          <td>🪄 Custom Stream (manually return the bytes)</td>
          <td>✅</td>
          <td>✅</td>
          <td>🚫</td>
          <td>🚫</td>
        </tr>
    </tbody>
</table>

<table>
    <thead>
        <tr>
            <th>Feature</th>
            <th>Android</th>
            <th>iOS</th>
            <th>Web</th>
            <th>MacOS</th>
        </tr>
    </thead>
    <tbody>
        <tr>
          <td>🎶 Multiple players</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
        </tr>
        <tr>
          <td>💽 Open Playlist</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
        </tr>
        <tr>
          <td>💬System notification</td>
          <td>✅</td>
          <td>✅</td>
          <td>🚫</td>
          <td>🚫</td>
        </tr>
        <tr>
          <td>🎧 Bluetooth actions</td>
          <td>✅</td>
          <td>✅</td>
          <td>🚫</td>
          <td>🚫</td>
        </tr>
        <tr>
          <td>🔕 Respect System silent mode</td>
          <td>✅</td>
          <td>✅</td>
          <td>🚫</td>
          <td>🚫</td>
        </tr>
        <tr>
          <td>📞 Pause on phone call</td>
          <td>✅</td>
          <td>✅</td>
          <td>🚫</td>
          <td>🚫</td>
        </tr>
    </tbody>
</table>

<table>
    <thead>
        <tr>
            <th>Commands</th>
            <th>Android</th>
            <th>iOS</th>
            <th>Web</th>
            <th>MacOS</th>
        </tr>
    </thead>
    <tbody>
        <tr>
          <td>▶ Play</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
        </tr>
        <tr>
          <td>⏸ Pause</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
        </tr>
        <tr>
          <td>⏹ Stop</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
        </tr>
        <tr>
          <td>⏩ Seek(position)</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
        </tr>
        <tr>
          <td>⏪⏩ SeekBy(position)</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
        </tr>
        <tr>
          <td>⏩ Forward(speed)</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
        </tr>
        <tr>
          <td>⏪ Rewind(speed)</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
        </tr>
        <tr>
          <td>⏭ Next</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
        </tr>
        <tr>
           <td>⏮ Prev</td>
           <td>✅</td>
           <td>✅</td>
           <td>✅</td>
           <td>✅</td>
        </tr>
    </tbody>
</table>

<table>
    <thead>
        <tr>
            <th>Widgets</th>
            <th>Android</th>
            <th>iOS</th>
            <th>Web</th>
            <th>MacOS</th>
        </tr>
    </thead>
    <tbody>
        <tr>
           <td>🐦 Audio Widget</td>
           <td>✅</td>
           <td>✅</td>
           <td>✅</td>
           <td>✅</td>
        </tr>
        <tr>
            <td>🐦 Widget Builders</td>
            <td>✅</td>
            <td>✅</td>
            <td>✅</td>
            <td>✅</td>
        </tr>
        <tr>
             <td>🐦 AudioPlayer Builders Extension</td>
             <td>✅</td>
             <td>✅</td>
             <td>✅</td>
             <td>✅</td>
         </tr>
    </tbody>
</table>

<table>
    <thead>
        <tr>
            <th>Properties</th>
            <th>Android</th>
            <th>iOS</th>
            <th>Web</th>
            <th>MacOS</th>
        </tr>
    </thead>
    <tbody>
        <tr>
          <td>🔁 Loop</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
        </tr>
        <tr>
          <td>🔀 Shuffle</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
        </tr>
        <tr>
          <td>🔊 get/set Volume</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
        </tr>
        <tr>
          <td>⏩ get/set Play Speed</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
        </tr>
	<tr>
          <td>⏩ get/set Pitch</td>
          <td>✅</td>
          <td>🚫</td>
          <td>🚫</td>
          <td>🚫</td>
        </tr>
    </tbody>
</table>

<table>
    <thead>
        <tr>
            <th>Listeners</th>
            <th>Android</th>
            <th>iOS</th>
            <th>Web</th>
            <th>MacOS</th>
        </tr>
    </thead>
    <tbody>
        <tr>
          <td>🦻 Listener onReady(completeDuration)</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
        </tr>
        <tr>
           <td>🦻 Listener currentPosition</td>
           <td>✅</td>
           <td>✅</td>
           <td>✅</td>
           <td>✅</td>
        </tr>
        <tr>
          <td>🦻 Listener finished</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
        </tr>
        <tr>
           <td>🦻 Listener buffering</td>
           <td>✅</td>
           <td>✅</td>
           <td>✅</td>
           <td>✅</td>
        </tr>
        <tr>
          <td>🦻 Listener volume</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
        </tr>
        <tr>
          <td>🦻Listener Play Speed</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
          <td>✅</td>
        </tr>
	<tr>
          <td>🦻Listener Pitch</td>
          <td>✅</td>
          <td>🚫</td>
          <td>🚫</td>
          <td>🚫</td>
        </tr>
    </tbody>
</table>

# 📁 Import assets files

No needed to copy songs to a media cache, with assets_audio_player you can open them directly from the assets.

1. Create an audio directory in your assets (not necessary named "audios")
2. Declare it inside your pubspec.yaml

```yaml
flutter:
  assets:
    - assets/audios/
```

## 🛠️ Getting Started

```Dart
final assetsAudioPlayer = AssetsAudioPlayer();

assetsAudioPlayer.open(
    Audio("assets/audios/song1.mp3"),
);
```

You can also play _network songs_ from _url_

```Dart
final assetsAudioPlayer = AssetsAudioPlayer();

try {
    await assetsAudioPlayer.open(
        Audio.network("http://www.mysite.com/myMp3file.mp3"),
    );
} catch (t) {
    //mp3 unreachable
}
```

_LiveStream / Radio_ from _url_

**The main difference with network, if you pause/play, on livestream it will resume to present duration**

```Dart
final assetsAudioPlayer = AssetsAudioPlayer();

try {
    await assetsAudioPlayer.open(
        Audio.liveStream(MY_LIVESTREAM_URL),
    );
} catch (t) {
    //stream unreachable
}
```

Play a _base64 audio string_

```Dart
final assetsAudioPlayer = AssetsAudioPlayer();

try {
    await assetsAudioPlayer.open(
         Audio.base64(
          'UklGRhwMAABXQVZFZm10IBAAAAABAAEAgD4AAIA+AAABAAgAZGF0Ya4LAACAgICAgICAgICAgICAgICAgICAgICAgICAf3hxeH+AfXZ1eHx6dnR5fYGFgoOKi42aloubq6GOjI2Op7ythXJ0eYF5aV1AOFFib32HmZSHhpCalIiYi4SRkZaLfnhxaWptb21qaWBea2BRYmZTVmFgWFNXVVVhaGdbYGhZbXh1gXZ1goeIlot1k6yxtKaOkaWhq7KonKCZoaCjoKWuqqmurK6ztrO7tbTAvru/vb68vbW6vLGqsLOfm5yal5KKhoyBeHt2dXBnbmljVlJWUEBBPDw9Mi4zKRwhIBYaGRQcHBURGB0XFxwhGxocJSstMjg6PTc6PUxVV1lWV2JqaXN0coCHhIyPjpOenqWppK6xu72yxMu9us7Pw83Wy9nY29ve6OPr6uvs6ezu6ejk6erm3uPj3dbT1sjBzdDFuMHAt7m1r7W6qaCupJOTkpWPgHqAd3JrbGlnY1peX1hTUk9PTFRKR0RFQkRBRUVEQkdBPjs9Pzo6NT04Njs+PTxAPzo/Ojk6PEA5PUJAQD04PkRCREZLUk1KT1BRUVdXU1VRV1tZV1xgXltcXF9hXl9eY2VmZmlna3J0b3F3eHyBfX+JgIWJiouTlZCTmpybnqSgnqyrqrO3srK2uL2/u7jAwMLFxsfEv8XLzcrIy83JzcrP0s3M0dTP0drY1dPR1dzc19za19XX2dnU1NjU0dXPzdHQy8rMysfGxMLBvLu3ta+sraeioJ2YlI+MioeFfX55cnJsaWVjXVlbVE5RTktHRUVAPDw3NC8uLyknKSIiJiUdHiEeGx4eHRwZHB8cHiAfHh8eHSEhISMoJyMnKisrLCszNy8yOTg9QEJFRUVITVFOTlJVWltaXmNfX2ZqZ21xb3R3eHqAhoeJkZKTlZmhpJ6kqKeur6yxtLW1trW4t6+us7axrbK2tLa6ury7u7u9u7vCwb+/vr7Ev7y9v8G8vby6vru4uLq+tri8ubi5t7W4uLW5uLKxs7G0tLGwt7Wvs7avr7O0tLW4trS4uLO1trW1trm1tLm0r7Kyr66wramsqaKlp52bmpeWl5KQkImEhIB8fXh3eHJrbW5mYGNcWFhUUE1LRENDQUI9ODcxLy8vMCsqLCgoKCgpKScoKCYoKygpKyssLi0sLi0uMDIwMTIuLzQ0Njg4Njc8ODlBQ0A/RUdGSU5RUVFUV1pdXWFjZGdpbG1vcXJ2eXh6fICAgIWIio2OkJGSlJWanJqbnZ2cn6Kkp6enq62srbCysrO1uLy4uL+/vL7CwMHAvb/Cvbq9vLm5uba2t7Sysq+urqyqqaalpqShoJ+enZuamZqXlZWTkpGSkpCNjpCMioqLioiHhoeGhYSGg4GDhoKDg4GBg4GBgoGBgoOChISChISChIWDg4WEgoSEgYODgYGCgYGAgICAgX99f398fX18e3p6e3t7enp7fHx4e3x6e3x7fHx9fX59fn1+fX19fH19fnx9fn19fX18fHx7fHx6fH18fXx8fHx7fH1+fXx+f319fn19fn1+gH9+f4B/fn+AgICAgH+AgICAgIGAgICAgH9+f4B+f35+fn58e3t8e3p5eXh4d3Z1dHRzcXBvb21sbmxqaWhlZmVjYmFfX2BfXV1cXFxaWVlaWVlYV1hYV1hYWVhZWFlaWllbXFpbXV5fX15fYWJhYmNiYWJhYWJjZGVmZ2hqbG1ub3Fxc3V3dnd6e3t8e3x+f3+AgICAgoGBgoKDhISFh4aHiYqKi4uMjYyOj4+QkZKUlZWXmJmbm52enqCioqSlpqeoqaqrrK2ur7CxsrGys7O0tbW2tba3t7i3uLe4t7a3t7i3tre2tba1tLSzsrKysbCvrq2sq6qop6alo6OioJ+dnJqZmJeWlJKSkI+OjoyLioiIh4WEg4GBgH9+fXt6eXh3d3V0c3JxcG9ubWxsamppaWhnZmVlZGRjYmNiYWBhYGBfYF9fXl5fXl1dXVxdXF1dXF1cXF1cXF1dXV5dXV5fXl9eX19gYGFgYWJhYmFiY2NiY2RjZGNkZWRlZGVmZmVmZmVmZ2dmZ2hnaGhnaGloZ2hpaWhpamlqaWpqa2pra2xtbGxtbm1ubm5vcG9wcXBxcnFycnN0c3N0dXV2d3d4eHh5ent6e3x9fn5/f4CAgIGCg4SEhYaGh4iIiYqLi4uMjY2Oj5CQkZGSk5OUlJWWlpeYl5iZmZqbm5ybnJ2cnZ6en56fn6ChoKChoqGio6KjpKOko6SjpKWkpaSkpKSlpKWkpaSlpKSlpKOkpKOko6KioaKhoaCfoJ+enp2dnJybmpmZmJeXlpWUk5STkZGQj4+OjYyLioqJh4eGhYSEgoKBgIB/fn59fHt7enl5eHd3dnZ1dHRzc3JycXBxcG9vbm5tbWxrbGxraWppaWhpaGdnZ2dmZ2ZlZmVmZWRlZGVkY2RjZGNkZGRkZGRkZGRkZGRjZGRkY2RjZGNkZWRlZGVmZWZmZ2ZnZ2doaWhpaWpra2xsbW5tbm9ub29wcXFycnNzdHV1dXZ2d3d4eXl6enp7fHx9fX5+f4CAgIGAgYGCgoOEhISFhoWGhoeIh4iJiImKiYqLiouLjI2MjI2OjY6Pj46PkI+QkZCRkJGQkZGSkZKRkpGSkZGRkZKRkpKRkpGSkZKRkpGSkZKRkpGSkZCRkZCRkI+Qj5CPkI+Pjo+OjY6Njo2MjYyLjIuMi4qLioqJiomJiImIh4iHh4aHhoaFhoWFhIWEg4SDg4KDgoKBgoGAgYCBgICAgICAf4CAf39+f35/fn1+fX59fHx9fH18e3x7fHt6e3p7ent6e3p5enl6enl6eXp5eXl4eXh5eHl4eXh5eHl4eXh5eHh3eHh4d3h4d3h3d3h4d3l4eHd4d3h3eHd4d3h3eHh4eXh5eHl4eHl4eXh5enl6eXp5enl6eXp5ent6ent6e3x7fHx9fH18fX19fn1+fX5/fn9+f4B/gH+Af4CAgICAgIGAgYCBgoGCgYKCgoKDgoOEg4OEg4SFhIWEhYSFhoWGhYaHhoeHhoeGh4iHiIiHiImIiImKiYqJiYqJiouKi4qLiouKi4qLiouKi4qLiouKi4qLi4qLiouKi4qLiomJiomIiYiJiImIh4iIh4iHhoeGhYWGhYaFhIWEg4OEg4KDgoOCgYKBgIGAgICAgH+Af39+f359fn18fX19fHx8e3t6e3p7enl6eXp5enl6enl5eXh5eHh5eHl4eXh5eHl4eHd5eHd3eHl4d3h3eHd4d3h3eHh4d3h4d3h3d3h5eHl4eXh5eHl5eXp5enl6eXp7ent6e3p7e3t7fHt8e3x8fHx9fH1+fX59fn9+f35/gH+AgICAgICAgYGAgYKBgoGCgoKDgoOEg4SEhIWFhIWFhoWGhYaGhoaHhoeGh4aHhoeIh4iHiIeHiIeIh4iHiIeIiIiHiIeIh4iHiIiHiIeIh4iHiIeIh4eIh4eIh4aHh4aHhoeGh4aHhoWGhYaFhoWFhIWEhYSFhIWEhISDhIOEg4OCg4OCg4KDgYKCgYKCgYCBgIGAgYCBgICAgICAgICAf4B/f4B/gH+Af35/fn9+f35/fn1+fn19fn1+fX59fn19fX19fH18fXx9fH18fXx9fH18fXx8fHt8e3x7fHt8e3x7fHt8e3x7fHt8e3x7fHt8e3x7fHt8e3x8e3x7fHt8e3x7fHx8fXx9fH18fX5+fX59fn9+f35+f35/gH+Af4B/gICAgICAgICAgICAgYCBgIGAgIGAgYGBgoGCgYKBgoGCgYKBgoGCgoKDgoOCg4KDgoOCg4KDgoOCg4KDgoOCg4KDgoOCg4KDgoOCg4KDgoOCg4KDgoOCg4KDgoOCg4KDgoOCg4KCgoGCgYKBgoGCgYKBgoGCgYKBgoGCgYKBgoGCgYKBgoGCgYKBgoGCgYKBgoGBgYCBgIGAgYCBgIGAgYCBgIGAgYCBgIGAgYCBgIGAgYCAgICBgIGAgYCBgIGAgYCBgIGAgYCBgExJU1RCAAAASU5GT0lDUkQMAAAAMjAwOC0wOS0yMQAASUVORwMAAAAgAAABSVNGVBYAAABTb255IFNvdW5kIEZvcmdlIDguMAAA',
          fileExtension: 'wav',
          mimeType: 'audio/wav'),
    );
} catch (t) {
    //stream unreachable
}
```

Play a _custom stream_

```Dart
//create a new custom stream
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

//create a new player
final assetsAudioPlayer = AssetsAudioPlayer();

assetsAudioPlayer.open(
    MyAudioStream(
        'assets/audios/pop.mp3',
        mimeType: 'audio/mpeg',
        fileExtension: 'mp3',
        metas: Metas(
          id: 'Custom',
          title: 'Custom Stream',
          artist: 'My Artist',
          album: 'My Album',
          image: MetasImage.network(
              'https://game-icons.net/icons/000000/ffffff/1x1/lorc/splashy-stream.png'),
        ),
      ),
);
```

And play _songs from file_

```Dart
//create a new player
final assetsAudioPlayer = AssetsAudioPlayer();

assetsAudioPlayer.open(
    Audio.file(FILE_URI),
);
```

for file uri, please look at https://pub.dev/packages/path_provider

```Dart
assetsAudioPlayer.playOrPause();
assetsAudioPlayer.play();
assetsAudioPlayer.pause();
```

```Dart
assetsAudioPlayer.seek(Duration to);
assetsAudioPlayer.seekBy(Duration by);
```

```Dart
assetsAudioPlayer.forwardRewind(double speed);
//if positive, forward, if negative, rewind
```

```Dart
assetsAudioPlayer.stop();
```

# Notifications

[![notification](./medias/notification_android.png)](https://github.com/florent37/Flutter-AssetsAudioPlayer)

[![notification](./medias/notification_iOS.png)](https://github.com/florent37/Flutter-AssetsAudioPlayer)

on iOS, it will use `MPNowPlayingInfoCenter`

1. Add metas inside your audio

```dart
final audio = Audio.network("/assets/audio/country.mp3",
    metas: Metas(
            title:  "Country",
            artist: "Florent Champigny",
            album: "CountryAlbum",
            image: MetasImage.asset("assets/images/country.jpg"), //can be MetasImage.network
          ),
   );
```

2. open with `showNotification: true`

```dart
_player.open(audio, showNotification: true)
```

## Custom notification

Custom icon (android only)

### By ResourceName

Make sure you added those icons inside your `android/res/drawable` **!!! not on flutter assets !!!!**

```dart
await _assetsAudioPlayer.open(
        myAudio,
        showNotification: true,
        notificationSettings: NotificationSettings(
            customStopIcon: AndroidResDrawable(name: "ic_stop_custom"),
            customPauseIcon: AndroidResDrawable(name:"ic_pause_custom"),
            customPlayIcon: AndroidResDrawable(name:"ic_play_custom"),
            customPrevIcon: AndroidResDrawable(name:"ic_prev_custom"),
            customNextIcon: AndroidResDrawable(name:"ic_next_custom"),
        )

```

And don't forget tell proguard to keep those resources for release mode

(part Keeping Resources)

https://sites.google.com/a/android.com/tools/tech-docs/new-build-system/resource-shrinking

```xml

<?xml version="1.0" encoding="utf-8"?>
<resources xmlns:tools="http://schemas.android.com/tools"
tools:keep="@drawable/ic_next_custom, @drawable/ic_prev_custom, @drawable/ic_pause_custom, @drawable/ic_play_custom, @drawable/ic_stop_custom"/>
```

### By Manifest

1. Add your icon into your android's `res` folder (android/app/src/main/res)

2. Reference this icon into your AndroidManifest (android/app/src/main/AndroidManifest.xml)

```xml
<meta-data
     android:name="assets.audio.player.notification.icon"
     android:resource="@drawable/ic_music_custom"/>
```

You can also change actions icons

```
<meta-data
    android:name="assets.audio.player.notification.icon.play"
    android:resource="@drawable/ic_play_custom"/>
<meta-data
    android:name="assets.audio.player.notification.icon.pause"
    android:resource="@drawable/ic_pause_custom"/>
<meta-data
    android:name="assets.audio.player.notification.icon.stop"
    android:resource="@drawable/ic_stop_custom"/>
<meta-data
    android:name="assets.audio.player.notification.icon.next"
    android:resource="@drawable/ic_next_custom"/>
<meta-data
    android:name="assets.audio.player.notification.icon.prev"
    android:resource="@drawable/ic_prev_custom"/>
```

## Handle notification click (android)

Add in main

```dart
AssetsAudioPlayer.setupNotificationsOpenAction((notification) {
    //custom action
    return true; //true : handled, does not notify others listeners
                 //false : enable others listeners to handle it
});
```

Then if you want a custom action on widget

```dart
AssetsAudioPlayer.addNotificationOpenAction((notification) {
   //custom action
   return false; //true : handled, does not notify others listeners
                 //false : enable others listeners to handle it
});
```

## Custom actions

You can enable/disable a notification action

```dart
open(AUDIO,
   showNotification: true,
   notificationSettings: NotificationSettings(
       prevEnabled: false, //disable the previous button

       //and have a custom next action (will disable the default action)
       customNextAction: (player) {
         print("next");
       }
   )

)
```

## Update audio's metas / notification content

After your audio creation, just call

```dart
audio.updateMetas(
       player: _assetsAudioPlayer, //add the player if the audio is actually played
       title: "My new title",
       artist: "My new artist",
       //if I not provide a new album, it keep the old one
       image: MetasImage.network(
         //my new image url
       ),
);
```

## Bluetooth Actions

You have to enable notification to make them work

Available remote commands :

- Play / Pause
- Next
- Prev
- Stop

## HeadPhone Strategy

(Only for Android for now)

while opening a song/playlist, add a strategy

```dart
assetsAudioPlayer.open(
   ...
  headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplug,
  //headPhoneStrategy: HeadPhoneStrategy.none, //default
  //headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplugPlayOnPlug,
)
```

If you want to make it work on bluetooth too, you'll have to add the BLUETOOTH permission inside your AndroidManifest.xml

```xml
<uses-permission android:name="android.permission.BLUETOOTH" />
```

# ⛓ Play in parallel / simultaneously

You can create new AssetsAudioPlayer using AssetsAudioPlayer.newPlayer(),
which will play songs in a different native Media Player

This will enable to play two songs simultaneously

You can have as many player as you want !

```dart
///play 3 songs in parallel
AssetsAudioPlayer.newPlayer().open(
    Audio("assets/audios/song1.mp3")
);
AssetsAudioPlayer.newPlayer().open(
    Audio("assets/audios/song2.mp3")
);

//another way, with create, open, play & dispose the player on finish
AssetsAudioPlayer.playAndForget(
    Audio("assets/audios/song3.mp3")
);
```

Each player has an unique generated `id`, you can retrieve or create them manually using

```dart
final player = AssetsAudioPlayer.withId(id: "MY_UNIQUE_ID");
```

# 🗄️ Playlist

```Dart
assetsAudioPlayer.open(
  Playlist(
    audios: [
      Audio("assets/audios/song1.mp3"),
      Audio("assets/audios/song2.mp3")
    ]
  ),
  loopMode: LoopMode.playlist //loop the full playlist
);

assetsAudioPlayer.next();
assetsAudioPlayer.prev();
assetsAudioPlayer.playlistPlayAtIndex(1);
```

## Audio Widget

If you want a more flutter way to play audio, try the `AudioWidget` !

[![sample](./medias/audio_widget.gif)](https://github.com/florent37/Flutter-AssetsAudioPlayer)

```dart
//inside a stateful widget

bool _play = false;

@override
Widget build(BuildContext context) {
  return AudioWidget.assets(
     path: "assets/audios/country.mp3",
     play: _play,
     child: RaisedButton(
           child: Text(
               _play ? "pause" : "play",
           ),
           onPressed: () {
               setState(() {
                 _play = !_play;
               });
           }
      ),
      onReadyToPlay: (duration) {
          //onReadyToPlay
      },
      onPositionChanged: (current, duration) {
          //onPositionChanged
      },
  );
}
```

How to 🛑 stop 🛑 the AudioWidget ?

Just remove the Audio from the tree !
Or simply keep `play: false`

## 🎧 Listeners

All listeners exposes Streams
Using RxDart, AssetsAudioPlayer exposes some listeners as ValueObservable (Observable that provides synchronous access to the last emitted item);

### 🎵 Current song

```Dart
//The current playing audio, filled with the total song duration
assetsAudioPlayer.current //ValueObservable<PlayingAudio>

//Retrieve directly the current played asset
final PlayingAudio playing = assetsAudioPlayer.current.value;

//Listen to the current playing song
assetsAudioPlayer.current.listen((playingAudio){
    final asset = playingAudio.assetAudio;
    final songDuration = playingAudio.duration;
})
```

### ⌛ Current song duration

```Dart
//Listen to the current playing song
final duration = assetsAudioPlayer.current.value.duration;
```

### ⏳ Current position (in seconds)

```Dart
assetsAudioPlayer.currentPosition //ValueObservable<Duration>

//retrieve directly the current song position
final Duration position = assetsAudioPlayer.currentPosition.value;

return StreamBuilder(
    stream: assetsAudioPlayer.currentPosition,
    builder: (context, asyncSnapshot) {
        final Duration duration = asyncSnapshot.data;
        return Text(duration.toString());
    }),
```

or use a PlayerBuilder !

```dart
PlayerBuilder.currentPosition(
     player: _assetsAudioPlayer,
     builder: (context, duration) {
       return Text(duration.toString());
     }
)
```

or Player Builder Extension

```dart
_assetsAudioPlayer.builderCurrentPosition(
     builder: (context, duration) {
       return Text(duration.toString());
     }
)
```

### ▶ IsPlaying

boolean observable representing the current mediaplayer playing state

```Dart
assetsAudioPlayer.isPlaying // ValueObservable<bool>

//retrieve directly the current player state
final bool playing = assetsAudioPlayer.isPlaying.value;

//will follow the AssetsAudioPlayer playing state
return StreamBuilder(
    stream: assetsAudioPlayer.isPlaying,
    builder: (context, asyncSnapshot) {
        final bool isPlaying = asyncSnapshot.data;
        return Text(isPlaying ? "Pause" : "Play");
    }),
```

or use a PlayerBuilder !

```dart
PlayerBuilder.isPlaying(
     player: _assetsAudioPlayer,
     builder: (context, isPlaying) {
       return Text(isPlaying ? "Pause" : "Play");
     }
)
```

or Player Builder Extension

```dart
_assetsAudioPlayer.builderIsPlaying(
     builder: (context, isPlaying) {
       return Text(isPlaying ? "Pause" : "Play");
     }
)
```

### 🔊 Volume

Change the volume (between 0.0 & 1.0)

```Dart
assetsAudioPlayer.setVolume(0.5);
```

The media player can follow the system "volume mode" (vibrate, muted, normal)
Simply set the `respectSilentMode` optional parameter as `true`

```dart
_player.open(PLAYABLE, respectSilentMode: true);
```

https://developer.android.com/reference/android/media/AudioManager.html?hl=fr#getRingerMode()

https://developer.apple.com/documentation/avfoundation/avaudiosessioncategorysoloambient

Listen the volume

```dart
return StreamBuilder(
    stream: assetsAudioPlayer.volume,
    builder: (context, asyncSnapshot) {
        final double volume = asyncSnapshot.data;
        return Text("volume : $volume");
    }),
```

or use a PlayerBuilder !

```dart
PlayerBuilder.volume(
     player: _assetsAudioPlayer,
     builder: (context, volume) {
       return Text("volume : $volume");
     }
)
```

### ✋ Finished

Called when the current song has finished to play,

it gives the Playing audio that just finished

```Dart
assetsAudioPlayer.playlistAudioFinished //ValueObservable<Playing>

assetsAudioPlayer.playlistAudioFinished.listen((Playing playing){

})
```

Called when the complete playlist has finished to play

```Dart
assetsAudioPlayer.playlistFinished //ValueObservable<bool>

assetsAudioPlayer.playlistFinished.listen((finished){

})
```

### 🔁 Looping

```Dart
final LoopMode loopMode = assetsAudioPlayer.loop;
// possible values
// LoopMode.none : not looping
// LoopMode.single : looping a single audio
// LoopMode.playlist : looping the fyll playlist

assetsAudioPlayer.setLoopMode(LoopMode.single);

assetsAudioPlayer.loopMode.listen((loopMode){
    //listen to loop
})

assetsAudioPlayer.toggleLoop(); //toggle the value of looping
```

### 🏃 Play Speed

```Dart
assetsAudioPlayer.setPlaySpeed(1.5);

assetsAudioPlayer.playSpeed.listen((playSpeed){
    //listen to playSpeed
})

//change play speed for a particular Audio

Audio audio = Audio.network(
    url,
    playSpeed: 1.5
);
assetsAudioPlayer.open(audio);
```

### 🎙️ Pitch

```Dart
assetsAudioPlayer.setPitch(1.2);

assetsAudioPlayer.pitch.listen((pitch){
    //listen to pitch
})

//change pitch for a particular Audio

Audio audio = Audio.network(
    url,
    pitch: 1.2
);
assetsAudioPlayer.open(audio);
```

# Error Handling

By default, on playing error, it stop the audio

BUT you can add a custom behavior

```dart
_player.onErrorDo = (handler){
  handler.player.stop();
};
```

Open another audio

```dart
_player.onErrorDo = (handler){
  handler.player.open(ANOTHER_AUDIO);
};
```

Try to open again on same position

```dart
_player.onErrorDo = (handler){
  handler.player.open(
      handler.playlist.copyWith(
        startIndex: handler.playlistIndex
      ),
      seek: handler.currentPosition
  );
};
```

## Custom errors

Add a custom error (e.g. when you use a custom stream)

```dart
class MyCustomError extends AssetsAudioPlayerCustomError {
  MyCustomError({required super.message});
}
```

Then you can catch the error and handle it in whatever way you want

Try to open again on same position

```dart
_player.onErrorDo = (handler){
   if (handler.error is MyCustomError) {
      // TODO: Handle error
    }
};
```

# Network Policies (android/iOS/macOS)

Android only allow HTTPS calls, you will have an error if you're using HTTP,
don't forget to add INTERNET permission and seet `usesCleartextTraffic="true"` in your **AndroidManifest.xml**

```
<?xml version="1.0" encoding="utf-8"?>
<manifest ...>
    <uses-permission android:name="android.permission.INTERNET" />
    <application
        ...
        android:usesCleartextTraffic="true"
        ...>
        ...
    </application>
</manifest>
```

iOS only allow HTTPS calls, you will have an error if you're using HTTP,
don't forget to edit your **info.plist** and set `NSAppTransportSecurity` to `NSAllowsArbitraryLoads`

```
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
```

To enable http calls on macOs, you have to add input/output calls capabilities into `info.plist`

```
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
<key>UIBackgroundModes</key>
<array>
    <string>audio</string>
    <string>fetch</string>
</array>
<key>com.apple.security.network.client</key>
<true/>
```

and in your

`Runner/DebugProfile.entitlements`

add

```
<key>com.apple.security.network.client</key>
<true/>
```

Complete `Runner/DebugProfile.entitlements`

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>com.apple.security.app-sandbox</key>
	<true/>
	<key>com.apple.security.cs.allow-jit</key>
	<true/>
	<key>com.apple.security.network.server</key>
	<true/>
	<key>com.apple.security.network.client</key>
	<true/>
</dict>
</plist>
```

# 🎶 Musics

All musics used in the samples came from https://www.freemusicarchive.org/
# Flutter-AssetsAudioPlayer
