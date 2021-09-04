import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travolta/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travolta',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: SplashPage(),
    );
  }
}
