import 'package:flutter/material.dart';

class PrimaryText extends StatelessWidget {
  final String text;
  final double fontSize;

  const PrimaryText(this.text, {Key? key, this.fontSize = 24})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(color: Theme.of(context).primaryColor, fontSize: fontSize),
    );
  }
}
