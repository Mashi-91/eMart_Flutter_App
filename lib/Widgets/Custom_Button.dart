import 'package:flutter/material.dart';

Widget CustomButton(
    {required Widget text, required Color color, required Function function}) {
  return Container(
    width: double.infinity,
    child: MaterialButton(
        color: color,
        onPressed: () => function(),
        elevation: 0,
        height: 45,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
        child: text),
  );
}
