import 'package:flutter/material.dart';

class ResumeInherited extends InheritedWidget {
  final PageController pageController;
  final bool isWeb;

  const ResumeInherited({Key? key, required this.pageController, required this.isWeb, required Widget child})
      : super(key: key, child: child);

  static ResumeInherited of(BuildContext context){
    final result = context.dependOnInheritedWidgetOfExactType<ResumeInherited>();
    assert(result != null, 'No ResumeInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ResumeInherited oldWidget) =>
      oldWidget.pageController != pageController;
}
