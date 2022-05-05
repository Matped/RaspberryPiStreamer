
import 'package:http/http.dart' as http;

addSong<String>(songId) async {
  final response = await http.post(Uri.parse('http://10.0.2.2:5000/queuesong/$songId'));

  if (response.statusCode == 200) {
    return 'Successfully added song!';
  } else {
    throw Exception('Failed add song.');
  }
}