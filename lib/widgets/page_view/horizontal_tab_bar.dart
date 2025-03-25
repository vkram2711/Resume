import 'package:flutter/material.dart';
import 'package:resume/pages/work_page.dart';

class HorizontalTabBarState extends State<HorizontalTabBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(
        initialIndex: currentJob, length: widget.tabs.length, vsync: this);
    tabController.addListener(() {
      currentJob = tabController.index;
    });

    return TabBar(
      tabs: widget.tabs,
      isScrollable: true,
      controller: tabController,
      onTap: (index) {
        widget.pageController.animateToPage(index,
            duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
      },
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      indicatorColor: Theme.of(context).splashColor,
      labelColor: Theme.of(context).splashColor,
      unselectedLabelColor: Theme.of(context).primaryColor,
    );
  }
}

class HorizontalTabBar extends StatefulWidget {
  final List<Widget> tabs;
  final PageController pageController;

  const HorizontalTabBar(this.tabs, this.pageController, {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => HorizontalTabBarState();
}
