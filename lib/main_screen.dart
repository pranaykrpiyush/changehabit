// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/rendering.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:habbittracker/select_habit_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'constants.dart';
// import 'package:percent_indicator/percent_indicator.dart';
// import 'package:get/get.dart';
//
// import 'detail_screen.dart';
//
// class MainScreen extends StatefulWidget {
//   final String habit;
//   final int days;
//   MainScreen({required this.habit, required this.days});
//
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen> {
//   //final setDate = DateTime.now();
//
//   // var difference = 0;
//   final date2 = DateTime.now();
//   int difference = 0;
//   double progressPercent = 0.6;
//
//   getPercent() async {
//     var prefs = await SharedPreferences.getInstance();
// //    prefs.getInt('startDate');
//     int? setDate = prefs.getInt('startDate');
//
//     DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(setDate!);
//
//     difference = date2.difference(dateTime).inDays;
//     setState(() {
//       progressPercent = (difference / widget.days);
//     });
//
//     print("percent" + progressPercent.toString());
//     print(difference);
//   }
//
//   void printHabit() async {
//     var prefs = await SharedPreferences.getInstance();
//     //  print(prefs.getInt('goal'));
//     // print(prefs.getString('task'));
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     getPercent();
//     printHabit();
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 40.0, left: 20),
//                 child: Text(
//                   "Change your life",
//                   style: TextStyle(fontSize: 75, fontWeight: FontWeight.w800),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
//                 child: Text(
//                   'Be on top of your daily progress',
//                   textAlign: TextAlign.left,
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(20),
//                 child: Column(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         getPercent();
//                         Get.to(() => DetailScreen(
//                               habit: widget.habit,
//                               days: widget.days,
//                               percentage: (progressPercent * 100).toInt(),
//                             ));
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             padding: EdgeInsets.all(8),
//                             child: SizedBox(
//                               child: Center(
//                                   child: Text(
//                                 widget.habit,
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               )),
//                               width: 140,
//                               height: 30,
//                             ),
//                             decoration: BoxDecoration(
//                               color: Colors.black12,
//                               // border: Border.all(width: 1),
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(5),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 190,
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(8),
//                               ),
//                               child: LinearPercentIndicator(
//                                 percent: progressPercent,
//                                 lineHeight: 35,
//                                 center: Text(
//                                   (progressPercent * 100).toInt().toString() +
//                                       "%",
//                                   textAlign: TextAlign.start,
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 30),
//                                 ),
//                                 progressColor: Colors.blue[600],
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 300.0),
//                       child: SizedBox(
//                         width: 250,
//                         child: ElevatedButton(
//                           child: Text('Delete habit'),
//                           onPressed: () async {
//                             var prefs = await SharedPreferences.getInstance();
//                             prefs.remove('task');
//                             prefs.remove('goal');
//                             print(prefs.getString('task'));
//                             print(prefs.getString('goal'));
//                             Fluttertoast.showToast(
//                                 msg:
//                                     'Habit has been deleted. Choose a new habit to get going!');
//                             Get.off(() => SelectHabitScreen());
//                           },
//                           style: kButtonStyle,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 300.0),
//                       child: SizedBox(
//                         width: 250,
//                         child: ElevatedButton(
//                           child: Text('Change a new habit'),
//                           onPressed: () {
//                             Get.to(() => SelectHabitScreen());
//                           },
//                           style: kButtonStyle,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // CircularPercentIndicator(
// // radius: 150,
// // animation: true,
// // animationDuration: 4000,
// // restartAnimation: true,
// // reverse: true,
// // circularStrokeCap: CircularStrokeCap.round,
// // center: Text(
// // progressPercent.toString(),
// // style: TextStyle(
// // color: Colors.redAccent,
// // fontSize: 25,
// // fontWeight: FontWeight.w500),
// // ),
// // lineWidth: 15,
// // progressColor: Colors.redAccent,
// // percent: progressPercent / 100,
// // ),
