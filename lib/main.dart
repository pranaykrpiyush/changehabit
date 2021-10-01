import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:habbittracker/on_boarding_screen.dart';

import 'package:habbittracker/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen = 0;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);

  runApp(GetMaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:
          initScreen == 0 || initScreen == null ? 'onBoard' : 'splash',
      routes: {
        'onBoard': (context) => OnBoardingScreen(),
        'splash': (context) => SplashScreen()
      },
    );
  }
}
//
//

// ItemSelectionController(
// child: ListView(
// children: List.generate(10, (int index) {
// return ItemSelectionBuilder(
// index: index,
// builder:
// (BuildContext context, int index, bool selected) {
// return Text('$index: $selected');
// },
// );
// }),
// ),
// ),
