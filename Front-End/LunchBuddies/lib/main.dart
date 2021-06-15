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

class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 10,
      navigateAfterSeconds: new LoginScreen(),
      title: new Text(
        '',
        textScaleFactor: 2,
      ),
      image: new Image.asset('assets/images/LunchBuddies.png'),
      loadingText: Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.blue,
    );
  }
}

