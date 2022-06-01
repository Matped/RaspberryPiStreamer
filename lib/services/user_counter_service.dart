import 'package:http/http.dart' as http;

incrementUser() async {
  final response = await http.post(Uri.parse('http://10.0.2.2:5000/incrementuser'));

  if (response.statusCode == 200) {
    return 'Successfully incremented user!';
  } else {
    throw Exception('Failed to increment user.');
  }
}

decrementUser() async {
  final response = await http.post(Uri.parse('http://10.0.2.2:5000/decrementuser'));

  if (response.statusCode == 200){
    return 'Succesfully decremented user!';
  } else {
    throw Exception('Failed to increment user.');
  }
}