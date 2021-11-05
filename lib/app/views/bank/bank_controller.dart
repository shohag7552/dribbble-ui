import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BankController extends GetxController {
  var total = 0.obs;
  var money = 0.obs;
  List expenses = [
    {'name': 'Groceries', 'ammount': 500},
    {'name': 'Online Shopping', 'ammount': 100},
    {'name': 'Eating Out', 'ammount': 80},
    {'name': 'Bills', 'ammount': 50},
    {'name': 'Subscription', 'ammount': 100},
    {'name': 'Fees', 'ammount': 30},
  ];

  Map<String, double> dataMap = {
    "Groceries": 500,
    "Online Shopping": 100,
    "Eating Out": 80,
    "Bills": 50,
    "Subscription": 100,
    "Fees": 30,
  };

  List<Color> pieColors = [
    Colors.green,
    Colors.indigo,
    Colors.orange,
    Colors.blue,
    Colors.amber,
    Colors.red
  ];
}
