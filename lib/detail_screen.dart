import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:habbittracker/constants.dart';
import 'package:habbittracker/select_habit_screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailScreen extends StatefulWidget {
  final int days;
  final String habit;
//  final int percentage;

  DetailScreen({
    required this.habit,
    required this.days,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final date2 = DateTime.now();
  int difference = 0;
  double progressPercent = 0.0;

  getPercent() async {
    var prefs = await SharedPreferences.getInstance();
//    prefs.getInt('startDate');
    int? setDate = prefs.getInt('startDate');

    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(setDate!);

    difference = date2.difference(dateTime).inDays;
    setState(() {
            progressPercent = ((difference / widget.days)*100).round();
    });

    print("percent" + progressPercent.toString());
    print(difference);
    if (difference == widget.days) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text('Goal Achieved'),
                content: Text('Yay! You have made it'),
              ));
    }
  }

  @override
  void initState() {
    getPercent();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20),
                child: Center(
                  child: Text(
                    widget.habit,
                    style: TextStyle(fontSize: 75, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircularPercentIndicator(
                      radius: 250,
                      animateFromLastPercent: true,
                      percent: progressPercent / 100,
                      center: Text(
                        "${progressPercent.ceil().toString()}%",
                        style: TextStyle(
                            fontSize: 55, fontWeight: FontWeight.bold),
                      ),
                      lineWidth: 20,
                      progressColor: Colors.blue[700],
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        '$difference day(s) out of ${widget.days} completed',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 33, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Keep going on",
                        style: TextStyle(
                            fontSize: 33, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: SizedBox(
                        width: 250,
                        child: ElevatedButton(
                          child: Text("Relapse - Don't loose hope"),
                          onPressed: () async {
                            var prefs = await SharedPreferences.getInstance();
                            // prefs.remove('task');
                            // prefs.remove('goal');
                            prefs.remove('startDate');
                            // print(prefs.getString('task'));
                            //print(prefs.getString('goal'));
                            Fluttertoast.showToast(
                                msg:
                                    "Habit relapsed, let's start all over again");
                            //Get.off(() => SelectHabitScreen());
                          },
                          style: kButtonStyle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: SizedBox(
                        width: 250,
                        child: ElevatedButton(
                          child: Text("Delete Habit"),
                          onPressed: () async {
                            var prefs = await SharedPreferences.getInstance();
                            prefs.remove('task');
                            prefs.remove('goal');
                            prefs.remove('startDate');
                            print(prefs.getString('task'));
                            print(prefs.getString('goal'));
                            Fluttertoast.showToast(
                                msg:
                                    'Habit has been deleted. Choose a new habit to get going!');
                            Get.off(() => SelectHabitScreen());
                          },
                          style: kButtonStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
