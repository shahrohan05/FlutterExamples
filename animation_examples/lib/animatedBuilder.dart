import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5), 
        child: Image.asset('images/IMG_20180707_125618_163.jpg'),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        child: child,
        builder: (context, child) => Container(
              height: animation.value,
              width: animation.value,
              child: child,
            ),
      ),
    );
  }
}

class AnimatedBuilderSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedBuilderSampleState();
  }
}

class _AnimatedBuilderSampleState extends State<AnimatedBuilderSample>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween<double>(begin: 0, end: 500).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Builder Sample')),
      body: Center(
          child: GrowTransition(child: LogoWidget(), animation: animation)
        ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
