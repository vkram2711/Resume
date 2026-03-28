import 'package:flutter/material.dart';

import '../models/job_model.dart';
import '../widgets/header.dart';
import '../widgets/inherited/resume_inherited.dart';
import '../widgets/page_view/horizontal_tab_bar.dart';
import '../widgets/page_view/vertical_tab_bar.dart';
import '../widgets/text/hyperlink.dart';
import '../widgets/work_card.dart';
import 'package:resume/resources/styles.dart';

class PortfolioPage extends StatefulWidget {
  final int initialPageIndex;
  final ValueChanged<int>? onPageChanged;

  const PortfolioPage(
      {Key? key, this.initialPageIndex = 0, this.onPageChanged})
      : super(key: key);

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
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
        mainImage: 'assets/ai_fresh.png',
        titleShort: 'AI Fresh Station',
        title: TextSpan(children: [
          hyperlink(
              text: 'AI Fresh Station',
              link: 'https://drive.google.com/file/d/1gsBT_K1n_qIYcLob0cSxa1mpbCMNQSrz/view?usp=sharing',
              context: context),
        ]),
        position: 'Co-Founder, Software Developer (Backend/Mobile)',
        description: [
          'Co-founded an IoT startup building an automated indoor gardening system; built a Flutter mobile app and Flask/SQL backend enabling real-time device control and data sync with 99.9% uptime.',
          'Won Gold (INTARG 2020), two silver medals (iCan, Warsaw Invention Show) across 3 international invention competitions (60+ countries, 475 participants).',
        ],
        timeInterval: 'Nov 2019 - Dec 2020',
        skills: [],
        links: const [
          JobLink(url: 'https://github.com/vkram2711/AI-Fresh-Station', icon: Icons.code, tooltip: 'GitHub'),
        ],
      ),
      JobModel(
        mainImage: null,
        titleShort: 'Flatview',
        title: TextSpan(
          text: 'flatview.news',
          style: accentTextStyle(context, fontSize: 36),
        ),
        position: 'Fullstack Developer',
        description: [
          'A news app that uses GPT-4o-mini to translate underreported foreign stories into 7 languages — so you can read what other countries are covering, not just your national media.',
          'Articles are fetched from GNews and WorldNewsAPI, translated in async LangChain batches, and served via Flask + MongoDB with Auth0 auth and Stripe payments.',
        ],
        timeInterval: 'Aug 2024',
        skills: [],
        links: const [
          JobLink(url: 'https://github.com/vkram2711/flatview.news', icon: Icons.code, tooltip: 'GitHub'),
        ],
      ),
      JobModel(
        mainImage: null,
        titleShort: 'Mankey',
        title: TextSpan(
          text: 'Mankey',
          style: accentTextStyle(context, fontSize: 36),
        ),
        position: 'Fullstack Developer',
        description: [
          "A knowledge management system where AI handles the logistics of organizing notes while you do the thinking that makes learning stick.",
          "Transform scattered highlights into interconnected permanent notes, synthesize clusters into navigable hubs, and publish polished work with auto-generated citations—all while retaining more than passive note-taking ever could.",
        ],
        timeInterval: 'Feb-Mar 2026',
        skills: [],
      ),
      JobModel(
        mainImage: null,
        titleShort: 'Tailor',
        title: TextSpan(
          text: 'Tailor',
          style: accentTextStyle(context, fontSize: 36),
        ),
        position: 'Fullstack Developer',
        description: [
          'SaaS platform for independent tailors to manage clients, measurements, and appointments — designed from user interviews with tailors across Bangkok and Buenos Aires.',
          'Clients self-book via a shareable link; tailors receive automatic email notifications for confirmations, reschedules, and cancellations.',
        ],
        timeInterval: 'Nov-Jan 2025',
        skills: [],
        links: const [
          JobLink(url: 'https://github.com/vkram2711/tailor-saas', icon: Icons.code, tooltip: 'GitHub'),
        ],
      ),
      JobModel(
        mainImage: null,
        titleShort: 'Battleships AI',
        title: hyperlink(
            text: 'Battleships AI',
            link: 'https://battleships-kwvy.onrender.com/',
            context: context),
        position: 'AI / Fullstack Developer',
        description: [
          'A Battleships game with a Prolog-powered AI opponent that reasons about board state using logic programming. React + Flask frontend/backend with Docker-based deployment.',
          'Features a Python–Prolog bridge enabling the AI to infer ship locations from shot history and make probabilistic decisions.',
        ],
        timeInterval: 'Nov 2025',
        skills: [],
        links: const [
          JobLink(url: 'https://github.com/vkram2711/battleships', icon: Icons.code, tooltip: 'GitHub'),
        ],
      ),
      JobModel(
        mainImage: null,
        titleShort: 'Insurance Parser',
        title: hyperlink(
            text: 'AI Insurance Claim Parser',
            link: 'https://www.loom.com/share/b0189cb6c6bc4196beeb28b42cdb8e86',
            context: context),
        position: 'Fullstack Developer',
        description: [
          'A Next.js 14 tool for parsing and validating insurance claim forms using LLM extraction with Server-Sent Events (SSE) for real-time streaming feedback.',
          'Implements Levenshtein-distance fuzzy matching to tolerate OCR errors and field-name variations in uploaded documents.',
        ],
        timeInterval: 'Apr 2025',
        skills: [],
        links: const [
          JobLink(url: 'https://github.com/vkram2711/ai-insurance-assesment', icon: Icons.code, tooltip: 'GitHub'),
        ],
      ),
      JobModel(
        mainImage: null,
        titleShort: 'Video Transcript',
        title: hyperlink(
            text: 'Video Transcript',
            link: 'https://github.com/vkram2711/video-transcript',
            context: context),
        position: 'Fullstack Developer',
        description: [
          'Real-time video transcription using OpenAI Whisper running locally — streams partial results to the browser via WebSockets as each chunk is processed.',
          'Companion CLI tool uses LangChain + FAISS + OpenAI embeddings to index the transcript and answer natural-language questions about the video.',
        ],
        timeInterval: 'Apr 2024',
        skills: [],
        links: const [
          JobLink(url: 'https://github.com/vkram2711/video-transcript', icon: Icons.code, tooltip: 'Transcription — GitHub'),
          JobLink(url: 'https://github.com/vkram2711/QA-over-video', icon: Icons.code, tooltip: 'Q&A — GitHub'),
        ],
      ),
      JobModel(
        mainImage: null,
        titleShort: 'AI Measurements',
        title: TextSpan(
          text: 'AI Measurements',
          style: accentTextStyle(context, fontSize: 36),
        ),
        position: 'Fullstack Developer',
        description: [
          'A web application that estimates human body measurements from front and side photos using pose detection and computer vision. Users upload images and enter their height to receive visualized pose landmarks and approximate measurements.',
        ],
        timeInterval: 'Jan 2026',
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
          'Built in one week for the LabLab AI hackathon: an AI-powered news aggregator that scrapes the same story from multiple outlets and compiles them into a single, balanced summary to reduce media bias.',
        ],
        timeInterval: 'Feb 2023',
        skills: [],
        links: const [
          JobLink(url: 'https://github.com/vkram2711/Gray-Area-Server', icon: Icons.code, tooltip: 'GitHub'),
        ],
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
                          child: ShaderMask(
                            shaderCallback: (bounds) => const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.white,
                                Colors.white,
                                Colors.transparent,
                              ],
                              stops: [0.0, 0.08, 0.92, 1.0],
                            ).createShader(bounds),
                            blendMode: BlendMode.dstIn,
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
                        ),
                        Flexible(flex: 1, child: Container()),
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
            text: 'Portfolio',
          ),
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.transparent,
                Colors.white,
                Colors.white,
                Colors.transparent,
              ],
              stops: [0.0, 0.06, 0.94, 1.0],
            ).createShader(bounds),
            blendMode: BlendMode.dstIn,
            child: HorizontalTabBar(
            pageTabs,
            _pageController,
            initialPageIndex: _pageIndex,
            onPageChanged: (i) {
                setState(() => _pageIndex = i);
                widget.onPageChanged?.call(i);
              },
            ),
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
