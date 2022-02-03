import 'package:flutter/material.dart';

class UpworkInherited extends InheritedWidget {
  final bool upworkMode;
  const UpworkInherited({Key? key, required this.upworkMode, required Widget child})
      : super(key: key, child: child);

  static UpworkInherited of(BuildContext context){
    final result = context.dependOnInheritedWidgetOfExactType<UpworkInherited>();
    assert(result != null, 'No ResumeInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(UpworkInherited oldWidget) =>
      oldWidget.upworkMode != upworkMode;
}
