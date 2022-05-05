
class CurrentSong {
  final String artist;
  final String songName;
  final int duration;
  final int progress;

   CurrentSong(
      {required this.artist, required this.songName, required this.duration, required this.progress});

  factory CurrentSong.fromJson(Map<String, dynamic> json) {
    return CurrentSong(
        artist: json['artist'],
        songName: json['song'],
        duration: json['duration_ms'],
        progress: json['progress_ms']);
  }

}
