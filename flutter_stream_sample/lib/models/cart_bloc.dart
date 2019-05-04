import 'cart.dart';
import 'cart_item.dart';
import 'product.dart';
import 'dart:async';
import 'package:rxdart/subjects.dart';



class CartBloc {
  final _cart = Cart();

  Sink<CartItem> get addition => _additioncontroller.sink;

  final _additioncontroller = StreamController<CartItem>();

  Stream<int> get itemCount => _itemCountSubject.stream;

  final _itemCountSubject = BehaviorSubject<int>();

  Stream<Cart> get cart => _cartSubject.stream;

  List<CartItem> get cartItems => _cart.items;

  final _cartSubject = BehaviorSubject<Cart>();

  CartBloc() {
    _additioncontroller.stream.listen(_handle);
  }

  void _handle(CartItem cartItem) {
    _cart.add(cartItem.product, cartItem.count);
    _itemCountSubject.add(_cart.itemCount);
    _cartSubject.add(_cart);
  }
}

