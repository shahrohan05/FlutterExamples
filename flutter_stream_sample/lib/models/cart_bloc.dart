import 'cart.dart';
import 'cart_item.dart';
import 'product.dart';
import 'dart:async';
import 'package:rxdart/subjects.dart';



class CartBloc {
  final _cart = Cart();

  Sink<Product> get addition => _additioncontroller.sink;

  final _additioncontroller = StreamController<Product>();

  Stream<int> get itemCount => _itemCountSubject.stream;

  final _itemCountSubject = BehaviorSubject<int>();

  Stream<Cart> get cart => _cartSubject.stream;

  final _cartSubject = BehaviorSubject<Cart>();

  CartBloc() {
    _additioncontroller.stream.listen(_handle);
  }

  void _handle(Product product) {
    _cart.add(product);
    _itemCountSubject.add(_cart.itemCount);
    _cartSubject.add(_cart);
  }
}

