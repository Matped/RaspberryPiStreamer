import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:raspberrypistreamer/models/search_model.dart';

late String songInput;

Stream<Search> updateSearch() => Stream.periodic(Duration(seconds: 5)).asyncMap((_) => fetchSearch(songInput));

Future<Search> fetchSearch(searchInput) async {
  songInput = searchInput;
  final response = await http.get(Uri.parse('http://10.0.2.2:5000/songinput/$songInput'));

  if (response.statusCode == 200) {
    return Search.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load current song.');
  }
}