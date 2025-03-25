import 'package:flutter/material.dart';
import 'package:resume/resources/styles.dart';

class AboutText extends StatelessWidget {
  const AboutText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: primaryTextStyle(context), // Default style for the entire text
        children: [
          TextSpan(
            text:
            "I’m a Computer Science and Business student at Minerva University with a passion for developing scalable, user-friendly technology solutions. ",
          ),
          TextSpan(
            text:
            "With hands-on experience in mobile app development, backend architecture, and AI integration, I’ve built products ranging from video platform MVP to an award-winning indoor gardening system showcased internationally. ",
          ),
          TextSpan(
            text:
            "I thrive on solving complex challenges, whether it’s building reliable systems or optimizing user experiences. ",
          ),
          TextSpan(
            text:
            "I'm seeking opportunities in software engineering, tech consulting, product development, and freelance collaborations where I can leverage my skills to make a meaningful impact.",
          ),
        ],
      ),
    );
  }
}