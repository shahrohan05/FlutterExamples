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
                  children: snapshot.data.items.map((item) => ItemTile(item,cartBloc)).toList()),
        ));
  }
}

class ItemTile extends StatelessWidget {
  ItemTile(this.item, this.cartBloc);
  final CartItem item;
  final CartBloc cartBloc;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        color: isDark(item.product.color) ? Colors.white : Colors.black);

    return Container(
        color: item.product.color,
        child: ListTile(
            title: Text(item.product.name, style: textStyle),
            trailing: 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircleAvatar(
                  backgroundColor: const Color(0x33FFFFFF),
                  child: Text(item.count.toString(), style: textStyle)
                  ),
                  Container(
                    child: IconButton(
                      color: Color.fromRGBO(1000, 0, 0, 0.6),
                      icon: Icon(Icons.remove_circle),
                      onPressed: () {
                        cartBloc.addition.add(CartItem(-1, item.product));
                      },
                    ),
                  )
                ]
                )
              ));

              
  }
}
