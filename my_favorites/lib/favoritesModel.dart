
import 'package:scoped_model/scoped_model.dart';
import 'hero.dart';
import 'dart:collection';

class FavoritesModel extends Model {
    final List<Hero> _heroes = [];

    UnmodifiableListView<Hero> get heroes => UnmodifiableListView(_heroes);

    int get count => _heroes.length;

    void add(Hero hero) {
      _heroes.add(hero);
      notifyListeners();
    }
}