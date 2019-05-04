import 'package:flutter/material.dart';
import '../models/cart.dart';
import '../models/cart_item.dart';
import '../utils/is_dark.dart';
import '../models/cart_bloc.dart';
import 'cart_provider.dart';

import 'dart:async';

class CartPage extends StatelessWidget {
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    CartBloc cartBloc = CartProvider.of(context);
    List<CartItem> items = cartBloc.cartItems;
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Cart'),
        ),
        body: items.isEmpty
            ? Center(
                child:
                    Text('Empty', style: Theme.of(context).textTheme.display1),
              )
            : AnimatedList(
                key: _key,
                initialItemCount: items.length,
                itemBuilder:
                    (BuildContext context, int index, Animation animation) {
                  return FadeTransition(
                      opacity: animation,
                      child: ItemTile(items[index], cartBloc, _key, index));
                }));
  }
}

class ItemTile extends StatefulWidget {
  ItemTile(this.item, this.cartBloc, this.listKey, this.index);
  final CartItem item;
  final CartBloc cartBloc;
  final GlobalKey<AnimatedListState> listKey;
  final int index;

  @override
  State<StatefulWidget> createState() => ItemTileState();
}

class ItemTileState extends State<ItemTile>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  int _count = 0;

  final Tween<double> _countSizeTween = Tween(begin: 0.3, end: 1);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);

    _animationController.forward();
    _count = widget.item.count;
  }

  @override
  void didUpdateWidget(ItemTile oldWidget) {
    print("old widget count_$oldWidget.item.count");
    /*if (_count != oldWidget.item.count) {
      _animationController.reset();
      _animationController.forward();
    }*/
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    

    final textStyle = TextStyle(
        color: isDark(widget.item.product.color) ? Colors.white : Colors.black);

    return Container(
      color: widget.item.product.color,
      child: ListTile(
          title: Text(widget.item.product.name, style: textStyle),
          trailing: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ScaleTransition(
                  scale: _countSizeTween.animate(_animation),
                  child: CircleAvatar(
                      backgroundColor: const Color(0x33FFFFFF),
                      child:
                          Text(_count.toString(), style: textStyle)),
                ),
                Container(
                  child: IconButton(
                    color: Color.fromRGBO(1000, 0, 0, 0.7),
                    icon: Icon(Icons.remove_circle),
                    onPressed: () {
                      if (_count == 1) {
                        widget.listKey.currentState.removeItem(widget.index,
                            (BuildContext context,
                                Animation<double> animation) {
                          animation.addStatusListener((status) {
                            print('STATUS_$status');
                            //if(status==AnimationStatus.completed) {
                            widget.cartBloc.addition
                                .add(CartItem(-1, widget.item.product));
                            //}
                          });
                          return FadeTransition(
                            opacity: CurvedAnimation(
                                parent: animation, curve: Curves.easeOut),
                            child: SizeTransition(
                              sizeFactor: CurvedAnimation(
                                  parent: animation, curve: Curves.easeOut),
                              axisAlignment: 0.0,
                              child: widget,
                            ),
                          );
                        });
                      } else {
                        setState(() {
                          print("_count : $_count");
                          _count -= 1;
                          print("_count post: $_count");
                          widget.cartBloc.addition
                            .add(CartItem(-1, widget.item.product));  
                            _animationController.reset();
                            _animationController.forward();
                        });
                        
                      }
                    },
                  ),
                )
              ])),
    );
  }
}
