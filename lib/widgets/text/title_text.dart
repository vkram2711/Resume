import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String accentText;
  final String titleText;
  final double fontSize;

  const TitleText(this.accentText, this.titleText,
      {Key? key, this.fontSize = 24})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: accentText,
          style: TextStyle(
              color: Theme.of(context).splashColor, fontSize: fontSize)),
      TextSpan(
          text: titleText,
          style: TextStyle(
              color: Theme.of(context).primaryColor, fontSize: fontSize))
    ]));
  }
}
