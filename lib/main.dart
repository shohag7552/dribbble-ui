import 'package:dribbble_ui_design/NavBar/main_page.dart';
import 'package:dribbble_ui_design/app/views/bank/bank_page.dart';
import 'package:dribbble_ui_design/app/views/menu/menu_page.dart';
import 'package:dribbble_ui_design/fav_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FavPage(),
    );
  }
}
