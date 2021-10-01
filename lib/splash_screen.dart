import 'package:flutter/material.dart';
import 'package:habbittracker/main_screen.dart';
import 'package:habbittracker/select_habit_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'detail_screen.dart';
import 'on_boarding_screen.dart';
import 'dart:async';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () async {
      var prefs = await SharedPreferences.getInstance();
      if (prefs.getInt('goal') == 7 ||
          prefs.getInt('goal') == 21 ||
          prefs.getInt('goal') == 42 ||
          prefs.getInt('goal') == 84 ||
          prefs.getInt('goal') == 168) {
        Get.to(() => DetailScreen(
            habit: prefs.getString('task')!, days: prefs.getInt('goal')!));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => SelectHabitScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: Colors.white,
        child: Center(
          child: Image.asset('images/lo.png'),
        ),
      ),
    );
  }
}
