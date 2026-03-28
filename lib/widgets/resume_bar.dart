import 'package:flutter/material.dart';
import 'package:resume/widgets/inherited/upwork_inherited.dart';
import 'package:resume/widgets/page_view/top_bar_tab.dart';
import 'package:resume/widgets/resume_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumeBar extends StatelessWidget {
  const ResumeBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const TopBarTab('About', 1),
          const TopBarTab('Work', 2),
          const TopBarTab('Portfolio', 3),
          //const TopBarTab('Achievements', 4),
          if (!UpworkInherited.of(context).upworkMode)
            const TopBarTab('Contact', 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ResumeButton(
              'Resume',
              () {
                launchUrl(
                  Uri.base.resolve('assets/pdf/Vladyslav_Kramarenko_Resume.pdf'),
                  mode: LaunchMode.externalApplication,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
