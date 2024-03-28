import 'package:flutter/material.dart';

class TitleText extends Text {
  String string;
  TitleText({required this.string}): super(
    string,
    style: const TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.italic,
      fontSize: 30
    )
  );
}