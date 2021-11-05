import 'package:dribbble_ui_design/app/combines/colors.dart';
import 'package:dribbble_ui_design/app/views/bank/bank_page.dart';
import 'package:dribbble_ui_design/app/views/favourite/favourite_page.dart';
import 'package:dribbble_ui_design/app/views/menu/menu_page.dart';
import 'package:dribbble_ui_design/fav_controller.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavPage extends StatefulWidget {
  FavPage({Key? key}) : super(key: key);

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  var tabIndex = 0;
  void changeTabIndex(int index) {
    setState(() {
      tabIndex = index;
    });

    print(tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: tabIndex,
        children: [
          MenuPage(),
          BankPage(),
          FavouritePage(),
        ],
      ),
      floatingActionButton: FabCircularMenu(
        fabChild: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        fabColor: Colors.brown[500],
        fabOpenColor: pabBackgroundColor,
        ringColor: pablightColor,
        ringWidth: 220,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.orange[100],
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              onPressed: () {
                print('Home click');
                // Get.to(BankPage());
                changeTabIndex(0);
              },
              icon: Icon(
                Icons.home,
                color: pabDarkColor,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.orange[100],
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              onPressed: () {
                print('Setting click');
                changeTabIndex(1);
              },
              icon: Icon(
                Icons.settings,
                color: pabDarkColor,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.orange[100],
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              onPressed: () {
                print('Profile click');
                changeTabIndex(2);
              },
              icon: Icon(
                Icons.account_circle_rounded,
                color: pabDarkColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
