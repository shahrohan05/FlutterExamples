import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Staggered Animation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Staggered Animation Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this
    );
    _playAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    }on TickerCanceled {

    }
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          
        },
        child: Center(
          child: Container(
            width: 300.0,
            height: 300.0,
            decoration:  BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
                color: Colors.black.withOpacity(0.5)
              )
            ),
            child: StaggerAnimation(
              controller: _controller.view,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { _playAnimation(); },
        tooltip: 'Replay',
        child: Icon(Icons.replay),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({Key key, this.controller}):

   opacity = Tween<double>(
     begin: 0.0,
     end: 1.0
   ).animate(
     CurvedAnimation(
       parent: controller,
       curve: Interval(0.0, 0.100, curve: Curves.ease)
     )
   ),
   width = Tween<double>(
     begin: 50.0,
     end: 150.0
   ).animate(
     CurvedAnimation(
       parent: controller,
       curve: Interval(0.125, 0.250, curve: Curves.ease)
     )
   ),
   height = Tween<double>(
     begin: 50.0,
     end: 150.0
   ).animate(
     CurvedAnimation(
       parent: controller,
       curve: Interval(0.125, 0.250, curve: Curves.ease)
     )
   ),
   padding = Tween<EdgeInsets>(
     begin: const EdgeInsets.only(bottom: 16.0),
     end: const EdgeInsets.only(bottom: 75.0)
   ).animate(
     CurvedAnimation(
       parent: controller,
       curve: Interval(0.275, 0.350, curve: Curves.ease)
     )
   ),
   borderRadius = Tween<BorderRadius>(
     begin: BorderRadius.circular(4.0),
     end:  BorderRadius.circular(75.0)
   ).animate(
     CurvedAnimation(
       parent: controller,
       curve: Interval(0.375, 0.500, curve: Curves.ease)
     )
   ),
   color = ColorTween(
     begin: Colors.blue,
     end: Colors.orange
   ).animate(
     CurvedAnimation(
       parent: controller,
       curve: Interval(0.525, 0.750, curve: Curves.ease)
     )
   ),

   super(key: key);

  final Animation<double> controller;
  final Animation<double> opacity;
  final Animation<double> width;
  final Animation<double> height;
  final Animation<EdgeInsets> padding;
  final Animation<BorderRadius> borderRadius;
  final Animation<Color> color;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
      return Container(
        padding: padding.value,
        alignment: Alignment.bottomCenter,
        child: Opacity(
          opacity: opacity.value,
          child: Container(
            width: width.value,
            height: height.value,
            decoration: BoxDecoration(
              color: color.value,
              border: Border.all(
                color: Colors.indigo,
                width: 3.0
              ),
              borderRadius: borderRadius.value
            ),
          ),
        ),
      );
  }



  


}
