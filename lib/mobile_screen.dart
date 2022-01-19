import 'package:flutter/material.dart';
import 'package:resume/pages/about_page.dart';
import 'package:resume/pages/achievements_page.dart';
import 'package:resume/pages/contact_page.dart';
import 'package:resume/pages/intro_page.dart';
import 'package:resume/pages/portfolio_page.dart';
import 'package:resume/pages/work_page.dart';
import 'package:resume/widgets/page_view/page_view_indicator.dart';
import 'package:resume/widgets/resume_bar.dart';
import 'package:resume/widgets/resume_inherited.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: 0);
    const pages = [
      IntroPage(),
      AboutPage(),
      PortfolioPage(),
      WorkPage(),
      AchievementsPage(),
      ContactPage()
    ];

    return ResumeInherited(
      pageController: controller,
      isWeb: false,
      child: Column(
        children: [
          Expanded(
            child: PageView(
                controller: controller,
                scrollDirection: Axis.vertical,
                children: pages),
          )
        ],
      ),
    );
  }
}
