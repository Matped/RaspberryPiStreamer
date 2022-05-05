import 'package:flutter/material.dart';
import 'package:raspberrypistreamer/models/search_model.dart';
import 'package:raspberrypistreamer/services/add_song_service.dart';
import 'package:raspberrypistreamer/services/add_to_playlist_service.dart';
import 'package:raspberrypistreamer/services/search_service.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            TextFormField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: 'Search for a song',
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  fetchSearch(searchController.text);

                },
                child: const Text('Search')),
            const SizedBox(
              height: 30,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 50, maxWidth: 500),
              child: Center(
                child: Row(
                  children: [
                    StreamBuilder<Search?>(
                      stream: updateSearch(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ElevatedButton(
                              onPressed: () {
                                addSong(snapshot.data!.track_id);
                                addSongToPlaylist(snapshot.data!.track_artist, snapshot.data!.track_name);
                              },
                              child: Text(
                                  '${snapshot.data!.track_artist} - ${snapshot.data!.track_name}'));
                        }
                        else{
                          return const Text('Waiting for search...');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
