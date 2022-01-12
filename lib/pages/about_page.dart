import 'package:flutter/material.dart';
import 'package:resume/pages/base_page.dart';
import 'package:resume/widgets/text/about_text.dart';
import 'package:resume/widgets/header.dart';
import 'package:resume/widgets/text/title_text.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(mainModule: const [
      Header(
        accentText: '1. ',
        text: 'About me',
      ),
      Padding(padding: EdgeInsets.only(top: 20), child: AboutText()),
    ], secondaryModule: [
      Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 40),
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).splashColor,
                  width: 1,
                ),
              ),
            ),
          ),
          Image.asset('assets/face.jpg'),
        ],
      )
    ]);
  }
}
