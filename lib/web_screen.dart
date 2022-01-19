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

class WebScreen extends StatelessWidget {
  const WebScreen({Key? key}) : super(key: key);

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
      isWeb: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ResumeBar(),
          Expanded(
            child: Row(
              children: [
                Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    )),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 8,
                  child: PageView(
                      controller: controller,
                      scrollDirection: Axis.vertical,
                      children: pages),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 48),
                        child: PageViewIndicator(pages.length),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}