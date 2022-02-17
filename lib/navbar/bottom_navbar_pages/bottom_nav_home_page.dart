import 'package:flutter/material.dart';
import 'package:raspberrypistreamer/lists/infinite_scrolling_list.dart';
import 'package:raspberrypistreamer/pages/connect_page.dart';

class BottomNavHomePage extends StatefulWidget {
  const BottomNavHomePage({Key? key}) : super(key: key);

  @override
  _BottomNavHomePageState createState() => _BottomNavHomePageState();
}

class _BottomNavHomePageState extends State<BottomNavHomePage> {
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
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 250, maxWidth: 250),
                child: const PlacesList(),
              ),
              const SizedBox(height: 80,),
              const Text('Visiting a new place?'),
              ElevatedButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ConnectPage()));
              }, child: const Text('Connect'),),
            ],
          ),
        ));
  }
}
