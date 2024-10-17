import 'package:flutter/material.dart';

class AppMethods {
  static Future navigateTo(BuildContext context, Widget screen) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => screen));
  }
}
