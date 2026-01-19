import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {





  Future<void> loginWithTwitter() async {    
    try {
      // Trigger the sign-in flow
      final twitterProvider = TwitterAuthProvider();

      // If you need to force OAuth 1.0 popup
      twitterProvider.setCustomParameters({'lang': 'en'});

      // Firebase sign in with provider
      final UserCredential twitterUser = await FirebaseAuth.instance
          .signInWithProvider(twitterProvider);

      final user = twitterUser.user;
      print("user : ${user!.displayName}");

      // Fetch Twitter email (if app has 'Request email from users' enabled)
      final String? email = user.email;
      final String? name = user.displayName;
      final String? photo = user.photoURL;

      debugPrint("TWITTER UID: ${user.uid}");
      debugPrint("NAME: $name");
      debugPrint("EMAIL: $email");
      debugPrint("PHOTO: $photo");

      // Your login / signup logic
      if (email != null) {
        print("Email is not null");
        // isLogin
        //     ? login(email: email, pass: '', isEmail: 2)
        //     : signUp(email: email, pass: '', isSocial: true);
      } else {
        Get.snackbar(
          "Email Missing",
          "Twitter did not return an email. Enable email permission in Twitter Developer Portal.",
        );
      }
    } catch (e) {
      print("telegram login Error : ${e.toString()}");
      if (e.toString().contains("web-context-canceled")) {
        Get.snackbar("Cancelled", "Twitter login cancelled by user");
      } else {
        Get.snackbar("Error 1", e.toString());
      }
    }
  }


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
