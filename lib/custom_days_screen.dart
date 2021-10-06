import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:habbittracker/detail_screen.dart';
import 'package:habbittracker/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDaysScreen extends StatefulWidget {
  final String habit;
  CustomDaysScreen({required this.habit});

  @override
  _CustomDaysScreenState createState() => _CustomDaysScreenState();
}

class _CustomDaysScreenState extends State<CustomDaysScreen> {
  Future saveTask() async {
    //taskCount++;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('task', daysCtrl.text);
    int timestamp = DateTime.now().millisecondsSinceEpoch;

//    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('startDate', timestamp);

    // prefs.setString('goal', taskDurationCtrl.text);
    //prefs.setInt('tasks', taskCount);
    print(prefs.getString('task'));
    //print(prefs.getString('goal'));
    Fluttertoast.showToast(msg: 'Days Saved!');
  }

  var daysCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(48.0),
            child: TextFormField(
              controller: daysCtrl,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                label: Text('Number of days'),
                border: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.solid)),
                hintText: 'Enter No of days',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: SizedBox(
              width: 200,
              height: 50,
              child: TextButton(
                child: Text(
                  'Save Days',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  saveTask();
                  print(int.parse(daysCtrl.text));
                  if (int.parse(daysCtrl.text) <= 0) {
                    Fluttertoast.showToast(
                        msg: "Day(s) value must be greater than or equal to 1");
                  } else {
                    Get.off(() => DetailScreen(
                        habit: widget.habit, days: int.parse(daysCtrl.text)));
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[800]),
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(28.0),
          //   child: SizedBox(
          //     width: 200,
          //     height: 50,
          //     child: TextButton(
          //       child: Text(
          //         'Set Days',
          //         style: TextStyle(color: Colors.white),
          //       ),
          //       onPressed: () async {
          //         SharedPreferences prefs =
          //             await SharedPreferences.getInstance();
          //         String msg = 's';
          //         msg = prefs.getString('days')!;
          //
          //         Fluttertoast.showToast(msg: msg);
          //
          //       },
          //       style: ButtonStyle(
          //         backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    ));
  }
}
