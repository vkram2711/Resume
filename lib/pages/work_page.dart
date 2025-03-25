import 'package:flutter/material.dart';
import 'package:resume/models/job_model.dart';
import 'package:resume/resources/styles.dart';
import 'package:resume/widgets/header.dart';
import 'package:resume/widgets/page_view/horizontal_tab_bar.dart';
import 'package:resume/widgets/page_view/vertical_tab_bar.dart';
import 'package:resume/widgets/inherited/resume_inherited.dart';
import 'package:resume/widgets/text/hyperlink.dart';
import 'package:resume/widgets/work_card.dart';

int currentJob = 0;

class WorkPage extends StatelessWidget {
  WorkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<JobModel> jobModels = [
      JobModel(
        mainImage: 'assets/edgur_logo.jpeg',
        titleShort: 'Edgur',
        title: hyperlink(
            text: 'Edgur', link: 'https://edgur.com/', context: context),
        position: 'Software developer',
        description: [
          'Refactored backend systems, reducing codebase size by 40% and enhancing scalability.',
          'Developed and launched critical features (admin dashboards, payments, AI recommendations) that improved user retention by 15% and engagement by 20%.',
          'Built a real-time user metrics dashboard, streamlining operational decision-making for admins by 30%.',
        ],
        timeInterval: 'May 2024 - Aug 2024',
        skills: ['Django', 'PostgreSQL', 'React', 'Pinecone', 'OpenAI'],
      ),
      JobModel(
        mainImage: 'assets/upwork_logo.jpeg',
        titleShort: 'Upwork',
        title: hyperlink(
            text: 'Upwork',
            link: 'http://upwork.com/freelancers/~01fde4bc85457f3469',
            context: context),
        position: 'Freelance Software developer',
        description: [
          'Delivered 10+ projects with \$10,000+ earnings and 4-5 star reviews, focusing on AI-powered, mobile, and backend solutions.',
          'Created an educational assistant chatbot for teachers, reducing lesson planning time by 25%, and a customer support chatbot for a Swedish clinic, cutting manual support requests by 30%.',
          'Built a mobile crypto banking app MVP handling 1,000 daily transactions using Flutter and Go.',
        ],
        timeInterval: 'May 2024 - Aug 2024',
        skills: ['Django', 'PostgreSQL', 'React', 'Pinecone', 'OpenAI'],
      ),
      JobModel(
        mainImage: 'assets/dev_better_company_logo.jpeg',
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
        description: [
          'Designed and implemented an integration test infrastructure for a fitness app with 800,000+ global users, improving cross-platform reliability by 15%.',
          'Streamlined onboarding for new developers by creating tutorials and documentation, reducing ramp-up time from one week to two days, increasing team productivity by 70%.',
          'Led a team of three Flutter developers, creating 50+ test cases for app screens and resolving critical bugs, enhancing app stability and user experience.',
        ],
        timeInterval: 'Jun 2021 - Nov 2021',
        skills: ['Flutter', 'Integrated testing', 'Management'],
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
            accentText: '2. ',
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
            text: 'Work',
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