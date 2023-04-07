import 'package:fire_base_demo/Fire_Base_Services/splash_services.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              child: Lottie.asset(
                  "assets/images/121327-loading-lottie-animation.json"))),
    );
  }
}
