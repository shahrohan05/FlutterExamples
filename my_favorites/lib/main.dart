import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'favoritesModel.dart';
import 'hero.dart';
import 'favoritesScreen.dart';

void main() {
  final favorites = FavoritesModel();

  runApp(ScopedModel<FavoritesModel>(model: favorites, child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favorite Heroes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'All Heroes'),
        '/favorites': (context) => FavoritesScreen()
      },
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
          actions: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
              child: IconButton(
                icon: Icon(Icons.favorite),
                color: Colors.redAccent,
                onPressed: () {
                  Navigator.pushNamed(context, '/favorites');
                },
              ),
            )
          ],
        ),
        body: CustomScrollView(slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => HeroListItem(index)),
          )
        ]));
  }
}

class HeroListItem extends StatelessWidget {
  final int index;
  final HeroItem heroItem;
  HeroListItem(this.index, {Key key})
      : heroItem = HeroItems[index % HeroItems.length];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: Colors.black12, style: BorderStyle.solid))),
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
          _FavoriteButton(heroItem: heroItem)
        ],
      ),
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  final HeroItem heroItem;

  _FavoriteButton({Key key, @required this.heroItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<FavoritesModel>(
        builder: (context, child, favorites) => IconButton(
            onPressed: () {
              if (!favorites.heroes.contains(heroItem)) {
                favorites.add(heroItem);
              } else {
                favorites.remove(heroItem);
              }
              print(favorites.heroes);
            },
            icon: favorites.heroes.contains(heroItem)
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border)));
  }
}
