import 'package:flutter/material.dart';
import 'package:resume/pages/about_page.dart';
import 'package:resume/pages/achievements_page.dart';
import 'package:resume/pages/contact_page.dart';
import 'package:resume/pages/intro_page.dart';
import 'package:resume/pages/portfolio_page.dart';
import 'package:resume/pages/work_page.dart';
import 'package:resume/widgets/inherited/resume_inherited.dart';
import 'package:resume/widgets/inherited/upwork_inherited.dart';

class MobileScreen extends StatelessWidget {
  final double maxHeight;
  const MobileScreen(this.maxHeight, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pages = [
      const SizedBox(height: 605,child: IntroPage()),
      const SizedBox(height: 605,child: AboutPage()),
      const SizedBox(height: 605,child: PortfolioPage()),
      const SizedBox(height: 605,child: WorkPage()),
      const SizedBox(height: 605,child: AchievementsPage()),
      if(UpworkInherited.of(context).upworkMode) const SizedBox(height: 605,child: ContactPage())
    ];

    return ResumeInherited(
      pageController: null,
      isWeb: false,
      child: Column(
        children: [
          Expanded(
            child: ListView(
                key: const PageStorageKey<String>('MainPageList'),
                scrollDirection: Axis.vertical,
                children: pages),
          )
        ],
      ),
    );
  }
}
