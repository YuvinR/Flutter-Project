import 'dart:async';
import 'package:flutter/material.dart';
import 'package:splash/LoginScreen.dart';
import 'package:splash/LunchBuddies.dart';
import 'package:splash/UserProfile.dart';
import 'package:splashscreen/splashscreen.dart';

import 'SecondScreen.dart';

void main() {
  runApp(MyApp());
}

class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      imageBackground: AssetImage('assets/images/LoginUI_Screen.png'),
      seconds: 10,
      navigateAfterSeconds: new LoginScreen(),
      title: new Text(
        '',
        textScaleFactor: 2,
      ),
      image: new Image.asset('assets/images/LunchBuddies.png'),
      loadingText: Text(
        "Loading",
        style: TextStyle(color: Colors.white),
      ),
      photoSize: 100.0,
      loaderColor: Colors.blue,
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lunch Buddies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash2(),
      debugShowCheckedModeBanner: false,
    );
  }
}
