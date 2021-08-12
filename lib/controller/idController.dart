import 'package:get/get_state_manager/get_state_manager.dart';

class IdController extends GetxController {
  late String id;
  void increment(data) {
    id = data;
    update();
  }
}
