import 'package:flutter/material.dart';
import 'package:flutter_puzzle_hack/routes/routes_name.dart';
import 'package:flutter_puzzle_hack/view/home_page/home_page.dart';

class Routes {
  static Route onGenerateRoute(RouteSettings settings) {
    // final Object? arguments = settings.arguments;

    Widget screen;
    switch (settings.name) {
      case RoutesName.homeRoute:
        screen = const HomePage();
        break;
      default:
        screen = const Scaffold();
        break;
    }
    return MaterialPageRoute(
      builder: (BuildContext context) => screen,
      settings: settings,
    );

    
  }


}
