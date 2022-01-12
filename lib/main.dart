import 'package:flutter/material.dart';
import 'package:resume/pages/about_page.dart';
import 'package:resume/pages/portfolio_page.dart';
import 'package:resume/pages/intro_page.dart';
import 'package:resume/pages/work_page.dart';
import 'package:resume/widgets/page_view/page_view_indicator.dart';
import 'package:resume/widgets/resume_bar.dart';

//TODO: achievements, git, change top bar, listview generate
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: 0);
    const pages = [IntroPage(), AboutPage(), PortfolioPage(), WorkPage()];

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'ProximaNova',
          backgroundColor: Colors.black,
          splashColor: Colors.yellow[600],
          secondaryHeaderColor: Colors.white,
          primaryColor: Colors.grey[400]),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ResumeBar(),
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 185),
                    child: PageView(
                        controller: controller,
                        scrollDirection: Axis.vertical,
                        children: pages),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 155, right: 155),
                            child: PageViewIndicator(controller, pages.length),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
