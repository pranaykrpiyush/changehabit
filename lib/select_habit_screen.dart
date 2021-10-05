import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:habbittracker/detail_screen.dart';
import 'package:habbittracker/set_goal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:habbittracker/main_screen.dart';
import 'add_new_task_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:group_button/group_button.dart';
import 'constants.dart';

class SelectHabitScreen extends StatefulWidget {
  const SelectHabitScreen({Key? key}) : super(key: key);

  @override
  _SelectHabitScreenState createState() => _SelectHabitScreenState();
}

class _SelectHabitScreenState extends State<SelectHabitScreen> {
  List<Color> cardColor = [Colors.white, Colors.white];
  Color setColor() {
    return Colors.blueGrey;
  }

  List<String> habits = [
    "30 min walk",
    " No porn",
    "Write 30 min a day",
    "Intraday Profit",
    "Sleep 6-7 hrs daily",
    "Read an hour daily",
    "Do charity",
    "Meditate Daily",
    "Wake up before sunrise",
    "Other Habit",
  ];
  List<bool> selected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  String getHabit() {
    for (int i = 0; i < 10; i++) {
      print(selected[i]);
      if (selected[i] == true) {
        return habits[i];
      }
    }
    return "a";
  }

  bool checkSelected() {
    for (int i = 0; i < 10; i++) {
      if (selected[i] == true) {
        return false;
      }
    }
    return true;
  }

  setSelectedButtonColor(int j) {
    print(selected[j]);
    for (int i = 0; i < 10; i++) {
      if (selected[i] == true) {
        setState(() {
          buttonColor[i] = unselectedColor;
        });
      }
      selected[i] = false;
    }
    selected[j] = true;

    //if (selected[j]) {
    setState(() {
      buttonColor[j] = selectedColor;
    });
    //selected[j] = !selected[j];
    return;
  }
  //for (int i = 0; i < 10; i++) {
  // if (selected[i] == true) {
  //      return;
  //}
  //}

  //setState(() {
  // buttonColor[j] = selectedColor;
  //});
  //selected[j] = !selected[j];

