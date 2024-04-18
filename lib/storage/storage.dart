import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static late SharedPreferences prefs;

  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }
}