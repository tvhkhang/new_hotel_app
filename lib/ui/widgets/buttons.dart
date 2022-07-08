import 'package:flutter/material.dart';
import 'package:new_hotel_app/ui/constants/colors.dart';
import 'package:new_hotel_app/ui/constants/styles.dart';

class ButtonApp {
  static final signinButton = Flexible(
    child: ElevatedButton(
      child: Text(
        'Sign in',
        style: StyleApp.buttonSignIn,
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(0, 53),
          primary: ColorApp.blue,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
      onPressed: () {},
    ),
    flex: 1,
    fit: FlexFit.tight,
  );

  static final cancelButton = Flexible(
    child: ElevatedButton(
      child: Text(
        'Cancel',
        style: StyleApp.buttonCancel,
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(0, 53),
          primary: ColorApp.backgroundApp,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
      onPressed: () {},
    ),
    flex: 1,
    fit: FlexFit.tight,
  );
  static final doneButton = Flexible(
    child: ElevatedButton(
      child: Text(
        'Done',
        style: StyleApp.buttonSignIn,
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(0, 53),
          primary: ColorApp.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
      onPressed: () {},
    ),
    flex: 2,
    fit: FlexFit.tight,
  );
}

class ButtonFlexible extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color color;
  final int flex;
  final TextStyle style;
  const ButtonFlexible(
      {Key? key, required this.onPressed, required this.text, required this.color, required this.flex,required this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ElevatedButton(
        child: Text(
          text,
          style: style,
        ),
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(0, 53),
            primary: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0))),
        onPressed: onPressed,
      ),
      flex: flex,
      fit: FlexFit.tight,
    );
  }
}
