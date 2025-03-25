import 'package:flutter/material.dart';
import 'package:resume/pages/about_page.dart';
import 'package:resume/pages/contact_page.dart';
import 'package:resume/pages/intro_page.dart';
import 'package:resume/pages/work_page.dart';
import 'package:resume/widgets/inherited/resume_inherited.dart';
import 'package:resume/widgets/inherited/upwork_inherited.dart';

class MobileScreen extends StatefulWidget {
  final ScrollController scrollController;
  final Function updatePage;
  static const maxHeight = 690.0;

  MobileScreen(double page, this.updatePage, {Key? key})
      : scrollController =
            ScrollController(initialScrollOffset: page * maxHeight),
        super(key: key);

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  @override
  void initState() {
    print('init state mobile');
    widget.scrollController.addListener(() {
      print(
          'mobile: ${widget.scrollController.offset / MobileScreen.maxHeight}');
      widget
          .updatePage(widget.scrollController.offset / MobileScreen.maxHeight);
    });
    return super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      const SizedBox(
          height: MobileScreen.maxHeight,
          child: Padding(padding: EdgeInsets.all(16), child: IntroPage())),
      const SizedBox(
          height: MobileScreen.maxHeight,
          child: Padding(padding: EdgeInsets.all(16), child: AboutPage())),
      SizedBox(
          height: MobileScreen.maxHeight,
          child: Padding(padding: const EdgeInsets.all(16), child: WorkPage())),
      if (!UpworkInherited.of(context).upworkMode)
        const SizedBox(
            height: MobileScreen.maxHeight,
            child: Padding(padding: EdgeInsets.all(16), child: ContactPage()))
    ];

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

  @override
  void dispose() {
    print('dispose mobile');
    widget.scrollController.removeListener(() {
      print('mobile removed');
    });
    return super.dispose();
  }
}
