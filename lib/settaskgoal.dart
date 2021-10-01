import 'package:shared_preferences/shared_preferences.dart';

void setTaskGoal(String task, int goal) async {
  var prefs = await SharedPreferences.getInstance();
  prefs.setString('task', task);
  int timestamp = DateTime.now().millisecondsSinceEpoch;

  //final prefs = await SharedPreferences.getInstance();
  prefs.setInt('startDate', timestamp);

  prefs.setInt('goal', goal);
}

Future<String> getTask() async {
  var prefs = await SharedPreferences.getInstance();
  String task = prefs.getString('task')!;
  return task;
}

Future<int> getGoal(String task) async {
  var prefs = await SharedPreferences.getInstance();
  int goal = prefs.getInt('goal')!;

  return goal;
}
