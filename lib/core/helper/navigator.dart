import 'package:flutter/material.dart';

enum NavigationType { push, pushReplacement, pushAndRemoveUntil }

abstract class Navigation {
  static goTo(
    context,
    Widget screen, {
    NavigationType type = NavigationType.push,
  }) {
    var pageRoute = MaterialPageRoute(builder: (context) => screen);
    switch (type) {
      case NavigationType.push:
        Navigator.push(context, pageRoute);
      case NavigationType.pushReplacement:
        Navigator.pushReplacement(context, pageRoute);
      case NavigationType.pushAndRemoveUntil:
        Navigator.pushAndRemoveUntil(context, pageRoute, (route) => false);
    }
  }

  static goBack(context) => Navigator.pop(context);
}
