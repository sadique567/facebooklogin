import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Twitter Login"), centerTitle: true),
      body: Obx(() {
        final user = controller.currentUser.value;

        // 🔴 NOT LOGGED IN
        if (user == null) {
          return Center(
            child: ElevatedButton(
              onPressed: controller.loginWithTwitter,
              child: const Text("Login with Twitter"),
            ),
          );
        }

        // 🟢 LOGGED IN
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// PROFILE IMAGE
              CircleAvatar(
                radius: 100,
                backgroundImage: user.photoURL != null
                    ? NetworkImage(user.photoURL!)
                    : null,
                child: user.photoURL == null
                    ? const Icon(Icons.person, size: 40)
                    : null,
              ),

              const SizedBox(height: 16),

              /// NAME
              Text(
                user.displayName ?? "No Name",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              /// EMAIL
              Text(user.email ?? "Email not provided"),

              const SizedBox(height: 20),

              /// FULL USER DATA CARD
              // Card(
              //   elevation: 4,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(12),
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.all(16),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [

              //         _row("UID", user.uid),
              //         _row("Provider ID", user.providerData.first.providerId),
              //         _row("Display Name", user.displayName),
              //         _row("Email", user.email),
              //         _row("Phone", user.phoneNumber),
              //         _row("Photo URL", user.photoURL),
              //         _row("Email Verified", user.emailVerified.toString()),
              //         _row("Anonymous", user.isAnonymous.toString()),
              //         _row(
              //           "Account Created",
              //           user.metadata.creationTime.toString(),
              //         ),
              //         _row(
              //           "Last Sign In",
              //           user.metadata.lastSignInTime.toString(),
              //         ),

              //       ],
              //     ),
              //   ),
              // ),
              const SizedBox(height: 25),

              /// LOGOUT BUTTON
              ElevatedButton(
                onPressed: controller.logout,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text("Logout"),
              ),
            ],
          ),
        );
      }),
    );
  }

  /// 🔹 Reusable row widget
  Widget _row(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              "$title :",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(flex: 5, child: Text(value ?? "N/A")),
        ],
      ),
    );
  }
}

// import 'package:fblogin/app/module/home/controller.dart';
// import 'package:fblogin/app/service/facebookOAuthService.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get.dart';

// class HomeView extends GetView<HomeController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home Screen"),
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () async {
//               await controller.logoutFromFacebook();
//               Get.snackbar("Success", "Logged out successfully");
//               // agar login screen pe bhejna ho
//               // Get.offAllNamed(Routes.LOGIN);
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Row(
//             children: [
//               ElevatedButton(
//                 onPressed: () async {
//                   controller.loginWithTwitter();
//                 },
//                 child: Text("🪁 Login with Twitter"),
//               ),
//               SizedBox(width: 25),
//               ElevatedButton(
//                 onPressed: () {
//                   controller.logoutFromTwitter();
//                 },
//                 child: Text("Logout"),
//               ),
//             ],
//           ),
//           SizedBox(height: 15),
//           ElevatedButton(
//             onPressed: () async {
//               final userCredential = await signInWithFacebook();
//               if (userCredential != null) {
//                 print('Login success: ${userCredential.user?.email}');
//               } else {
//                 print('Login failed');
//               }
//               // signInWithFacebook();
//               // Get.toNamed(Routes.FACEBOOK_LOGIN);
//             },
//             child: Text("Login with facebook"),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // flutter run --verbose
