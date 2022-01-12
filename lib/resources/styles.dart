import 'package:flutter/material.dart';

TextStyle accentTextStyle(BuildContext context,
    {double fontSize = 24, bool underline = false}) {
  return TextStyle(
      color: Theme.of(context).splashColor,
      fontSize: fontSize,
      decoration: underline ? TextDecoration.underline : null);
}

TextStyle secondaryAccentTextStyle(BuildContext context,
    {double fontSize = 24, bool underline = false}) {
  return TextStyle(
      color: Theme.of(context).secondaryHeaderColor,
      fontSize: fontSize,
      decoration: underline ? TextDecoration.underline : null);
}

TextStyle primaryTextStyle(BuildContext context,
    {double fontSize = 24, bool underline = false}) {
  return TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: fontSize,
      decoration: underline ? TextDecoration.underline : null);
}
