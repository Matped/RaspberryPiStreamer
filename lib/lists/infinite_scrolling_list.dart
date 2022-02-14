import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ScrollingList extends StatefulWidget {
  const ScrollingList({Key? key}) : super(key: key);

  @override
  _ScrollingListState createState() => _ScrollingListState();
}

class _ScrollingListState extends State<ScrollingList> {
  static const _listSize = 4;

  final visitedPlaces = [
    ElevatedButton(onPressed: (){}, child: const Text('Place1'),),
    ElevatedButton(onPressed: (){}, child: const Text('Place2'),),
    ElevatedButton(onPressed: (){}, child: const Text('Place3'),),
  ];




  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
