import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

Future<UserCredential?> signInWithFacebook() async {
  try {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData(
        fields: "id,name,email,picture.width(200),first_name,last_name",
      );
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.tokenString);

      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      debugPrint("USER ID: ${userData['id']}");
      debugPrint("NAME: ${userData['name']}");
      debugPrint("EMAIL: ${userData['email']}");
      debugPrint("FIRST NAME: ${userData['first_name']}");
      debugPrint("LAST NAME: ${userData['last_name']}");
      debugPrint("PHOTO: ${userData['picture']['data']['url']}");
      debugPrint("ACCESS TOKEN: ${result.accessToken!.tokenString}");
      // isLogin
      //     ? login(email: userData['email'], pass: '', isEmail: 2)
      //     : signUp(email: userData['email'], pass: '', isSocial: true);
    } else {
      Get.snackbar("Error", result.message ?? "Something went wrong");
    }
  } catch (e) {
    Get.snackbar("Error", e.toString());
  }
  return null;

  // try {
  //   // 1️⃣ Facebook login
  //   final LoginResult result = await FacebookAuth.instance.login(
  //     permissions: ['email', 'public_profile'],
  //   );

  //   // 2️⃣ Status check (MOST IMPORTANT)
  //   if (result.status != LoginStatus.success) {
  //     print('Facebook login failed');
  //     print('Status: ${result.status}');
  //     print('Message: ${result.message}');
  //     return null;
  //   }

  //   // 3️⃣ Access token null check
  //   final accessToken = result.accessToken;
  //   if (accessToken == null) {
  //     print('Facebook access token is null');
  //     return null;
  //   }

  //   // 4️⃣ Create Firebase credential
  //   final OAuthCredential credential =
  //       FacebookAuthProvider.credential(accessToken.tokenString);

  //   // 5️⃣ Sign in with Firebase
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // } catch (e) {
  //   print('Facebook login error: $e');
  //   return null;
  // }
}

// Future<UserCredential> signInWithFacebook() async {
//   // 1️⃣ Trigger Facebook login
//   final LoginResult loginResult = await FacebookAuth.instance.login(
//     permissions: ['email', 'public_profile'],
//   );

//   // 2️⃣ Check login status
//   if (loginResult.status != LoginStatus.success) {
//     throw Exception(loginResult.message ?? 'Facebook login failed');
//   }

//   // 3️⃣ Get access token
//   final AccessToken accessToken = loginResult.accessToken!;

//   // 4️⃣ Create Firebase credential
//   final OAuthCredential facebookAuthCredential =
//       FacebookAuthProvider.credential(accessToken.tokenString);

//   // 5️⃣ Sign in to Firebase
//   return FirebaseAuth.instance.signInWithCredential(
//     facebookAuthCredential,
//   );
// }

// Future<UserCredential> signInWithFacebook() async {
//   // Trigger the sign-in flow
//   final LoginResult loginResult = await FacebookAuth.instance.login();

//   // Create a credential from the access token
//   final OAuthCredential facebookAuthCredential =
//       FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

//   // Once signed in, return the UserCredential
//   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
// }
