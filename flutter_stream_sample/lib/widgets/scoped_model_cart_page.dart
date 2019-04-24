import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/cart_model.dart';


class ScopedModelCartPage extends StatelessWidget {
  static const routeName = '/scopedCart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: ScopedModelDescendant<CartModel>(
        builder: (context,child,cartModel) => cartModel != null
        ? /*ListView(
          children: cartModel.items.map(
            (item) => ItemTile(item)
          ).toList(),
        )*/
        ListView()
        : Center(
          child: Text('Empty',
            style: Theme.of(context).textTheme.display1,
          ),
        )
      ),
    );
  }
}