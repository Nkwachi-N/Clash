import 'package:just_audio/just_audio.dart';

class AudioService {
  final player = AudioPlayer();


  bool playing(String? url) => player.playing && player.getMusic() == url;

  void stopMusic(){
    if (player.playing) {
      player.stop();
    }
  }

}

extension PlayerUtil on AudioPlayer {
  String? getMusic() {
    final ProgressiveAudioSource? audioSource =
    this.audioSource as ProgressiveAudioSource?;

    return audioSource?.uri.toString();
  }
}
