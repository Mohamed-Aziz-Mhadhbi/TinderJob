import 'package:flutter/material.dart';
import 'package:tinderjob/pages/error/no_internet_page.dart';
import 'package:tinderjob/pages/splash_page.dart';
import 'package:tinderjob/pages/undefinited_page.dart';
import 'package:tinderjob/pages/user/login_page.dart';
import 'package:tinderjob/routes/routes_constants.dart';
import '../pages/user/signUp_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutesConstants.splashScreenRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const SplashPage(),
      );
    case RoutesConstants.loginRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const LoginPage(),
      );
    case RoutesConstants.signUpRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const SignUpPage(),
      );
    case RoutesConstants.noInternetRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const NoInternetPage(),
      );
    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => UndefinitedPage(name: settings.name),
      );
  }
}
