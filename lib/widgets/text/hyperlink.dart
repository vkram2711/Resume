import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:resume/resources/styles.dart';
import 'package:url_launcher/url_launcher.dart';

TextSpan hyperlink({
  required String text,
  required String link,
  required BuildContext context,
}) {
  return TextSpan(
    text: text,
    style: accentTextStyle(context, fontSize: 36, underline: true),
    recognizer: TapGestureRecognizer()
      ..onTap = () {
        launch(link);
      },
  );
}
