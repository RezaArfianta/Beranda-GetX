import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;

  var isDark = false.obs;
  void changeTheme() => isDark.value = !isDark.value;

  void increment() => counter.value + 1;
  void decrement() => counter.value - 1;
}
