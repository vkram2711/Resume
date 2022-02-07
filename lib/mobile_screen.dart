import 'package:flutter/material.dart';
import 'package:resume/pages/about_page.dart';
import 'package:resume/pages/achievements_page.dart';
import 'package:resume/pages/contact_page.dart';
import 'package:resume/pages/intro_page.dart';
import 'package:resume/pages/portfolio_page.dart';
import 'package:resume/pages/work_page.dart';
import 'package:resume/widgets/inherited/resume_inherited.dart';
import 'package:resume/widgets/inherited/upwork_inherited.dart';

class MobileScreen extends StatefulWidget {
  late ScrollController scrollController;
  final Function updatePage;
  final maxHeight = 690.0;
  //for some reason flutter want it like this or will throw callback for "ext.flutter.inspector.getRootWidgetSummaryTree"
  MobileScreen(double page, double maxHeight, this.updatePage, {Key? key})
      : super(key: key) {
    //this.maxHeight = maxHeight > 605 ? maxHeight : 605;
    scrollController = ScrollController(initialScrollOffset: page * maxHeight);
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
  /* @override
  void initState() {
    widget.scrollController.addListener(() {
      widget.updatePage(widget.scrollController.offset/widget.maxHeight);
    });
    return super.initState();
  }*/
  //Also if I will add removeListener in dispose or move listener to init state it will throw: callback for "ext.flutter.inspector.getRootWidgetSummaryTree"
  @override
  Widget build(BuildContext context) {
    final pages = [
      SizedBox(
          height: widget.maxHeight,
          child: const Padding(padding: EdgeInsets.all(16), child: IntroPage())),
      SizedBox(
          height: widget.maxHeight,
          child: const Padding(padding: EdgeInsets.all(16), child: AboutPage())),
      //SizedBox(height: widget.maxHeight, child: const Padding(padding: EdgeInsets.all(16), child: PortfolioPage())),
      SizedBox(
          height: widget.maxHeight,
          child: Padding(padding: const EdgeInsets.all(16), child: WorkPage())),
      //SizedBox(height: widget.maxHeight, child: const Padding(padding: EdgeInsets.all(16), child: AchievementsPage())),
      if (!UpworkInherited.of(context).upworkMode)
        SizedBox(
            height: widget.maxHeight,
            child: const Padding(padding: EdgeInsets.all(16), child: ContactPage()))
    ];

    widget.scrollController.addListener(() {
      widget.updatePage(widget.scrollController.offset / widget.maxHeight);
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
