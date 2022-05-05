import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:raspberrypistreamer/models/queue_model.dart';


Stream<List<Queue>> updateQueue() => Stream.periodic(Duration(seconds: 5)).asyncMap((_) => fetchCurrentQueue());

Future<List<Queue>> fetchCurrentQueue() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:5000/getplaylist'));

  if(response.statusCode == 200){
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((e) => Queue.fromJson(e)).toList();
  } else {
    throw Exception('Failed to get current queue.');
  }

}