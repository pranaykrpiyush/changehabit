import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group_button/group_button.dart';
import 'package:get/get.dart';
import 'package:habbittracker/constants.dart';
import 'package:habbittracker/detail_screen.dart';
import 'package:habbittracker/main_screen.dart';
import 'package:habbittracker/settaskgoal.dart';

import 'custom_days_screen.dart';

class SetGoal extends StatefulWidget {
  SetGoal({required this.habit});
  final String habit;

  @override
  _SetGoalState createState() => _SetGoalState();
}

class _SetGoalState extends State<SetGoal> {
  List<int> days = [
    7,
    21,
    42,
    84,
    168,
    0,
  ];
  List<bool> selected = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  setSelectedButtonColor(int j) {
    for (int i = 0; i < 6; i++) {
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

  Color unselectedColor = Colors.black12;
  Color? selectedColor = Colors.blue[800];
  List buttonColor = [
    Colors.black12,
    Colors.black12,
    Colors.black12,
    Colors.black12,
    Colors.black12,
    Colors.black12,
  ];

  int getDays() {
    for (int i = 0; i < 6; i++) {
      print(selected[i]);
      if (selected[i] == true) {
        return days[i];
      }
    }
    return 10;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 20),
              child: Text(
                "Habits change in at least 21 days",
                style: TextStyle(fontSize: 65, fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 30,
              ),
              child: Text(
                'Choose days you need to make an impact',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 10, right: 20, top: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 140,
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(buttonColor[0]),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6))),
                            ),
                            child: Text(
                              '7 days - Novice',
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              setSelectedButtonColor(0);
                              //selected[0] = !selected[0];
                            },
                          ),
                        ),
                        SizedBox(
                          width: 180,
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(buttonColor[1]),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6))),
                            ),
                            child: Text(
                              '21 days - Determined',
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
                      children: [
                        SizedBox(
                          width: 140,
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(buttonColor[2]),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6))),
                            ),
                            child: Text(
                              '42 days - Master',
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              setSelectedButtonColor(2);
                              //selected[0] = !selected[0];
                            },
                          ),
                        ),
                        SizedBox(
                          width: 140,
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(buttonColor[3]),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6))),
                            ),
                            child: Text(
                              '84 days -  Guru',
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              print(selected[1]);
                              setSelectedButtonColor(3);
                              //selected[1] = !selected[1];
                            },
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 160,
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(buttonColor[4]),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6))),
                            ),
                            child: Text(
                              '168 days- Mahaguru',
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              setSelectedButtonColor(4);
                              //selected[0] = !selected[0];
                            },
                          ),
                        ),
                        SizedBox(
                          width: 140,
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(buttonColor[5]),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6))),
                            ),
                            child: Text(
                              'Custom days',
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              print(selected[1]);
                              setSelectedButtonColor(5);
                              //selected[1] = !selected[1];
                            },
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: kButtonStyle,
                  child: Text('Track Now'),
                  onPressed: () async {
                    int day = getDays();
                    if (day == 10) {
                      Fluttertoast.showToast(
                          msg: "PLease choose number of days");
                    } else if (day == 0) {
                      Get.off(() => CustomDaysScreen(habit: widget.habit));
                    } else {
                      setTaskGoal(widget.habit, day);
                      Get.off(() => (DetailScreen(
                            days: day,
                            habit: widget.habit,
                          )));
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
