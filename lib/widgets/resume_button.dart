import 'package:flutter/material.dart';

import 'text/accent_text.dart';

class ResumeButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ResumeButton(this.text, this.onPressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          side: MaterialStateProperty.all(
            BorderSide(color: Theme.of(context).splashColor),
          ),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide(color: Theme.of(context).splashColor),
          ))),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
          child: AccentText(text)),
    );
  }
}
