import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static List<String> tasks = [];
  static void setTasks() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setStringList('tasks', tasks);
  }
}
