import 'package:fblogin/app/module/facebooklogin/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class FbView extends GetView<FbController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Facebook Login")),

      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text("Login with Facebook"),
        ),
      ),
    );
  }
}
