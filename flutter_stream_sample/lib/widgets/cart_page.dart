import 'package:flutter/material.dart';
import '../models/cart.dart';
import '../models/cart_item.dart';
import '../utils/is_dark.dart';
import '../models/cart_bloc.dart';
import 'cart_provider.dart';

class CartPage extends StatelessWidget {
  CartPage();

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    CartBloc cartBloc = CartProvider.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Your Cart'),
        ),
        body: StreamBuilder<Cart>(
          stream: cartBloc.cart,
          initialData: Cart(),
          builder: (context, snapshot) => snapshot.data.items.isEmpty
              ? Center(
                  child: Text('Empty',
                      style: Theme.of(context).textTheme.display1),
                )
              : ListView(
                  children: snapshot.data.items.map((item) => ItemTile(item)).toList()),
        ));
  }
}

class ItemTile extends StatelessWidget {
  ItemTile(this.item);
  final CartItem item;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        color: isDark(item.product.color) ? Colors.white : Colors.black);

    return Container(
        color: item.product.color,
        child: ListTile(
            title: Text(item.product.name, style: textStyle),
            trailing: CircleAvatar(
                backgroundColor: const Color(0x33FFFFFF),
                child: Text(item.count.toString(), style: textStyle))));
  }
}