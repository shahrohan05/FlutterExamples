import 'package:flutter/material.dart';
import 'sliverList.dart';

import 'dart:math' as math;

class SliverPersistentHeaderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sliver Persistent Header Demo'),
        ),
        body: CollapsingList());
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(
      {@required this.minHeight,
      @required this.maxHeight,
      @required this.child});

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class CollapsingList extends StatelessWidget {
  SliverPersistentHeader makeHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: true,      
      delegate: _SliverAppBarDelegate(
          minHeight: 60.0,
          maxHeight: 200.0,
          child: GestureDetector(
            onTap: () {
              double offset = _scrollController.offset;
              print("tapped on_$headerText");
              print('Scroll point_$offset');
              if(headerText=='Header Section 2') {
                _scrollController.animateTo(
                 681.152,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInBack
                );
              }else if(headerText=='Header Section 1') {
                _scrollController.animateTo(
                 0.0,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInBack
                );
              }else if(headerText=='Header Section 3') {
                _scrollController.animateTo(
                 1571.324,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInBack
                );
              }else if(headerText=='Header Section 4') {
                _scrollController.animateTo(
                 2079.592,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInBack
                );
              }
            },
            child: Container(
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              boxShadow:[
                BoxShadow(
                  color: Colors.black38,
                  offset: new Offset(0.0, 1.0),
                  blurRadius: 5.0,
                  spreadRadius: 1.0
                )
              ]             
            ),
            child: Center(
              child: Text(headerText),
            ),
          ))  
          )
          
          
    );
  }

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        makeHeader('Header Section 1'),
        SliverGrid.count(
          crossAxisCount: 3,
          children: [
            Container(color: Colors.red, height: 150.0),
            Container(color: Colors.purple, height: 150.0),
            Container(color: Colors.green, height: 150.0),
            Container(color: Colors.orange, height: 150.0),
            Container(color: Colors.yellow, height: 150.0),
            Container(color: Colors.pink, height: 150.0),
            Container(color: Colors.cyan, height: 150.0),
            Container(color: Colors.indigo, height: 150.0),
            Container(color: Colors.blue, height: 150.0),
          ],
        ),
        makeHeader('Header Section 2'),
        SliverFixedExtentList(
          itemExtent: 150.0,
          delegate: SliverChildListDelegate(
            [
              Container(color: Colors.red),
              Container(color: Colors.purple),
              Container(color: Colors.green),
              Container(color: Colors.orange),
              Container(color: Colors.yellow),
            ]
          ),
        ),
        makeHeader('Header Section 3'),
        SliverGrid(
          gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.teal[100 * (index % 9)],
              child: new Text('Grid item $index'),
            );
          },
          childCount: 20
          ),
        ),
        makeHeader('Header Section 4'),
        SliverList(
          delegate: SliverChildListDelegate(
              [
              Container(color: Colors.pink, height: 150.0),
              Container(color: Colors.cyan, height: 150.0),
              Container(color: Colors.indigo, height: 150.0),
              Container(color: Colors.blue, height: 150.0),
              Container(color: Colors.red, height: 150.0),
              Container(color: Colors.purple, height: 150.0),
              Container(color: Colors.green, height: 150.0),
              Container(color: Colors.orange, height: 150.0),
              Container(color: Colors.yellow, height: 150.0),
            ],
          ),
        )
      ],
    );
  }
}
