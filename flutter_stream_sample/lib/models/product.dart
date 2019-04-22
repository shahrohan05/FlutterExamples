import 'dart:ui' show Color;

class Product {
  final int id;
  final String name;
  final Color color;

  const Product(this.id,this.name, this.color);

  @override
  int get hashCode => this.id;

  @override
  bool operator ==(other) => other is Product && other.hashCode == this.hashCode;
  

  @override
  String toString() => "$name (id=$id)";

}