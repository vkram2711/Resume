import 'package:flutter/material.dart';
import 'package:resume/widgets/image_with_outlined_shadow.dart';
import 'package:resume/widgets/resume_inherited.dart';
import 'package:resume/widgets/text/about_text.dart';
import 'package:resume/widgets/header.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(ResumeInherited.of(context).isWeb) {
      return Row(
        children: [
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Header(
                  accentText: '1. ',
                  text: 'About me',
                ),
                Padding(padding: EdgeInsets.only(top: 20), child: AboutText()),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                ImageWithOutlinedShadow()
              ],
            ),
          )
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Header(
                  accentText: '1. ',
                  text: 'About me',
                ),
                Padding(padding: EdgeInsets.only(top: 20), child: AboutText()),
                ImageWithOutlinedShadow()
              ],
            ),
          ),
        ],
      );
    }
  }
}
