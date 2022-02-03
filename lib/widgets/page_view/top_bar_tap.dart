import 'package:flutter/cupertino.dart';
import 'package:resume/widgets/text/title_text.dart';

import '../resume_inherited.dart';

class TopBarTab extends StatelessWidget {
  final int page;
  final String primaryText;

  const TopBarTab(this.primaryText, this.page, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ResumeInherited.of(context).pageController.animateToPage(page,
            duration: const Duration(milliseconds: 400), curve: Curves.linear);
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TitleText('$page. ', primaryText)),
    );
  }
}
