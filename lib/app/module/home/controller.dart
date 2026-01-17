import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  Future<void> logoutFromFacebook() async {
    try {
      // 1️⃣ Firebase logout
      await FirebaseAuth.instance.signOut();

      // 2️⃣ Facebook logout (VERY IMPORTANT)
      await FacebookAuth.instance.logOut();

      // 3️⃣ Clear local storage (SharedPreferences)
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      print("FULL LOGOUT SUCCESS");
    } catch (e) {
      print("LOGOUT ERROR: $e");
    }

    // try {
    //   // Firebase logout
    //   await FirebaseAuth.instance.signOut();

    //   // Facebook logout
    //   await FacebookAuth.instance.logOut();

    //   print("LOGOUT SUCCESS");
    // } catch (e) {
    //   print("LOGOUT ERROR: $e");
    // }
  }
}
