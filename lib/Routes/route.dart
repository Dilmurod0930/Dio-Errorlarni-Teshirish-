import 'package:diohttp_app/Screen/Auth/splash_screen.dart';
import 'package:flutter/material.dart';

class MYRoute {
  Route? onGEnereteRoute(RouteSettings s) {
    var args = s.arguments;
    switch (s.name) {
      case "/splash":
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
