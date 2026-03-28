import 'package:flutter/material.dart';
import 'package:resume/models/job_model.dart';
import 'package:resume/resources/styles.dart';
import 'package:resume/widgets/header.dart';
import 'package:resume/widgets/page_view/horizontal_tab_bar.dart';
import 'package:resume/widgets/page_view/vertical_tab_bar.dart';
import 'package:resume/widgets/inherited/resume_inherited.dart';
import 'package:resume/widgets/text/hyperlink.dart';
import 'package:resume/widgets/work_card.dart';

class WorkPage extends StatefulWidget {
  final int initialPageIndex;
  final ValueChanged<int>? onPageChanged;

  WorkPage({Key? key, this.initialPageIndex = 0, this.onPageChanged})
      : super(key: key);

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  late PageController _pageController;
  late int _pageIndex;

  @override
  void initState() {
    super.initState();
    _pageIndex = widget.initialPageIndex;
    _pageController = PageController(initialPage: widget.initialPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<JobModel> jobModels = [
      JobModel(
        mainImage: 'assets/jet.png',
        titleShort: 'PrivateJet.com',
        title: hyperlink(
            text: 'PrivateJet.com', link: 'https://privatejet.com/', context: context),
        position: 'Machine Learning / AI Engineer',
        description: [
          "Developed an LLM-integrated XGBoost-based ML model trained on 100k+ historical charter flight records to predict pricing, improving quote accuracy by ~20% and supporting faster sales turnaround.",
          "Researched and evaluated 20 locally-hosted LLMs for sales automation use cases, benchmarking models against accuracy, speed, and infrastructure constraints.",
        ],
        timeInterval: 'May 2025 - Sep 2025',
        skills: ['XGBoost', 'Python', 'FastAPI', 'LLM'],
      ),
      JobModel(
        mainImage: 'assets/edgur_logo.jpeg',
        titleShort: 'Edgur',
        title: hyperlink(
            text: 'Edgur', link: 'https://edgur.com/', context: context),
        position: 'Full-stack Software Developer / AI Engineer',
        description: [
          'Led backend refactor, reducing technical debt and cutting codebase size by 40%, and architected authentication, billing, and admin systems supporting 15% retention growth.',
          'Led the integration of semantic search and an AI recommendation engine, resulting in +20% user engagement.',
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
        position: 'Independent Software & Consultant (Backend/Mobile/AI)',
        description: [
          'Crypto Banking MVP — Built a Flutter mobile app with a Go backend, integrating Kraken and Circle APIs for up to 1,000 seamless daily USDC transactions with zero critical failures.',
          'Healthcare Support Chatbot — Designed and deployed a conversational support API for a Sweden-based clinic, automating triage for common patient queries and cutting manual support by 30%.',
          'AI Educational Assistant — Built a RAG-based chatbot for a Saudi Arabian edtech client, ingesting a knowledge base from text and video and deploying via Telegram; reduced lesson prep time by 25%.',
        ],
        timeInterval: 'Feb 2022 - Aug 2023',
        skills: ['Flutter', 'Go', 'Flask', 'Firebase', 'React', 'Langchain', 'LLM'],
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
        ]),
        position: 'Flutter Developer',
        description: [
          'Led a team of three Flutter developers, creating an integration test infrastructure and developing a fitness app with over 800,000 global users, improving cross-platform reliability by 15%.',
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
                          child: VerticalTabBar(
                            pageTabs,
                            _pageController,
                            initialPageIndex: _pageIndex,
                            onPageChanged: (i) {
                setState(() => _pageIndex = i);
                widget.onPageChanged?.call(i);
              },
                          ),
                        ),
                        Flexible(flex: 1, child: Container())
                      ],
                    )),
                Flexible(
                  flex: 4,
                  child: PageView(
                      controller: _pageController,
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
            _pageController,
            initialPageIndex: _pageIndex,
            onPageChanged: (i) {
                setState(() => _pageIndex = i);
                widget.onPageChanged?.call(i);
              },
          ),
          Expanded(
            child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: pages),
          ),
        ],
      );
    }
  }
}