import 'package:get/get_state_manager/get_state_manager.dart';

class MainPageController extends GetxController {
  var tabIndex = 0;
  var isDark = false;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
