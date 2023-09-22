import 'package:flutter/material.dart';
import 'package:travel_guide/constants/font_constants.dart';
import 'package:travel_guide/screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const id = 'Splash Screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  navigateToHome() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    // ignore: use_build_context_synchronously
    Navigator.popAndPushNamed(context, HomeScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('TRAVEL', style: AppTextStyle.logoStyle)),
    );
  }
}
