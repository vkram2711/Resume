import 'package:flutter/material.dart';
import 'package:resume/widgets/text/accent_text.dart';
import 'package:resume/widgets/text/primary_text.dart';

class VerticalTabElement extends StatelessWidget {
  final bool selected;
  final String text;
  final int page;
  final PageController pageController;

  const VerticalTabElement(
      this.page, this.selected, this.text, this.pageController,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !selected
          ? () {
              pageController.animateToPage(page,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.linear);
            }
          : null,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(child: selected ? AccentText(text) : PrimaryText(text)),
            VerticalDivider(
              thickness: selected ? 3 : 1,
              color: selected
                  ? Theme.of(context).splashColor
                  : Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}

class _VerticalPageTabsState extends State<VerticalPageTabs> {
  double page = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [];

    widget.pageController.addListener(() {
      setState(() {
        page = widget.pageController.page!;
      });
    });
    for (int i = 0; i < widget.titles.length; i++) {
      tabs.add(VerticalTabElement(
          i, page == i, widget.titles[i], widget.pageController));
    }

    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: tabs);
  }
}

class VerticalPageTabs extends StatefulWidget {
  final PageController pageController;
  final List<String> titles;

  const VerticalPageTabs(this.pageController, this.titles, {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _VerticalPageTabsState();
}
