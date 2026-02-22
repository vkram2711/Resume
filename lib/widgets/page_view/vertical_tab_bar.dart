import 'package:flutter/material.dart';

class VerticalTabBarState extends State<VerticalTabBar>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    final initialTabIndex = widget.tabs.length - 1 - widget.initialPageIndex;
    _tabController = TabController(
      initialIndex: initialTabIndex,
      length: widget.tabs.length,
      vsync: this,
    );
    _tabController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    final pageIndex = widget.tabs.length - 1 - _tabController.index;
    widget.onPageChanged?.call(pageIndex);
  }

  @override
  void didUpdateWidget(VerticalTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialPageIndex != widget.initialPageIndex &&
        _tabController.index != widget.tabs.length - 1 - widget.initialPageIndex) {
      _tabController.animateTo(widget.tabs.length - 1 - widget.initialPageIndex);
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
    return RotatedBox(
      quarterTurns: -1,
      child: TabBar(
        tabs: widget.tabs,
        controller: _tabController,
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
  final int initialPageIndex;
  final ValueChanged<int>? onPageChanged;

  const VerticalTabBar(
    this.tabs,
    this.pageController, {
    Key? key,
    this.initialPageIndex = 0,
    this.onPageChanged,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => VerticalTabBarState();
}
