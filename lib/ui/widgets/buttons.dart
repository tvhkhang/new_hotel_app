import 'package:flutter/material.dart';


// ignore: must_be_immutable
class ButtonApp extends StatelessWidget {
  ButtonApp(
      {Key? key,
      required this.elevation,
      required this.text,
      required this.style,
      required this.colorbr,
      required this.colorside,
      required this.func})
      : super(key: key);
  var elevation;
  var text;
  var style;
  var colorbr;
  var colorside;
  var func;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: style,
      ),
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        minimumSize: const Size(0, 53),
        primary: colorbr,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            color: colorside,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
      ),
      onPressed: func,
    );
  }
}
