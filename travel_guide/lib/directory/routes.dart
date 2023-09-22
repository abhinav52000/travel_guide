import 'package:flutter/material.dart';
import 'package:travel_guide/screen/bottom_screen.dart';
import 'package:travel_guide/screen/home_screen.dart';
import 'package:travel_guide/screen/splashscreen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.id:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );

    case HomeScreen.id:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );

    case DetailScreen.id:
      return MaterialPageRoute(
        builder: (context) => const DetailScreen(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(child: Text('This page doesn\'t exist')),
        ),
      );
  }
}
