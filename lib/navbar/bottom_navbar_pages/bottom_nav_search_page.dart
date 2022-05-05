import 'package:flutter/material.dart';
import 'package:raspberrypistreamer/pages/search_page.dart';

class BottomNavSearchPage extends StatefulWidget {
  const BottomNavSearchPage({Key? key}) : super(key: key);

  @override
  _BottomNavSearchPageState createState() => _BottomNavSearchPageState();
}

class _BottomNavSearchPageState extends State<BottomNavSearchPage> {
  @override
  Widget build(BuildContext context) {
    return SearchPage();
  }
}
