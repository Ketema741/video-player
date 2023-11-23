import 'package:flutter/material.dart';

import '../../src/video/presentation/screen/splash_screen.dart';


class AppRouter {
  //main menu
  static const String home = '/videos';
  static const String splash = '/';
 
  

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
     default:
        throw  Exception('Route not found!');
    }
  }
}
