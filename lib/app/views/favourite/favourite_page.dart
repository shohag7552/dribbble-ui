import 'package:dribbble_ui_design/app/animation/transform.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ShakeTransition(
            child: Text(
              'Favourite Page',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
