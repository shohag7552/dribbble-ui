import 'package:flutter/material.dart';

class PieData {
  static List<Data> data = [
    Data(name: 'Groceries', price: 500, color: Colors.green),
    Data(name: 'Online Shopping', price: 100, color: Colors.indigo),
    Data(name: 'Eating Out', price: 80, color: Colors.orange),
    Data(name: 'Bills', price: 50, color: Colors.blue),
    Data(name: 'Subscription', price: 100, color: Colors.amber),
    Data(name: 'Fees', price: 30, color: Colors.red),
  ];
}

class Data {
  final String? name;
  final double? price;
  final Color? color;

  Data({this.name, this.price, this.color});
}
