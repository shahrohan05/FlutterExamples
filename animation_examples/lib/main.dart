import 'package:flutter/material.dart';
import 'animatedBuilder.dart';
import 'SimultaneousAnimations.dart';
import 'slideAnimationSample.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

testFunction({@required int id, String name}) {
  
}

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Examples'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LogoAnimation()));
              },
              child: Text('Logo Animation'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LogoAnimationAW()));
              },
              child: Text('Logo Animation with Animated Widget'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder : (context) => AnimatedBuilderSample()));
              },
              child: Text('Animated Builder Sample'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder : (context) => SimultaneousAnimationsSample()));
              },
              child: Text('Simultaneous Animation Sample'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder : (context) => SlideAnimationSample()));
              },
              child: Text('Slide Animation Sample'),
            )
          ],
        ),
      ),
    );
  }
}


class LogoAnimation extends StatefulWidget {
  @override
  State<LogoAnimation> createState() {
    return _LogoAppState();
  }
}

class _LogoAppState extends State<LogoAnimation> with SingleTickerProviderStateMixin {
  
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {
          
        });
      });
      controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logo Animation Page')
      ),
      body: Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget {
 AnimatedLogo({Key key, Animation<double> animation})
  : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo()
      ),
    );
  }
}
/**Animated logo with Animated Widget */
class LogoAnimationAW extends StatefulWidget {
  @override
  State<LogoAnimationAW> createState() {
    return _LogoAppStateAW();
  }
}

class _LogoAppStateAW extends State<LogoAnimationAW> with SingleTickerProviderStateMixin {
  
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(
      new CurvedAnimation(
        parent: controller,
        curve: Curves.easeInCirc,
        reverseCurve: Curves.easeOutBack
      )
    )
      ..addStatusListener((state) {
        if(state == AnimationStatus.completed) {
          controller.reverse();
        } else if (state == AnimationStatus.dismissed) {
          controller.forward();
        }
      })
      ..addStatusListener((status) => print('$status'));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logo Animation with Animated Widget')
      ),
      body: Center(
      child: AnimatedLogo(animation: animation)
    ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}



