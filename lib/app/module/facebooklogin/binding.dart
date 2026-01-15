import 'package:fblogin/app/module/facebooklogin/controller.dart';
import 'package:get/get.dart';

class FbBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<FbController>(FbController());
  }
  
}