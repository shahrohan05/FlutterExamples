import 'package:flutter/material.dart';
import 'widgets/cart_button.dart';
import 'models/catalog.dart';
import 'widgets/product_square.dart';
import 'widgets/cart_page.dart';
import 'models/cart.dart';
import 'models/cart_model.dart';
import 'widgets/scoped_model_cart_page.dart';
import 'widgets/cart_provider.dart';
import 'models/cart_bloc.dart';
import 'models/cart_item.dart';

import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CartProvider(
      cartBlock: CartBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(title: 'Flutter Demo Home Page'),
        routes: <String, WidgetBuilder>{
          CartPage.routeName: (context) => CartPage(),
          ScopedModelCartPage.routeName: (context) => ScopedModelCartPage()
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final cartBloc = CartProvider.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: <Widget>[
            StreamBuilder<int>(
                stream: cartBloc.itemCount,
                initialData: 0,
                builder: (context, snapshot) => CartButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(CartPage.routeName);
                    },
                    itemCount: snapshot.data
                    ))
          ],
        ),
        body: ProductGrid());
  }
}

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartBloc = CartProvider.of(context);
    return GridView.count(
        crossAxisCount: 2,
        children: catalog.products.map((product) {
          return ProductSquare(
            product: product,
            onTap: () {
              cartBloc.addition.add(CartItem(1, product));
            },
          );
        }).toList());
  }
}
