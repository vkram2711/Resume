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
        mainImage: 'assets/jet.png',
        titleShort: 'PrivateJet.com',
        title: hyperlink(
            text: 'Edgur', link: 'https://privatejet.com/', context: context),
        position: 'Machine Learning / AI Engineer',
        description: [
          "Led AI initiatives for a private jet charter brokerage platform, deploying locally hosted LLMs for sales automation and developing an XGBoost-based ML model trained on 100k+ historical charter flight records to predict pricing, improving quote accuracy by ~20% and supporting faster sales turnaround.",
        ],
        timeInterval: 'May 2025 - Sep 2025',
        skills: ['Django', 'PostgreSQL', 'React', 'Pinecone', 'LLM'],
      ),
      JobModel(
        mainImage: 'assets/edgur_logo.jpeg',
        titleShort: 'Edgur',
        title: hyperlink(
            text: 'Edgur', link: 'https://edgur.com/', context: context),
        position: 'Software developer',
        description: [
          'Refactored backend systems, reducing codebase size by 40%, enhancing scalability and readability',
          'Developed and optimized critical features such as admin dashboards, authentication systems, payments, search, and AI-driven recommendation engines, increasing user retention by 15%',
          'Led the integration of semantic search and AI playlist generation, resulting in +20% user engagement',
        ],
        timeInterval: 'May 2024 - Sep 2024',
        skills: ['Django', 'PostgreSQL', 'React', 'Pinecone', 'LLM'],
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
          'Completed 10+ projects on Upwork, earning $10,000+ with consistent 4-5 star client reviews.',
          'Mobile crypto banking app MVP, integrating Kraken and Circle APIs to enable seamless USDC transactions, processing up to 1,000 daily transactions during the testing phase.',
          'Prototype of customer support chatbot API for a Sweden-based clinic. Automated common inquiries, reducing manual support requests by 30%',
          'Educational assistant chatbot for a Saudi Arabian client, designed to assist teachers using a knowledge base from text and video files, and deployed the solution via a Telegram bot integration, streamlining lesson planning and reducing preparation time by 25%.',
        ],
        timeInterval: 'Feb 2022 - Aug 2023',
        skills: ['Flutter', 'Flask', 'Firebase', 'React', 'Pinecone', 'LLM', 'Go'],
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
          'Created an integration test infrastructure for a fitness app with over 800,000 global users, improving cross-platform reliability by 15%.',
          'Streamlined onboarding for new developers by creating detailed tutorials and documentation, reducing ramp-up time from one week to two days, and increasing team productivity by 70%.',
          'Led a team of three Flutter developers to create 50+ test cases for app screens and resolve critical bugs',
        ],
        timeInterval: 'Jun 2021 - Nov 2021',
        skills: ['Flutter'],
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