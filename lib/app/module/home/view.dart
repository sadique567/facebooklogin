import 'package:fblogin/app/module/home/controller.dart';
import 'package:fblogin/app/router/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(Routes.HOME_SCREEN);
          },
          child: Text("Login with facebook"),
        ),
      ),
    );
  }
}