  Color unselectedColor = Colors.black12;
  Color? selectedColor = Colors.blue[800];
  List buttonColor = [
    Colors.black12,
    Colors.black12,
    Colors.black12,
    Colors.black12,
    Colors.black12,
    Colors.black12,
    Colors.black12,
    Colors.black12,
    Colors.black12,
    Colors.black12,
  ];
  var counter = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'First Step to Boost Your Life',
                      style:
                          TextStyle(fontSize: 65, fontWeight: FontWeight.w800),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Choose Habit',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 10, right: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 140,
                                  child: TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              buttonColor[0]),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6))),
                                    ),
                                    child: Text(
                                      'Daily 30 min walk',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () {
                                      setSelectedButtonColor(0);
                                      //selected[0] = !selected[0];
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 140,
                                  child: TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              buttonColor[1]),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6))),
                                    ),
                                    child: Text(
                                      'No Porn',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () {
                                      print(selected[1]);
                                      setSelectedButtonColor(1);
                                      //selected[1] = !selected[1];
                                    },
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 140,
                                  child: TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              buttonColor[2]),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6))),
                                    ),
                                    child: Text(
                                      'Write 30 min daily',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () {
                                      setSelectedButtonColor(2);
                                      //selected[2] = !selected[2];
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 140,
                                  child: TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              buttonColor[3]),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6))),
                                    ),
                                    child: Text(
                                      'Intraday profit',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () {
                                      setSelectedButtonColor(3);
                                      //selected[3] = !selected[3];
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 160,
                                  child: TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              buttonColor[4]),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6))),
                                    ),
                                    child: Text(
                                      'Sleep 6-7 hrs daily',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () {
                                      setSelectedButtonColor(4);
                                      //selected[4] = !selected[4];
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 140,
                                  child: TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              buttonColor[5]),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6))),
                                    ),
                                    child: Text(
                                      'Read an hour daily',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () {
                                      setSelectedButtonColor(5);
                                      //selected[5] = !selected[5];
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 140,
                                  child: TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              buttonColor[6]),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6))),
                                    ),
                                    child: Text(
                                      'Do Charity',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () {
                                      setSelectedButtonColor(6);
                                      //selected[6] = !selected[6];
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 140,
                                  child: TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              buttonColor[7]),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6))),
                                    ),
                                    child: Text(
                                      'Meditate Daily',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () {
                                      setSelectedButtonColor(7);
                                      //selected[7] = !selected[7];
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 180,
                                  child: TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              buttonColor[8]),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6))),
                                    ),
                                    child: Text(
                                      'Wake up Before sunrise',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () {
                                      setSelectedButtonColor(8);
                                      //selected[8] = !selected[8];
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 140,
                                  child: TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              buttonColor[9]),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6))),
                                    ),
                                    child: Text(
                                      'Other habit',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () {
                                      setSelectedButtonColor(9);
                                      //selected[9] = !selected[9];
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 30, right: 20),
                      child: SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          child: Text('Continue'),
                          onPressed: () async {
                            String habit = getHabit();
                            print(habit);
                            if (habit == "Other Habit") {
                              Get.to(() => NewTaskScreen());
                            } else {
                              if (habit == "a") {
                                Fluttertoast.showToast(
                                    msg: "Please choose a habit");
                              } else {
                                var prefs =
                                    await SharedPreferences.getInstance();
                                if (prefs.getInt('goal') == 7 ||
                                    prefs.getInt('goal') == 21 ||
                                    prefs.getInt('goal') == 42 ||
                                    prefs.getInt('goal') == 84 ||
                                    prefs.getInt('goal') == 168) {
                                  Get.off(() => DetailScreen(
                                      habit: prefs.getString('task')!,
                                      days: prefs.getInt('goal')!));
                                } else {
                                  Get.off(() => SetGoal(
                                        habit: habit,
                                      ));
                                }
                              }
                            }
                          },
                          style: kButtonStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
// Text('Daily 30 min walk'),
// Text('No Porn'),
// Text('Write 30 min a day'),
// Text('Intraday Profit'),
// Text('Sleep 6-7 hrs daily'),
// Text('Read an hour daily'),
// Text('Do Charity'),
// Text('Meditate Daily'),
// Text('Wake up before sunrise'),
// Text('Other Habit'),

//
// class WrapToggleIconButtons extends StatefulWidget {
//   final List<Text> iconList;
//   final List<bool> isSelected;
//   final Function onPressed;
//
//   WrapToggleIconButtons({
//     required this.iconList,
//     required this.isSelected,
//     required this.onPressed,
//   });
//
//   @override
//   _WrapToggleIconButtonsState createState() => _WrapToggleIconButtonsState();
// }
//
// class _WrapToggleIconButtonsState extends State<WrapToggleIconButtons> {
//   late int index;
//
//   @override
//   Widget build(BuildContext context) {
//     assert(widget.iconList.length == widget.isSelected.length);
//     index = -1;
//     return Wrap(
//       children: widget.iconList.map((Text icon) {
//         index++;
//         return IconToggleButton(
//           active: widget.isSelected[index],
//           icon: icon,
//           onTap: widget.onPressed,
//           index: index,
//           width: 150,
//           height: 1000,
//         );
//       }).toList(),
//     );
//   }
// }
//
// class IconToggleButton extends StatelessWidget {
//   final bool active;
//   final Text icon;
//   final Function onTap;
//   final double width;
//   final double height;
//   final int index;
//
//   IconToggleButton({
//     required this.active,
//     // @required this.icon,
//     required this.onTap,
//     required this.index,
//     required this.width,
//     required this.height,
//     required this.icon,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width ?? 60.0,
//       height: height ?? 100,
//       child: InkWell(
//         child: Container(
//           child: icon,
//           color: active ? Colors.redAccent : Colors.white,
//         ),
//         onTap: () => onTap(index),
//       ),
//     );
//   }
//}

//
//
//
//
//
//
// Padding(
// padding: const EdgeInsets.only(top: 50.0),
// child: Container(
// child: Text(
// 'Select a Goal to Track Progress',
// style: TextStyle(
// color: Colors.redAccent,
// fontSize: 20,
// fontWeight: FontWeight.w500),
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(top: 50),
// child: SizedBox(
// width: 300,
// height: 100,
// child: GestureDetector(
// onTap: () {
// Get.to(() => MainScreen());
// },
// child: GradientCard(
// elevation: 20,
// gradient: Gradients.hotLinear,
// shadowColor: Gradients.tameer.colors.last
//     .withOpacity(0.25),
// // color: cardColor[0],
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text(
// 'Wake up every day at 6 in the morning'),
// ],
// ),
// ),
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(top: 50),
// child: SizedBox(
// width: 300,
// height: 100,
// child: GestureDetector(
// onTap: () {
// Get.to(() => MainScreen());
// },
// child: GradientCard(
// elevation: 20,
// gradient: Gradients.hotLinear,
// shadowColor: Gradients.tameer.colors.last
//     .withOpacity(0.25),
// // color: cardColor[0],
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text('Drink 8 glasses of water daily'),
// ],
// ),
// ),
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(top: 50),
// child: SizedBox(
// width: 300,
// height: 100,
// child: GestureDetector(
// onTap: () {
// Get.to(() => MainScreen());
// },
// child: GradientCard(
// elevation: 20,
// gradient: Gradients.hotLinear,
// shadowColor: Gradients.tameer.colors.last
//     .withOpacity(0.25),
// // color: cardColor[0],
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text('Quit Smoking'),
// ],
// ),
// ),
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(top: 50),
// child: SizedBox(
// width: 300,
// height: 100,
// child: GestureDetector(
// onTap: () {
// Get.to(() => MainScreen());
// },
// child: GradientCard(
// elevation: 20,
// gradient: Gradients.hotLinear,
// shadowColor: Gradients.tameer.colors.last
//     .withOpacity(0.25),
// // color: cardColor[0],
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text(
// 'Wake up every day at 6 in the morning'),
// ],
// ),
// ),
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(top: 50),
// child: SizedBox(
// width: 300,
// height: 100,
// child: GestureDetector(
// onTap: () {
// Get.to(() => NewTaskScreen());
// },
// child: GradientCard(
// elevation: 20,
// gradient: Gradients.hotLinear,
// shadowColor: Gradients.tameer.colors.last
//     .withOpacity(0.25),
// //color: cardColor[1],
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text('Add New Task'),
// ],
// ),
// ),
// ),
// ),
// ),

//
// Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// TextButton(
// style: ButtonStyle(
// backgroundColor: MaterialStateProperty.all(
// Colors.black12,
// ),
// shape: MaterialStateProperty.all(
// RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(18.0),
// ),
// ),
// ),
// onPressed: () {},
// child: Text("Daily 30 min walk"),
// ),
// SizedBox(
// width: 70,
// ),
// TextButton(
// style: ButtonStyle(
// backgroundColor: MaterialStateProperty.all(
// Colors.black12,
// ),
// shape: MaterialStateProperty.all(
// RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(18.0),
// ),
// ),
// ),
// onPressed: () {},
// child: Text("No Porn"),
// ),
// ],
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(left: 10, right: 20),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// TextButton(
// style: ButtonStyle(
// backgroundColor: MaterialStateProperty.all(
// Colors.black12,
// ),
// shape: MaterialStateProperty.all(
// RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(18.0),
// ),
// ),
// ),
// onPressed: () {},
// child: Text("Write 30 min a day"),
// ),
// SizedBox(
// width: 65,
// ),
// TextButton(
// style: ButtonStyle(
// backgroundColor: MaterialStateProperty.all(
// Colors.black12,
// ),
// shape: MaterialStateProperty.all(
// RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(18.0),
// ),
// ),
// ),
// onPressed: () {},
// child: Text("Intraday Profit"),
// ),
// ],
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(left: 10, right: 20),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// TextButton(
// style: ButtonStyle(
// backgroundColor: MaterialStateProperty.all(
// Colors.black12,
// ),
// shape: MaterialStateProperty.all(
// RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(18.0),
// ),
// ),
// ),
// onPressed: () {},
// child: Text("Sleep 6-7 hrs daily"),
// ),
// SizedBox(
// width: 65,
// ),
// TextButton(
// style: ButtonStyle(
// backgroundColor: MaterialStateProperty.all(
// Colors.black12,
// ),
// shape: MaterialStateProperty.all(
// RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(18.0),
// ),
// ),
// ),
// onPressed: () {},
// child: Text("Read an hour daily"),
// ),
// ],
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(left: 10, right: 20),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// TextButton(
// style: ButtonStyle(
// backgroundColor: MaterialStateProperty.all(
// Colors.black12,
// ),
// shape: MaterialStateProperty.all(
// RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(18.0),
// ),
// ),
// ),
// onPressed: () {},
// child: Text("Do chariy"),
// ),
// SizedBox(
// width: 125,
// ),
// TextButton(
// style: ButtonStyle(
// backgroundColor: MaterialStateProperty.all(
// Colors.black12,
// ),
// shape: MaterialStateProperty.all(
// RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(18.0),
// ),
// ),
// ),
// onPressed: () {},
// child: Text("Meditate daily"),
// ),
// ],
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(left: 10, right: 20),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// TextButton(
// style: ButtonStyle(
// backgroundColor: MaterialStateProperty.all(
// Colors.black12,
// ),
// shape: MaterialStateProperty.all(
// RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(18.0),
// ),
// ),
// ),
// onPressed: () {},
// child: Text("Wake up before sunrise"),
// ),
// SizedBox(
// width: 35,
// ),
// TextButton(
// style: ButtonStyle(
// backgroundColor: MaterialStateProperty.all(
// Colors.black12,
// ),
// shape: MaterialStateProperty.all(
// RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(18.0),
// ),
// ),
// ),
// onPressed: () {},
// child: Text("Other Habit"),
// ),
// ],
// ),

// TODO
// GroupButton(
// buttons: [
// "Daily 30 min walk",
// "No Porn",
// "Write 30 min a day",
// "Intraday Profit",
// "Sleep 6-7 hrs daily",
// "Read an hour daily",
// "Do Charity",
// "Meditate Daily",
// "Wake up before sunrise",
// "Other Habit",
// ],
// borderRadius: BorderRadius.circular(9),
// mainGroupAlignment: MainGroupAlignment.spaceBetween,
// crossGroupAlignment: CrossGroupAlignment.start,
// groupRunAlignment: GroupRunAlignment.center,
// isRadio: false,
// spacing: 47,
// unselectedColor: Colors.black12,
// onSelected: (index, isSelected) {
// if (!checkSelected()) {
// selected[index] = isSelected;
// print(index);
// print(selected[index]);
// }
// },
// ),
