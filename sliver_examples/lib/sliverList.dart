import 'package:flutter/material.dart';
import 'dart:math';

class SliverListDemo extends StatefulWidget {
  @override
  SliverListDemoState createState() {
    return SliverListDemoState();
  }
}

class SliverListDemoState extends State<SliverListDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliver List Demo'),
      ),
      body: CustomScrollView(slivers: [
        SliverList(delegate:
            SliverChildBuilderDelegate((BuildContext context, int index) {
          return Container(
            color: getRandomColor(),
            height: 150.0,
            margin: const EdgeInsets.symmetric(vertical: 0.4,horizontal: 0.0)
          );
        })),
      ]),
    );
  }
}

Color getRandomColor() {
  var rng = new Random();
  int num = rng.nextInt(12);
  switch (num) {
    case 0:
      return Colors.pink;
    case 1:
      return Colors.black;
    case 2:
      return Colors.blue;
    case 3:
      return Colors.red;
    case 4:
      return Colors.purple;
    case 5:
      return Colors.teal;
    case 6:
      return Colors.yellow;
    case 7:
      return Colors.green;
    case 8:
      return Colors.indigo;
    case 9:
      return Colors.lightGreen;
    case 10:
      return Colors.lime;
    case 11:
      return Colors.orange;
    case 12:
      return Colors.lightBlue;
    default : 
      return Colors.red;
  }
}
