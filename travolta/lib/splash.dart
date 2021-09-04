import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:travolta/controller.dart';
import 'package:travolta/home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = Get.put(Travolta());

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 6),
      () => Get.offAll(HomePage()),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blueAccent,
                Colors.cyan,
                Colors.cyanAccent,
                Colors.teal,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Travolta',
                style: TextStyle(
                  fontFamily: 'Satisfy',
                  fontSize: 60,
                  color: Colors.white,
                ),
              ),
              Lottie.asset('assets/transaction.json', repeat: false),
            ],
          ),
        ),
      ),
    );
  }
}
