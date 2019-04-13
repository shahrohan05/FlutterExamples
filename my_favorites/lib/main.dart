import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'favoritesModel.dart';
import 'hero.dart';

void main() {
  final favorites = FavoritesModel();

  runApp(
    ScopedModel<FavoritesModel>(
      model: favorites,
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favorite Heroes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'All Heroes'),
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
      body: CustomScrollView(
        slivers: [
          SliverList(
          delegate: SliverChildBuilderDelegate((context,index) => HeroListItem(index) ),
        )
      
      ]
      )
    );
  }
}

class HeroListItem extends StatelessWidget {
  final int index;
  final HeroItem heroItem;
  HeroListItem(this.index, {Key key}) : heroItem = HeroItems[index % HeroItems.length];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(border: Border(
        bottom: BorderSide(
          color: Colors.black12,
          style: BorderStyle.solid
        )
      )),
      child: Row(
        children: <Widget>[
          Container(
              margin: EdgeInsets.fromLTRB(0, 0, 15.0, 0),
              child: CircleAvatar(
              backgroundImage: AssetImage(heroItem.image),
              backgroundColor: Colors.black12,
            ),
          ),
          Expanded(
            child: Text(
            heroItem.name,
            style: TextStyle(
              fontSize: 22.0,
              ),
            ),
            flex: 2,
          ),
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              // TODO: add to favs...
            },
          )
        ],
      ),
    );
  }

  
}

