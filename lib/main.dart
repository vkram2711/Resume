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
import 'package:resume/widgets/inherited/resume_inherited.dart';

import 'app_body.dart';

//TODO: achievements, git, change top bar, listview generate
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const AppBody(false),
        '/u': (context) => const AppBody(true),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'ProximaNova',
          backgroundColor: Colors.black,
          splashColor: Colors.yellow[600],
          secondaryHeaderColor: Colors.white,
          primaryColor: Colors.grey[400]),
    );
  }
}
