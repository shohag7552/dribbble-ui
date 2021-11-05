import 'package:get/get.dart';

class FavController extends GetxController {
  var tabIndex = 0;
  void changeTabIndex(int index) {
    tabIndex = index;
    print(tabIndex);
    update();
  }
}
