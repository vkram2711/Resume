import 'package:flutter/material.dart';
import 'package:resume/pages/about_page.dart';
import 'package:resume/pages/achievements_page.dart';
import 'package:resume/pages/contact_page.dart';
import 'package:resume/pages/intro_page.dart';
import 'package:resume/pages/portfolio_page.dart';
import 'package:resume/pages/work_page.dart';
import 'package:resume/widgets/resume_inherited.dart';

class MobileScreen extends StatelessWidget {
  final double maxHeight;
  const MobileScreen(this.maxHeight, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: 0);
    const pages = [
      SizedBox(height: 605,child: IntroPage()),
      SizedBox(height: 605,child: AboutPage()),
      SizedBox(height: 605,child: PortfolioPage()),
      SizedBox(height: 605,child: WorkPage()),
      SizedBox(height: 605,child: AchievementsPage()),
      SizedBox(height: 605,child: ContactPage())
    ];

    return ResumeInherited(
      pageController: controller,
      isWeb: false,
      child: Column(
        children: [
          Expanded(
            child: ListView(
                scrollDirection: Axis.vertical,
                children: pages),
          )
        ],
      ),
    );
  }
}
