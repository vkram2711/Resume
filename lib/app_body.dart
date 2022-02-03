import 'package:flutter/material.dart';
import 'package:resume/web_screen.dart';
import 'package:resume/widgets/inherited/upwork_inherited.dart';

import 'mobile_screen.dart';

class AppBody extends StatelessWidget {
  final bool upworkMode;

  const AppBody(this.upworkMode, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UpworkInherited(
      upworkMode: upworkMode,
      child: Scaffold(
          backgroundColor: Colors.black,
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if(constraints.maxWidth > 1050) {
                return const WebScreen();
              } else {
                return MobileScreen(constraints.maxHeight);
              }
            },
          )
      ),
    );
  }
}