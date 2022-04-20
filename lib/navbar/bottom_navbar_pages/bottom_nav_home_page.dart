import 'package:flutter/material.dart';

import 'package:raspberrypistreamer/pages/home_page_connected.dart';
import 'package:raspberrypistreamer/pages/home_page_not_connected.dart';


bool isConnected = false;
void connectedCheck(){

  if(isConnected == false){
    isConnected = true;
  }
  else
  {
    isConnected = false;
  }

}




class BottomNavHomePage extends StatefulWidget {
  const BottomNavHomePage({Key? key}) : super(key: key);

  @override
  _BottomNavHomePageState createState() => _BottomNavHomePageState();
}

class _BottomNavHomePageState extends State<BottomNavHomePage> {


  @override
  Widget build(BuildContext context) {
    return isConnected ? HomePageConnected() : HomePageNotConnected();
  }
}
