import 'package:flutter/material.dart';

import 'package:raspberrypistreamer/navbar/bottom_navbar_pages/bottom_nav_home_page.dart';

import 'package:raspberrypistreamer/models/current_song_model.dart';
import 'package:raspberrypistreamer/models/queue_model.dart';
import 'package:raspberrypistreamer/pages/main_page.dart';

import 'package:raspberrypistreamer/services/queue_service.dart';
import 'package:raspberrypistreamer/services/current_song_service.dart';
import 'package:raspberrypistreamer/services/user_counter_service.dart';

class HomePageConnected extends StatefulWidget {
  const HomePageConnected({Key? key}) : super(key: key);

  @override
  _HomePageConnectedState createState() => _HomePageConnectedState();
}

class _HomePageConnectedState extends State<HomePageConnected> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  connectedCheck();
                  decrementUser();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainPage()));
                },
                child: const Text('Disconnect')),
            const SizedBox(
              height: 100,
            ),
            const Text('Connected to The Bar!'),
            const SizedBox(
              height: 50,
            ),
            const Text('Current playlist'),
            const SizedBox(
              height: 20,
            ),
            const Text(
                'The playlist is in no particular order, a song will randomly be picked from the playlist.'),
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 250, maxWidth: 500),
              child: StreamBuilder<List<Queue>>(
                  stream: updateQueue(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 25,
                              child: Column(
                                children: [
                                  Center(
                                    child: Row(
                                      children: [
                                        Text(snapshot.data![index].song),
                                        const Text(" | "),
                                        Text(snapshot.data![index].artist),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    } else {
                      return Text("${snapshot.error}");
                    }
                  }),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 50, maxWidth: 500),
              child: Center(
                child: Row(
                  children: [
                    StreamBuilder<CurrentSong>(
                      stream: updateSong(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                              '${snapshot.data!.songName} | ${snapshot.data!.artist}');
                        } else {
                          return Text('${snapshot.error}');
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
