import 'package:flutter/material.dart';

class AccentText extends StatelessWidget {
  final String text;
  final double fontSize;

  const AccentText(this.text, {Key? key, this.fontSize = 24}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(color: Theme.of(context).splashColor, fontSize: fontSize),
    );
  }
}
