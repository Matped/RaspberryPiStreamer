import 'package:raspberrypistreamer/models/current_song_model.dart';
import 'package:raspberrypistreamer/services/current_song_service.dart';

import 'package:flutter/material.dart';

import 'package:raspberrypistreamer/pages/connect_page.dart';

class BottomNavHomePage extends StatefulWidget {
  const BottomNavHomePage({Key? key}) : super(key: key);

  @override
  _BottomNavHomePageState createState() => _BottomNavHomePageState();
}

class _BottomNavHomePageState extends State<BottomNavHomePage> {
  late Future<CurrentSong> _currentSong;

  @override
  void initState() {
    super.initState();
    _currentSong = fetchCurrentSong();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: FutureBuilder<CurrentSong>(
            future: _currentSong,
            builder: (context, snapshot){
              if (snapshot.hasData) {
                return Text(snapshot.data!.songName);
              } else {
                return Text('${snapshot.error}');
              }
            },
          ),
        ));
  }
}
