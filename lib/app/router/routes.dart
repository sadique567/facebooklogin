part of 'pages.dart';

abstract class Routes {
  Routes._();
  static const HOME_SCREEN = _Path.HOME_SCREEN;
  static const FACEBOOK_LOGIN = _Path.FACEBOOK_LOGIN;
}

abstract class _Path {
  _Path._();
  static const HOME_SCREEN = "/home_screen";
  static const FACEBOOK_LOGIN = '/facebook';
}
