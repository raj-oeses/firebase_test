

import 'package:get/get.dart';

import '../../feature/app_widget.dart';
import '../../feature/auth/pages/signin_screen/pages/signin_screen.dart';
import '../../feature/auth/pages/signup_screen/pages/signup_screen.dart';

class AppRoutes {
  static const String SIGN_IN = '/signin';
  static const String SIGN_UP = '/signup';
  static const String MAP_SCREEN_ROUTE = '/map_screen_route';
  static const String APP_WIDGET = '/app_widget';
  static const String MIGRAINE_ROUTE = '/MIGRAINE_ROUTE';
  static const String MIGRAINE_RESULT_ROUTE = '/MIGRAINE_RESULT_ROUTE';

  /// List of the get pages
  ///
  static final getPages = [
    GetPage(name: SIGN_IN, page: () => const SignInScreen()),
    GetPage(name: SIGN_UP, page: () => const SignUpScreen()),
    GetPage(name: APP_WIDGET, page: () => const AppWidget()),
  ];
}
