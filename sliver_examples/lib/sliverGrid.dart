import 'package:flutter/material.dart';
import 'sliverList.dart';

class SliverGridDemo extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Sliver Grid Demo'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4
            ),
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                color: getRandomColor(),
                height: 150.0,
                margin: const EdgeInsets.all(0.4),
              );
            }),
          )
        ],
      ),
    );
  }

}


