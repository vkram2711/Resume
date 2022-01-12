import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume/widgets/resume_button.dart';
import 'package:resume/widgets/text/title_text.dart';

class ResumeBar extends StatelessWidget {
  const ResumeBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TitleText('1. ', 'About'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TitleText('2. ', 'Experience'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TitleText('3. ', 'Work'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TitleText('4. ', 'Contact'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ResumeButton('Resume', () {}),
          ),
        ],
      ),
    );
  }
}
