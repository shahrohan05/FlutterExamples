import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'favoritesModel.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Heros'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: _FavoritesList(),
            ),
            Container(
              child: _FavoritesCount(),
            )
          ],
        ),
      ),
    );
  }
}

class _FavoritesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<FavoritesModel>(
      builder: (context, child, favorites) => ListView(
            children: favorites.heroes
                .map((heroItem) => Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(10.0, 5.0, 15.0, 5.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(heroItem.image),
                            backgroundColor: Colors.black12,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            heroItem.name,
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          flex: 2,
                        ),
                      ],
                    ))
                .toList(),
          ),
    );
  }
}

class _FavoritesCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.blue, style: BorderStyle.solid)
              )
            ),
            child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ScopedModelDescendant<FavoritesModel>(
                builder: (context, child, favorites) {
              int total = favorites.count;
              return Container(
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(
                        style: BorderStyle.solid, color: Colors.blue)),
                child: Text(
                  '$total',
                  style: TextStyle(color: Colors.blue, fontSize: 40.0),
                ),
              );
            })
          ],
        ),
      )),
    );
  }
}
