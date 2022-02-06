import 'package:flutter/material.dart';
import 'package:resume/web_screen.dart';
import 'package:resume/widgets/inherited/upwork_inherited.dart';

import 'mobile_screen.dart';


class AppBody extends StatefulWidget {
  final bool upworkMode;

  const AppBody(this.upworkMode, {Key? key}) : super(key: key);

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  double currentPage = 0;

  void _updatePage(double newPage){
    currentPage = newPage;
  }

  @override
  Widget build(BuildContext context) {
    return UpworkInherited(
      upworkMode: widget.upworkMode,
      child: Scaffold(
          backgroundColor: Colors.black,
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth > 1050) {
                return WebScreen(currentPage.toInt(), _updatePage);
              } else {
                return MobileScreen(currentPage, constraints.maxHeight, _updatePage);
              }
            },
          ),
      ),
    );
  }
}