import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PlacesList extends StatefulWidget {
  const PlacesList({Key? key}) : super(key: key);

  @override
  _PlacesListState createState() => _PlacesListState();
}

class _PlacesListState extends State<PlacesList> {
  List placesList = [];

  Future<void> fetchData() async {
    const apiUrl = 'https://jsonplaceholder.typicode.com/photos';

    final response = await http.get(Uri.parse(apiUrl));
    final data = json.decode(response.body);

    setState(() {
      placesList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: placesList.isEmpty
            ? Center(
                child: ElevatedButton(
                  child: const Text('Load Data'),
                  onPressed: fetchData,
                ),
              )
            // The ListView that displays photos
            : ListView.builder(
                itemCount: placesList.length,
                itemBuilder: (BuildContext ctx, index) {
                  return ListTile(
                    leading: Image.network(
                      placesList[index]["thumbnailUrl"],
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                    title: Text(placesList[index]['title']),
                    subtitle: Text('Photo ID: ${placesList[index]["id"]}'),
                  );
                },
              ),
      ),
    );
  }
}
