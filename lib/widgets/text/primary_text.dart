import 'package:flutter/material.dart';

class PrimaryText extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign textAlign;

  const PrimaryText(this.text,
      {Key? key, this.fontSize = 24, this.textAlign = TextAlign.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style:
          TextStyle(color: Theme.of(context).primaryColor, fontSize: fontSize),
    );
  }
}
