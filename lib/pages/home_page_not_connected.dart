import 'package:flutter/material.dart';

import 'package:raspberrypistreamer/pages/home_page_connected.dart';
import 'package:raspberrypistreamer/navbar/bottom_navbar_pages/bottom_nav_home_page.dart';

class HomePageNotConnected extends StatefulWidget {
  const HomePageNotConnected({Key? key}) : super(key: key);

  @override
  _HomePageNotConnectedState createState() => _HomePageNotConnectedState();
}

class _HomePageNotConnectedState extends State<HomePageNotConnected> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text('Connect to a hotspot to queue your music!'),
              const SizedBox(
                height: 50,
              ),
              const Text('Previously visited'),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    connectedCheck();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BottomNavHomePage()));
                  },
                  child: const Text('The Bar')),
              ConstrainedBox(
                constraints:
                    const BoxConstraints(maxHeight: 250, maxWidth: 250),
              ),
              const SizedBox(
                height: 80,
              ),
              const Text('Visiting a new place?'),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomNavHomePage()));
                },
                child: const Text('Connect'),
              ),
            ],
          ),
        ));
  }
}
