import 'package:flutter/material.dart';
import 'package:resume/mobile_screen.dart';
import 'package:resume/pages/about_page.dart';
import 'package:resume/pages/achievements_page.dart';
import 'package:resume/pages/contact_page.dart';
import 'package:resume/pages/portfolio_page.dart';
import 'package:resume/pages/intro_page.dart';
import 'package:resume/pages/work_page.dart';
import 'package:resume/web_screen.dart';
import 'package:resume/widgets/page_view/page_view_indicator.dart';
import 'package:resume/widgets/resume_bar.dart';
import 'package:resume/widgets/resume_inherited.dart';

//TODO: achievements, git, change top bar, listview generate
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'ProximaNova',
          backgroundColor: Colors.black,
          splashColor: Colors.yellow[600],
          secondaryHeaderColor: Colors.white,
          primaryColor: Colors.grey[400]),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if(constraints.maxWidth > 1050) {
              return const WebScreen();
            } else {
              return const MobileScreen();
            }
          },
        )
      ),
    );
  }
}
