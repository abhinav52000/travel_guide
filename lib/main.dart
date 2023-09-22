import 'package:flutter/material.dart';
import 'package:travel_guide/constants/colors.dart';
import 'package:travel_guide/directory/routes.dart';
import 'package:travel_guide/screen/splashscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColor.bgColor,
      ),
      initialRoute: SplashScreen.id,
      onGenerateRoute: generateRoute,
    );
  }
}
