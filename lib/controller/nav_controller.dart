import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class NavController extends GetxController {
  final index = 0.obs;
  void changeIndex(int i) => index.value = i;
}
