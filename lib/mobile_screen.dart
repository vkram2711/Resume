import 'package:flutter/material.dart';
import 'package:resume/pages/about_page.dart';
import 'package:resume/pages/achievements_page.dart';
import 'package:resume/pages/contact_page.dart';
import 'package:resume/pages/intro_page.dart';
import 'package:resume/pages/portfolio_page.dart';
import 'package:resume/pages/work_page.dart';
import 'package:resume/widgets/inherited/page_inherited.dart';
import 'package:resume/widgets/inherited/resume_inherited.dart';
import 'package:resume/widgets/inherited/upwork_inherited.dart';

class MobileScreen extends StatelessWidget {
  late ScrollController scrollController;
  late double maxHeight;

  MobileScreen(double page, double maxHeight, {Key? key}) : super(key: key){
    this.maxHeight = maxHeight > 605? maxHeight : 605;
    scrollController = ScrollController(initialScrollOffset: page * this.maxHeight);
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      SizedBox(height: maxHeight,child: const IntroPage()),
      SizedBox(height: maxHeight,child: const AboutPage()),
      SizedBox(height: maxHeight,child: const PortfolioPage()),
      SizedBox(height: maxHeight,child: WorkPage()),
      SizedBox(height: maxHeight,child: const AchievementsPage()),
      if(!UpworkInherited.of(context).upworkMode) SizedBox(height: maxHeight,child: const ContactPage())
    ];

    scrollController.addListener(() {
      PageInherited.of(context).currentPage = scrollController.offset/maxHeight;
    });

    return ResumeInherited(
      pageController: null,
      isWeb: false,
      child: Column(
        children: [
          Expanded(
            child: ListView(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                children: pages),
          )
        ],
      ),
    );
  }
}
