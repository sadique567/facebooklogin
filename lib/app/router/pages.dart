import 'package:fblogin/app/module/facebooklogin/binding.dart';
import 'package:fblogin/app/module/facebooklogin/view.dart';
import 'package:fblogin/app/module/home/binding.dart';
import 'package:fblogin/app/module/home/view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

part 'routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.HOME_SCREEN;

  static final routes = [
    GetPage(
      name: _Path.HOME_SCREEN,
      page: () => HomeView(),
      binding: Homebinding(),
    ),
    GetPage(
      name: _Path.FACEBOOK_LOGIN,
      page: () => FbView(),
      binding: FbBinding(),
    ),
  ];
}
