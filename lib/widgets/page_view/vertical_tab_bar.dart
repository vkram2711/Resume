import 'package:flutter/material.dart';
import 'package:resume/pages/work_page.dart';

class VerticalTabBarState extends State<VerticalTabBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(
        initialIndex:
            widget.tabs.length - currentJob - 1,
        length: widget.tabs.length,
        vsync: this);
    tabController.addListener(() {
      currentJob =  widget.tabs.length - 1 - tabController.index;
    });

    return RotatedBox(
      quarterTurns: -1,
      child: TabBar(
        tabs: widget.tabs,
        controller: tabController,
        onTap: (index) {
          widget.pageController.animateToPage(widget.tabs.length - 1 - index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn);
        },
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        indicatorColor: Theme.of(context).splashColor,
        labelColor: Theme.of(context).splashColor,
        unselectedLabelColor: Theme.of(context).primaryColor,
      ),
    );
  }
}

class VerticalTabBar extends StatefulWidget {
  final List<Widget> tabs;
  final PageController pageController;

  const VerticalTabBar(this.tabs, this.pageController, {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => VerticalTabBarState();
}
