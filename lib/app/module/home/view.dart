import 'package:fblogin/app/module/home/controller.dart';
import 'package:fblogin/app/service/facebookOAuthService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await controller.logoutFromFacebook();
              Get.snackbar("Success", "Logged out successfully");

              // agar login screen pe bhejna ho
              // Get.offAllNamed(Routes.LOGIN);
            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final userCredential = await signInWithFacebook();
            if (userCredential != null) {
              print('Login success: ${userCredential.user?.email}');
            } else {
              print('Login failed');
            }
            // signInWithFacebook();
            // Get.toNamed(Routes.FACEBOOK_LOGIN);
          },
          child: Text("Login with facebookcee"),
        ),
      ),
    );
  }
}

// flutter run --verbose
