import 'package:flutter/material.dart';
import 'package:resume/widgets/text/accent_text.dart';
import 'package:resume/widgets/text/primary_text.dart';
import 'package:resume/widgets/text/secondary_header_text.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              AccentText('Hi, my name is'),
              SecondaryHeaderText('Vlad Kramarenko', fontSize: 64),
              PrimaryText(
                'I write code',
                fontSize: 48,
              ),
              Padding(
                padding: EdgeInsets.only(top: 12),
                child: PrimaryText(
                    'I’m a software engineer with a universal skillset. I have experience in Backend and Mobile development with a bit of AI'),
              )
            ],
          ),
        ),
      ],
    );
  }
}
