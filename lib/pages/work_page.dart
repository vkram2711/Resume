import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:resume/models/job_model.dart';
import 'package:resume/resources/styles.dart';

import 'package:resume/widgets/header.dart';
import 'package:resume/widgets/page_view/vertical_page_tabs.dart';
import 'package:resume/widgets/text/hyperlink.dart';
import 'package:resume/widgets/work_card.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkPage extends StatelessWidget {
  const WorkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    final List<JobModel> jobModels = [
      JobModel(
        mainImage: 'assets/fittrack.png',
        secondaryImage: 'assets/dev-better.png',
        titleShort: 'Dev-Better',
        title: TextSpan(children: [
          hyperlink(
              text: 'Dev-Better',
              link: 'https://dev-better.com/',
              context: context),
          TextSpan(text: ', ', style: primaryTextStyle(context, fontSize: 36)),
          hyperlink(
              text: 'FitTrack',
              link: 'https://getfittrack.com/',
              context: context),
          TextSpan(
              text: ' project',
              style: primaryTextStyle(
                context,
                fontSize: 36,
              )),
        ]),
        position: 'Flutter Developer',
        description: TextSpan(
          text: '''• Worked on features implementing into app 
• Covered app with integration tests 
• Managed team of 3 devs''',
          style: primaryTextStyle(context),
        ),
        skills: ['Flutter', 'Integrated testing', 'Management'],
      ),
      JobModel(
        mainImage: 'assets/ai_fresh.png',
        titleShort: 'AI Fresh Station',
        title: TextSpan(children: [
          hyperlink(
              text: 'AI Fresh Station',
              link: 'https://getfittrack.com/',
              context: context),
        ]),
        position: 'Software Engineer',
        description: TextSpan(
          text:
              '''Our team developed an indoor gardening system that helps users to grow crops without leaving home. My role was to develop a mobile app and server-side. 
This project won silver medal at iCan 2020, a silver medal at Warsaw Invention Show, and a gold medal at INTARG Poland.''',
          style: primaryTextStyle(context),
        ),
        skills: [
          'Flutter',
          'Flask',
          'Python',
          'MySQl',
        ],
      ),
      JobModel(
        mainImage: 'assets/taxi_finder.svg',
        titleShort: 'Taxi Finder',
        title: TextSpan(
          text: 'Taxi Finder',
          style: accentTextStyle(context, fontSize: 36),
        ),
        position: 'Android Developer',
        description: TextSpan(
          text: 'Developed Android app MVP for taxi aggregator',
          style: primaryTextStyle(context),
        ),
        skills: ['Android'],
      ),
      JobModel(
        mainImage: 'assets/bond.png',
        titleShort: 'Bond Film Platform',
        title: TextSpan(
          text: 'Bond Film Platform',
          style: accentTextStyle(context, fontSize: 36),
        ),
        position: 'Android Developer',
        description: TextSpan(
          text:
              'DWas hired as an android developer. In 3 months in solo created youtube-like android app MVP.',
          style: primaryTextStyle(context),
        ),
        skills: ['Android'],
      )
    ];

    List<String> pageTabs = [];
    List<Widget> pages = [];

    for (int i = 0; i < jobModels.length; i++) {
      pageTabs.add(jobModels[i].titleShort);
      pages.add(WorkCard(jobModels[i]));
    }

    return Column(
      children: [
        const Header(
          accentText: '3. ',
          text: 'Work',
        ),
        Expanded(
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: VerticalPageTabs(pageController, pageTabs),
              ),
              Flexible(
                flex: 2,
                child: PageView(
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: pages),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
