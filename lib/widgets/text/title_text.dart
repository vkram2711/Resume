import 'package:flutter/material.dart';
import 'package:resume/resources/styles.dart';

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
      text: TextSpan(
        children: [
          TextSpan(
              text: accentText,
              style: accentTextStyle(context, fontSize: fontSize)),
          TextSpan(
            text: titleText,
            style: primaryTextStyle(context, fontSize: fontSize),
          ),
        ],
      ),
    );
  }
}
