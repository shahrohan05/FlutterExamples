import 'package:flutter/material.dart';
import 'sliverList.dart';

class SliverAppBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Sliver App Bar Demo'),
            backgroundColor: Colors.brown,
            expandedHeight: 200.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('images/1.jpg', fit: BoxFit.cover),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 150.0,
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  color: getRandomColor(),
                  margin: const EdgeInsets.all(0.4),
                );
            }),
          )
        ],
      ),
    );
  }
}