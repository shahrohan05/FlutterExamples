import 'package:flutter/material.dart';
import 'dart:convert';
import 'model/user.dart';

void main() {
  String jsonString = "{\"id\":1,\"name\":\"Bangali Baba\",\"address\":\"Bangal Ka Ghat\",\"email\":\"baba@bangal.com\"}";
  String jsonArrayString = "["
    +"{\"id\":1,\"name\":\"Bangali Baba\",\"address\":\"Bangal Ka Ghat\",\"email\":\"baba@bangal.com\"},"
    +"{\"id\":2,\"name\":\"Surti Manja\",\"address\":\"Surat Ka Ghat\",\"email\":\"manja@surat.com\"}"
    +"]";

  Map<String,dynamic>  data = jsonDecode(jsonString);

  print("${data['id']} data -> $data");

  Map userMap = jsonDecode(jsonString);

  User user = new User.fromJSON(userMap);

  print("User Data -> $user");

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            Text('TEST',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
    );
  }
}
