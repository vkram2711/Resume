import 'package:flutter/material.dart';
import 'package:resume/widgets/text/secondary_header_text.dart';

class SkillBadge extends StatelessWidget {
  final String skill;
  const SkillBadge(this.skill, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).secondaryHeaderColor,
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
            child: SecondaryHeaderText(skill),
          )),
    );
  }
}
