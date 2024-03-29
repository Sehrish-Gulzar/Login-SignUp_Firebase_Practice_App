import 'dart:async';

import 'package:flutter/material.dart';

import '../screens/Auth/login_screen.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      ),
    );
  }
}
