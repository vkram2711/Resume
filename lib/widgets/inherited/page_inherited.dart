import 'package:flutter/material.dart';

class PageInherited extends InheritedWidget {
  double currentPage;

  PageInherited({Key? key, required this.currentPage, required Widget child}) : super(key: key, child: child);

  static PageInherited of(BuildContext context){
    final result = context.dependOnInheritedWidgetOfExactType<PageInherited>();
    assert(result != null, 'No PageInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(PageInherited oldWidget) => oldWidget.currentPage != currentPage;
}
