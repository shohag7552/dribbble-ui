import 'dart:developer';

import 'package:dribbble_ui_design/NavBar/main_page_controller.dart';
import 'package:dribbble_ui_design/app/views/cart/cart_page.dart';
import 'package:dribbble_ui_design/app/views/favourite/favourite_page.dart';
import 'package:dribbble_ui_design/app/views/home/home_page.dart';
import 'package:dribbble_ui_design/app/views/profile/profile_page.dart';
import 'package:dribbble_ui_design/app/views/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  MainPageController controller = Get.put(MainPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: IndexedStack(
          index: controller.tabIndex,
          children: [
            HomePage(),
            FavouritePage(),
            SearchPage(),
            CartPage(),
            ProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            navItem(
              image: 'assets/images/homesvg.svg',
              bgColor: Colors.white,
              index: 0,
            ),
            navItem(
              image: 'assets/images/favouriteui.svg',
              bgColor: Colors.white,
              index: 1,
            ),
            navItem(
              image: 'assets/images/search.svg',
              bgColor: Colors.black,
              index: 2,
            ),
            navItem(
              image: 'assets/images/cart.svg',
              bgColor: Colors.white,
              index: 3,
            ),
            navItem(
              image: 'assets/images/profile.svg',
              bgColor: Colors.white,
              index: 4,
            ),
          ],
        ),
      ),
    );
  }

  Widget navItem({String? image, Color? bgColor, int? index}) {
    return GestureDetector(
      onTap: () {
        controller.changeTabIndex(index!);
        log('${controller.tabIndex}');
        log('$index');
      },
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: SvgPicture.asset(
          image!,
          color: controller.tabIndex == index ? Colors.black : Colors.grey,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
