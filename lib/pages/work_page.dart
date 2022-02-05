import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:resume/models/job_model.dart';
import 'package:resume/resources/styles.dart';

import 'package:resume/widgets/header.dart';
import 'package:resume/widgets/page_view/horizontal_tab_bar.dart';
import 'package:resume/widgets/page_view/vertical_page_tabs.dart';
import 'package:resume/widgets/page_view/vertical_tab_bar.dart';
import 'package:resume/widgets/inherited/resume_inherited.dart';
import 'package:resume/widgets/text/hyperlink.dart';
import 'package:resume/widgets/work_card.dart';
import 'package:url_launcher/url_launcher.dart';

int currentJob = 0;

class WorkPage extends StatelessWidget {
  final PageController pageController = PageController();

  WorkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          text: '''• Worked on features implementing into the app 
• Covered app with integration tests 
• Managed team of 3 devs''',
          style: primaryTextStyle(context),
        ),
        timeInterval: 'Jun 2021 - Nov 2021',
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
        timeInterval: 'Nov 2019 - Dec 2021',
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
        timeInterval: 'Nov 2018 - May 2019',
      ),
      JobModel(
        mainImage: 'assets/bond.png',
        titleShort: 'Bond',
        title: TextSpan(
          text: 'Bond Film Platform',
          style: accentTextStyle(context, fontSize: 36),
        ),
        position: 'Android Developer',
        description: TextSpan(
          text:
              'Was hired as an android developer. In 3 months in solo created youtube-like android app MVP.',
          style: primaryTextStyle(context),
        ),
        timeInterval: 'Jun 2018 - Oct 2018',
        skills: ['Android'],
      )
    ];

    List<Widget> pageTabs = List.generate(
      jobModels.length,
      (index) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ResumeInherited.of(context).isWeb ?
          RotatedBox(
            quarterTurns: 1,
            child: Text(
              jobModels[index].titleShort,
              style: const TextStyle(fontSize: 24),
            )) : Text(
            jobModels[index].titleShort,
            style: const TextStyle(fontSize: 24),
            )
        ],
      ),
    );

    if(ResumeInherited.of(context).isWeb) pageTabs = pageTabs.reversed.toList();

    List<Widget> pages =
        List.generate(jobModels.length, (index) => WorkCard(jobModels[index]));

    if(ResumeInherited.of(context).isWeb) {
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
                    fit: FlexFit.tight,
                    child: Column(
                      children: [
                        Flexible(flex: 1, child: Container()),
                        Flexible(
                          flex: 3,
                          child: VerticalTabBar(
                              pageTabs,
                              pageController
                          ),
                        ),
                        Flexible(flex: 1, child: Container())
                      ],
                    )),
                Flexible(
                  flex: 4,
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
    } else {
      return Column(
        children: [
          const Header(
            accentText: '3. ',
            text: 'Work',
          ),
          HorizontalTabBar(
              pageTabs,
              pageController
          ),
          Expanded(
            child: PageView(
                key: const PageStorageKey<String>('WorkPages'),
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: pages),
          ),
        ],
      );
    }
  }
}
