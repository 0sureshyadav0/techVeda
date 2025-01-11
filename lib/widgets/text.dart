import 'package:flutter/material.dart';

Widget myText(String text, {Color color = Colors.black, double size = 22.0}) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: size),
  );
}
