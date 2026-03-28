import 'package:flutter/material.dart';
import 'package:resume/pages/about_page.dart';
import 'package:resume/pages/contact_page.dart';
import 'package:resume/pages/intro_page.dart';
import 'package:resume/pages/work_page.dart';
import 'package:resume/pages/portfolio_page.dart';
import 'package:resume/widgets/inherited/resume_inherited.dart';
import 'package:resume/widgets/inherited/upwork_inherited.dart';
import 'package:resume/widgets/page_view/page_view_indicator.dart';
import 'package:resume/widgets/resume_bar.dart';

class WebScreen extends StatefulWidget {
  final PageController controller;
  final Function updatePage;

  WebScreen(int initialPage, this.updatePage, {Key? key})
      : controller = PageController(initialPage: initialPage),
        super(key: key);

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  int _workTabIndex = 0;
  int _portfolioTabIndex = 0;

  @override
  void initState() {
    widget.controller.addListener(() {
      widget.updatePage(widget.controller.page ?? 0);
    });
    return super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      const IntroPage(),
      const AboutPage(),
      WorkPage(
        initialPageIndex: _workTabIndex,
        onPageChanged: (i) => setState(() => _workTabIndex = i),
      ),
      PortfolioPage(
        initialPageIndex: _portfolioTabIndex,
        onPageChanged: (i) => setState(() => _portfolioTabIndex = i),
      ),
      if (!UpworkInherited.of(context).upworkMode) const ContactPage()
    ];

    return ResumeInherited(
      pageController: widget.controller,
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
                      controller: widget.controller,
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

  @override
  void dispose() {
    widget.controller.removeListener(() {});
    return super.dispose();
  }
}
