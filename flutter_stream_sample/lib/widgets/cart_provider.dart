import 'package:flutter/widgets.dart';
import '../models/cart_bloc.dart';

class CartProvider extends InheritedWidget {
  final CartBloc cartBlock;

  CartProvider({
    Key key,
    @required this.cartBlock,
    Widget child
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static CartBloc of(BuildContext context) =>
    (context.inheritFromWidgetOfExactType(CartProvider) as CartProvider)
    .cartBlock;

}