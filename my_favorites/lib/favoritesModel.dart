
import 'package:scoped_model/scoped_model.dart';
import 'hero.dart';
import 'dart:collection';

class FavoritesModel extends Model {
    final List<HeroItem> _heroes = [];

    UnmodifiableListView<HeroItem> get heroes => UnmodifiableListView(_heroes);

    int get count => _heroes.length;

    void add(HeroItem hero) {
      _heroes.add(hero);
      notifyListeners();
    }

    void clear() {
      _heroes.clear();
    }
}