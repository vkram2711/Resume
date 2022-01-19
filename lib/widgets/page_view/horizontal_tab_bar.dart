import 'package:flutter/material.dart';

class HorizontalTabBarState extends State<HorizontalTabBar> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(initialIndex:  widget.tabs.length-1, length: widget.tabs.length, vsync: this);

    return TabBar(
      tabs: widget.tabs,
      controller: tabController,
      onTap: (index){
        widget.pageController.animateToPage(widget.tabs.length -1 - index, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
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

  const HorizontalTabBar(this.tabs, this.pageController, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HorizontalTabBarState();
}