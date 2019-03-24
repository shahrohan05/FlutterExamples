import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class ScreenArgumets {
  final String title;
  final String message;

  ScreenArgumets(this.title, this.message);
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Route Test',
      theme: new ThemeData(
        primarySwatch: Colors.teal
      ),
      
      initialRoute: '/',
      routes: {
        '/' : (context) => FirstRoute(),
        SecondRoute.routeName : (context) => SecondRoute()
      },
      onGenerateRoute: (settings) {
        if(settings.name ==ThirdRoute.routeName) {
          final ScreenArgumets args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return ThirdRoute(title: args.title,message: args.message);
            }
          );
        }
      },
    );
  }
}



class SelectionButton extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: Text('Pick a hero'),
    );
  }
}

_navigateAndDisplaySelection(BuildContext context) async {
  final result = await Navigator.push(
    context, 
    MaterialPageRoute(builder: (context) => SelectionScreen()));
    
    if(result!=null) {
      Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("Picked Hero : $result"),));
    }
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Go to Route 2'),
              onPressed: () {
                Navigator.pushNamed(
                  context, 
                  '/second',
                  arguments: ScreenArgumets('Second Route', 'This is the message from the first route. Good Luck!'));
              },
            ),
            RaisedButton(
              child: Text('Go to Route 3'),
              onPressed: () {
                Navigator.pushNamed(
                  context, 
                  ThirdRoute.routeName,
                  arguments: ScreenArgumets('Third Route', 'These arguments are set using onRouteGenerator!')
                );
              },
            ),
            SelectionButton(),
            Padding(
              child:GestureDetector(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (_) {
                      return ImageScreen();
                    })
                  );
                },
                child: Hero(
                  tag: 'screenshotImage',
                  child: Image.asset('images/Screenshot_20190314-012221.jpg'),
                )
              ),
              padding: EdgeInsets.fromLTRB(120.0, 25.0, 120.0, 0.0)
            )
            
          ],
        )
        
        
      ),
    );
  }
}


class SecondRoute extends StatelessWidget {
  static const routeName = '/second';
  @override
  Widget build(BuildContext context) {
    final ScreenArgumets args =ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}

class ThirdRoute extends StatelessWidget {
  static const routeName = '/third';
  final String title;
  final String message;
  const ThirdRoute({
    Key key,
    @required this.title,
    @required this.message
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick an option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context, 'IRON MAN');
                },
                child: Text('IRON MAN'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context, 'HULK');
                },
                child: Text('HULK'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context, 'CAPTAIN MARVEL');
                },
                child: Text('CAPTAIN MARVEL'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'screenshotImage',
            child: Image.asset('images/Screenshot_20190314-012221.jpg'),
          )
        ),
      ),
      )
    );
  }
}