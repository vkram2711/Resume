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

class MobileScreen extends StatefulWidget {
  late ScrollController scrollController;
  late double maxHeight;

  //for some reason flutter want it like this or will throw callback for "ext.flutter.inspector.getRootWidgetSummaryTree"
  MobileScreen(double page, double maxHeight, {Key? key}) : super(key: key) {
    this.maxHeight = maxHeight > 605 ? maxHeight : 605;
    scrollController =
        ScrollController(initialScrollOffset: page * this.maxHeight);
  }

  /*
  MobileScreen(double page, double maxHeight, {Key? key}) :
    maxHeight = maxHeight > 605? maxHeight : 605,
    scrollController = ScrollController(initialScrollOffset: page * maxHeight > 605? maxHeight : 605),
    super(key: key);
  */

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  @override
  void initState() {
    widget.scrollController.addListener(() {
      PageInherited.of(context).currentPage = widget.scrollController.offset/widget.maxHeight;
    });
    return super.initState();
  }
  //Also if I will add removeListener in dispose or move listener to init state it will throw: callback for "ext.flutter.inspector.getRootWidgetSummaryTree"
  @override
  Widget build(BuildContext context) {
    final pages = [
      SizedBox(height: widget.maxHeight, child: const IntroPage()),
      SizedBox(height: widget.maxHeight, child: const AboutPage()),
      SizedBox(height: widget.maxHeight, child: const PortfolioPage()),
      SizedBox(height: widget.maxHeight, child: WorkPage()),
      SizedBox(height: widget.maxHeight, child: const AchievementsPage()),
      if (!UpworkInherited.of(context).upworkMode)
        SizedBox(height: widget.maxHeight, child: const ContactPage())
    ];

    widget.scrollController.addListener(() {
      PageInherited.of(context).currentPage =
          widget.scrollController.offset / widget.maxHeight;
    });

    return ResumeInherited(
      pageController: null,
      isWeb: false,
      child: Column(
        children: [
          Expanded(
            child: ListView(
                controller: widget.scrollController,
                scrollDirection: Axis.vertical,
                children: pages),
          )
        ],
      ),
    );
  }

/* @override
  void dispose() {
    widget.scrollController.removeListener(() { });
    return super.dispose();
  }*/
}
