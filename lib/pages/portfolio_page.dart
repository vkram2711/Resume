import 'package:flutter/material.dart';

import '../models/job_model.dart';
import '../widgets/header.dart';
import '../widgets/inherited/resume_inherited.dart';
import '../widgets/page_view/horizontal_tab_bar.dart';
import '../widgets/page_view/vertical_tab_bar.dart';
import '../widgets/text/hyperlink.dart';
import '../widgets/work_card.dart';

int currentJob = 0;

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<JobModel> jobModels = [
      JobModel(
        mainImage: 'assets/ai_fresh.png',
        titleShort: 'AI Fresh Station',
        title: TextSpan(children: [
          hyperlink(
              text: 'AI Fresh Station',
              link: 'https://drive.google.com/file/d/1gsBT_K1n_qIYcLob0cSxa1mpbCMNQSrz/view?usp=sharing',
              context: context),
        ]),
        position: 'Software Engineer',
        description: [
          'Our team developed an indoor gardening system that helps users to grow crops without leaving home.',
          'My role was to develop a mobile app and server-side.',
          'This project won silver medal at iCan 2020, a silver medal at Warsaw Invention Show, and a gold medal at INTARG Poland.',
        ],
        timeInterval: 'Nov 2019 - Dec 2021',
        skills: [],
      ),
      JobModel(
        mainImage: 'assets/the_gray_area.png',
        titleShort: 'The Gray Area',
        title: TextSpan(children: [
          hyperlink(
              text: 'The Gray Area',
              link: 'https://lablab.ai/event/ai-startup-hackathon/minerva-go/the-gray-area-the-bias-mitigating-newsletter',
              context: context),
        ]),
        position: 'Backend Developer',
        description: [
          'Our team developed in 1 week a prototype of AI generated news list for LabLab hackathon',
          'Internet is getting scrapped for same news coverage in different media and compiled into one'
        ],
        timeInterval: 'Feb 2023',
        skills: [],
      ),
    ];

    List<Widget> pageTabs = List.generate(
      jobModels.length,
          (index) =>
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ResumeInherited
                  .of(context)
                  .isWeb
                  ? RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    jobModels[index].titleShort,
                    style: const TextStyle(fontSize: 24),
                  ))
                  : Text(
                jobModels[index].titleShort,
                style: const TextStyle(fontSize: 24),
              )
            ],
          ),
    );

    if (ResumeInherited
        .of(context)
        .isWeb)
      pageTabs = pageTabs.reversed.toList();
    final PageController pageController =
    PageController(initialPage: currentJob);

    List<Widget> pages =
    List.generate(jobModels.length, (index) => WorkCard(jobModels[index]));

    if (ResumeInherited
        .of(context)
        .isWeb) {
      return Column(
        children: [
          const Header(
            accentText: '3. ',
            text: 'Portfolio',
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
                          child: VerticalTabBar(pageTabs, pageController),
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
            text: 'Portfolio',
          ),
          HorizontalTabBar(pageTabs, pageController),
          Expanded(
            child: PageView(
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
