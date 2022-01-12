import 'package:flutter/material.dart';
import 'package:resume/resources/styles.dart';

class AboutText extends StatelessWidget {
  const AboutText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text:
              'Hi! My name is Vlad, and I’m a professional software developer. I started my programming journey with freelance and ',
          style: primaryTextStyle(context)),
      TextSpan(text: 'android ', style: accentTextStyle(context)),
      TextSpan(
          text:
              'development four years ago. But the reality shows that it’s very hard to stick to one platform, especially if you work with startups. At some point, the time came, and a new project required a cross-platform solution, so in 2 months, I migrated to ',
          style: primaryTextStyle(context)),
      TextSpan(text: 'Flutter ', style: accentTextStyle(context)),
      TextSpan(
          text:
              'and worked with it for more than two years since that time. \n\nAlso, I learned the basics of backend with ',
          style: primaryTextStyle(context)),
      TextSpan(text: 'Python', style: secondaryAccentTextStyle(context)),
      TextSpan(text: ', ', style: primaryTextStyle(context)),
      TextSpan(text: 'Flask', style: secondaryAccentTextStyle(context)),
      TextSpan(text: ', and ', style: primaryTextStyle(context)),
      TextSpan(text: 'SQL ', style: secondaryAccentTextStyle(context)),
      TextSpan(
          text:
              'to create server-side in case of necessity. \n\nI worked as a freelancer, regular developer, and even was a co-founder.',
          style: primaryTextStyle(context)),
    ]));
  }
}
