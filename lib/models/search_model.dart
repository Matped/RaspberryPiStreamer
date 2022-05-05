class Search{
  final String track_id;
  final String track_artist;
  final String track_name;

  const Search({required this.track_id, required this.track_artist, required this.track_name});

  factory Search.fromJson(Map<String, dynamic> json){
    return Search(track_id: json['id'], track_artist: json['artist'], track_name: json['name']);
  }

}