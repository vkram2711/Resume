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
      return Column(
        children: [
          const Header(
            accentText: '1. ',
            text: 'About me',
          ),
          Row(
            children: const [
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: AboutText(),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Align(alignment: Alignment.center, child: ImageWithOutlinedShadow()),
                ),
              )
            ],
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Header(
                  accentText: '1. ',
                  text: 'About me',
                ),
                Padding(padding: EdgeInsets.only(top: 20), child: AboutText()),
                Center(child: Padding(padding: EdgeInsets.only(top: 20),child: ImageWithOutlinedShadow(height: 150, width: 150,)))
              ],
            ),
          ),
        ],
      );
    }
  }
}
