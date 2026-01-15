import 'package:fblogin/app/module/home/controller.dart';
import 'package:get/get.dart';

class Homebinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<HomeController>(HomeController());
  }
}
