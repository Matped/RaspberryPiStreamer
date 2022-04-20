class Queue{
  final String artist;
  final String song;

  const Queue({required this.artist, required this.song});

  factory Queue.fromJson(Map<String, dynamic> json){
    return Queue(artist: json['artist'], song: json['song']);
  }

}