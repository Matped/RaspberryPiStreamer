import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:raspberrypistreamer/models/current_song_model.dart';

Future<CurrentSong> fetchCurrentSong() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:5000/currentlyplaying'));

  if (response.statusCode == 200) {
    return CurrentSong.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load current song');
  }
}