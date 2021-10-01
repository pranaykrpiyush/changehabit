import 'package:flutter/material.dart';
import 'package:habbittracker/main_screen.dart';
import 'package:habbittracker/set_goal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'new_main_screen.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  var taskNameCtrl = TextEditingController();
  var taskDurationCtrl = TextEditingController();
  int taskCount = 0;
  Future saveTask() async {
    taskCount++;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('task', taskNameCtrl.text);
    // prefs.setString('goal', taskDurationCtrl.text);
    prefs.setInt('tasks', taskCount);
    print(prefs.getString('task'));
    //print(prefs.getString('goal'));
    Fluttertoast.showToast(msg: 'New Task Added!');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add a new Task'),
        backgroundColor: Colors.lightBlue,
        elevation: 20,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: SizedBox(
              width: 300,
              height: 200,
              child: TextFormField(
                controller: taskNameCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(style: BorderStyle.solid)),
                  hintText: 'Enter you goal',
                ),
              ),
            ),
          ),
          // SizedBox(
          //   height: 200,
          //   width: 300,
          //   child: TextFormField(
          //     controller: taskDurationCtrl,
          //     decoration: InputDecoration(
          //       border: OutlineInputBorder(
          //           borderSide: BorderSide(style: BorderStyle.solid)),
          //       hintText: 'Duration of days',
          //     ),
          //   ),
          // ),

          SizedBox(
            width: 200,
            height: 50,
            child: TextButton(
              child: Text(
                'Set Goal',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                saveTask();
                SharedPreferences prefs = await SharedPreferences.getInstance();
                String msg = 's';
                msg = prefs.getString('task')!;

                Fluttertoast.showToast(msg: msg);
                Get.to(() => SetGoal(
                      habit: taskNameCtrl.text,
                    ));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue[800]),
              ),
            ),
          )
        ],
      )),
    ));
  }
}
