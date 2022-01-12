import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final List<Widget> mainModule;
  final List<Widget> secondaryModule;

  const BasePage(
      {this.mainModule = const [], this.secondaryModule = const [], Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: mainModule,
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: secondaryModule,
          ),
        )
      ],
    );
  }
}
