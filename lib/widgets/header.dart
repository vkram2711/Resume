import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume/widgets/text/title_text.dart';

class Header extends StatelessWidget {
  final String text;
  final String accentText;

  const Header({required this.text, required this.accentText, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TitleText(
          accentText,
          text,
          fontSize: 36,
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Divider(
              thickness: 1.0,
              color: Colors.yellow,
            ),
          ),
        )
      ],
    );
  }
}
