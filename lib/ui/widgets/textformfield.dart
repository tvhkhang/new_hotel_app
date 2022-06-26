import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_hotel_app/ui/constants/styles.dart';
class TextForm extends StatelessWidget
{
   TextForm({Key? key,required this.controller,required this.text}) : super(key : key);
  final controller;
  final text;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      controller: this.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        label: Text(this.text),
        labelStyle: StyleApp.alive,
      ),
    );
  }
}