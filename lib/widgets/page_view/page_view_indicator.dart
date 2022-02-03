import 'dart:math';

import 'package:flutter/material.dart';
import 'package:resume/widgets/inherited/resume_inherited.dart';

class Rotation45Degree extends StatelessWidget {
  final Widget child;

  const Rotation45Degree({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: const AlwaysStoppedAnimation(45 / 360),
      child: child,
    );
  }
}

class Indicator extends AnimatedWidget {
  final int page;
  final PageController pageController;

  const Indicator(this.page, this.pageController, {Key? key})
      : super(key: key, listenable: pageController);

  @override
  Widget build(BuildContext context) {
    double pagePosition =
        pageController.page ?? pageController.initialPage as double;
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 -
            ((pageController.page ?? pageController.initialPage) - page).abs(),
      ),
    );
    double size = (15 - 1.0) * selectedness;
    return GestureDetector(
      onTap: () {
        pageController.animateToPage(page,
            duration: const Duration(milliseconds: 400), curve: Curves.linear);
      },
      child: Rotation45Degree(
        child: Container(
          width: 26,
          height: 26,
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(0.5 * (pagePosition - page)),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).splashColor,
                    ),
                    width: size,
                    height: size),
              ),
            ),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).splashColor,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}

class VerticalLine extends StatelessWidget {
  final double height;

  const VerticalLine({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.5),
      child: Container(
        width: 1,
        height: height,
        color: Theme.of(context).splashColor,
      ),
    );
  }
}

class PageViewIndicator extends StatelessWidget {
  final int numberOfPages;

  const PageViewIndicator(this.numberOfPages, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> indicators = [];
    for (int i = 0; i < numberOfPages; i++) {
      indicators.add(Indicator(i, ResumeInherited.of(context).pageController));
      if (i + 1 < numberOfPages) {
        indicators.add(const VerticalLine(height: 40));
      }
    }
    return Column(children: indicators);
  }
}
