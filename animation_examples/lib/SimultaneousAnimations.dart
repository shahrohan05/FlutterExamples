import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5), 
        child: Image.asset('images/IMG_20181230_193337_149.jpg'),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.sizeAnimation, this.opacityAnimation});

  final Widget child;
  final Animation<double> sizeAnimation;
  final Animation<double> opacityAnimation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: sizeAnimation,
        child: child,
        builder: (context, child) => Opacity(
          opacity: opacityAnimation.value,
          child: Container(
              height: sizeAnimation.value,
              width: sizeAnimation.value,
              child: child,
            ),
        ) 
      ),
    );
  }
}

class SimultaneousAnimationsSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SimultaneousAnimationsSampleState();
  }
}

class _SimultaneousAnimationsSampleState extends State<SimultaneousAnimationsSample>
    with SingleTickerProviderStateMixin {
  Animation<double> sizeAnimation;
  Animation<double> opacityAnimation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    sizeAnimation = Tween<double>(begin: 0, end: 500).animate(controller);
    opacityAnimation = Tween<double>(begin: 0.1, end: 1).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Builder Sample')),
      body: Center(
          child: GrowTransition(child: ImageWidget(), sizeAnimation: sizeAnimation,opacityAnimation: opacityAnimation,)
        ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
