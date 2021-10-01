// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:get/get.dart';
//
// import 'add_new_task_screen.dart';
// import 'main_screen.dart';
//
// class NewMainScreen extends StatefulWidget {
//   NewMainScreen({this.taskName, this.taskDuration});
//   String? taskName;
//   String? taskDuration;
//
//   @override
//   _NewMainScreenState createState() => _NewMainScreenState();
// }
//
// class _NewMainScreenState extends State<NewMainScreen> {
//   List<Color> cardColor = [Colors.white, Colors.white, Colors.white];
//   Color setColor() {
//     return Colors.blueGrey;
//   }
//
//   void getNewGoal() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     //newTaskName = prefs.getString('name')!;
//     //newTaskDuration = prefs.getString('duration')!;
//   }
//
//   List<bool> selected = [false, false, false];
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SingleChildScrollView(
//                 child: Center(
//                   child: Column(
//                     children: [
//                       Container(
//                         child: Text(
//                           'Select a Goal to Track Progress',
//                           style: TextStyle(
//                               color: Colors.redAccent,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 50),
//                         child: SizedBox(
//                           width: 300,
//                           height: 100,
//                           child: GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 if (!selected[1] && !selected[2]) {
//                                   selected[0] = !selected[0];
//                                   if (selected[0]) {
//                                     cardColor[0] = setColor();
//                                   } else {
//                                     cardColor[0] = Colors.white;
//                                   }
//                                 } else {
//                                   Fluttertoast.showToast(
//                                       msg:
//                                           'You can select only one Task at a time');
//                                 }
//                               });
//                             },
//                             child: Card(
//                               elevation: 20,
//                               color: cardColor[0],
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text('Wake up every day at 6 in the morning'),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 50),
//                         child: SizedBox(
//                           width: 300,
//                           height: 100,
//                           child: GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 selected[2] = !selected[2];
//                                 // if (!selected[0] && !selected[1]) {
//                                 //   selected[2] = !selected[2];
//                                 //   if (selected[2]) {
//                                 //     cardColor[2] = setColor();
//                                 //   } else {
//                                 //     cardColor[2] = Colors.white;
//                                 //   }
//                                 // } else {
//                                 //   Fluttertoast.showToast(
//                                 //       msg:
//                                 //           'You can select only one Task at a time');
//                                 // }
//                               });
//                             },
//                             child: Card(
//                               elevation: 20,
//                               color: cardColor[0],
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(widget.taskName!),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 50),
//                         child: SizedBox(
//                           width: 300,
//                           height: 100,
//                           child: GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 if (!selected[0]) {
//                                   selected[1] = !selected[1];
//                                   if (selected[1]) {
//                                     cardColor[1] = setColor();
//                                   } else {
//                                     cardColor[1] = Colors.white;
//                                   }
//                                 } else {
//                                   Fluttertoast.showToast(
//                                       msg:
//                                           'You can select only one Task at a time');
//                                 }
//                               });
//                             },
//                             child: Card(
//                               elevation: 20,
//                               color: cardColor[1],
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text('Add new Task'),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(top: 100),
//                         child: SizedBox(
//                           width: 100,
//                           child: TextButton(
//                               style: ButtonStyle(
//                                   backgroundColor: MaterialStateProperty.all(
//                                       Colors.redAccent)),
//                               child: Text(
//                                 'Next',
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                               onPressed: () async {
//                                 SharedPreferences prefs =
//                                     await SharedPreferences.getInstance();
//                                 print(prefs.getString('name'));
//                                 print(selected[2]);
//                                 if (selected[0] || selected[2]) {
//                                   Get.to(() => MainScreen());
//                                 } else if (selected[1]) {
//                                   // Get.to(() => NewTaskScreen());
//                                   Navigator.pushReplacement(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               NewTaskScreen()));
//                                 }
//                               }),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
