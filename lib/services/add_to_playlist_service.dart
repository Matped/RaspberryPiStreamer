import 'package:http/http.dart' as http;

addSongToPlaylist<String>(artist, song) async {
  final response = await http.post(Uri.parse('http://10.0.2.2:5000/addtolist/$artist/$song'));

  if (response.statusCode == 200) {
    return 'Successfully added song!';
  } else {
    throw Exception('Failed to add song.');
  }
}