import 'package:flutter/material.dart';

class HorizontalTabBarState extends State<HorizontalTabBar>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: widget.initialPageIndex,
      length: widget.tabs.length,
      vsync: this,
    );
    _tabController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    widget.onPageChanged?.call(_tabController.index);
  }

  @override
  void didUpdateWidget(HorizontalTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialPageIndex != widget.initialPageIndex &&
        _tabController.index != widget.initialPageIndex) {
      _tabController.animateTo(widget.initialPageIndex);
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: widget.tabs,
      isScrollable: true,
      controller: _tabController,
      onTap: (index) {
        widget.pageController.animateToPage(index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn);
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
  final int initialPageIndex;
  final ValueChanged<int>? onPageChanged;

  const HorizontalTabBar(
    this.tabs,
    this.pageController, {
    Key? key,
    this.initialPageIndex = 0,
    this.onPageChanged,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => HorizontalTabBarState();
}
