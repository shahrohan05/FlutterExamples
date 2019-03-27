import 'package:flutter/material.dart';

class SlideAnimationSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SlideAnimationSampleState();
  }
}

class _SlideAnimationSampleState extends State<SlideAnimationSample> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _slideOffsetAnimation;

  

  @override
  void initState() {
    super.initState();
    _controller =AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _slideOffsetAnimation = Tween<Offset>(begin: Offset(2.0, 0.0), end: Offset(0.0, 0.0)).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
        reverseCurve: Curves.ease
      )
    );
    _controller.forward();
    _controller.addStatusListener((status) {
        if(status==AnimationStatus.completed) {
          _controller.reverse();
        }else if(status==AnimationStatus.dismissed) {
          _controller.forward();
        }
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slide Animation Sample')
      ),
      body: Center(
        child: SlideTransition(position: _slideOffsetAnimation,child:  Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 250,
        width: 250,
        child: FlutterLogo(),
      ),),
      ),
    );
  }
}