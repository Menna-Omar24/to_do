import 'package:flutter/material.dart';

void goTo(context, Widget screen, {bool replace = false}) {
  replace
      ? Navigator.push(context, MaterialPageRoute(builder: (context) => screen))
      : Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}