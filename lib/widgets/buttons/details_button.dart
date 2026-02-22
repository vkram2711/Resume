import 'package:flutter/material.dart';

class DetailsButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? iconColor;
  final double? iconSize;

  const DetailsButton({
    Key? key,
    this.onPressed,
    this.iconColor,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accentColor = iconColor ?? Theme.of(context).splashColor;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: accentColor, // Use the accent color for the border
          width: 2.0, // Adjust the border width as needed
        ),
        borderRadius:
        BorderRadius.circular(8.0), // Optional: Add rounded corners
      ),
      child: IconButton(
        icon: Icon(
          Icons.more_horiz, // Use the vertical ellipsis icon
          color: accentColor,
          size: iconSize ?? 32.0,
        ),
        onPressed: onPressed,
      ),
    );
  }
}