import 'package:flutter/material.dart';
import 'package:new_hotel_app/ui/constants/styles.dart';

// ignore: must_be_immutable
class TextForm extends StatelessWidget {
  const TextForm(
      {Key? key,
      required this.controller,
      required this.text})
      : super(key: key);
  final controller;
  final text;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.always,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        label: Text(text),
        labelStyle: StyleApp.alive,
      ),
    );
  }
}
