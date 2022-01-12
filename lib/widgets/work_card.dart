import 'package:flutter/material.dart';
import 'package:resume/models/job_model.dart';
import 'package:resume/widgets/company_logo.dart';
import 'package:resume/widgets/skill_badge.dart';
import 'package:resume/widgets/text/secondary_header_text.dart';

//TODO: timestapms
class WorkCard extends StatelessWidget {
  final JobModel jobModel;
  const WorkCard(this.jobModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> skills = [];
    for (int i = 0; i < jobModel.skills.length; i++) {
      skills.add(SkillBadge(jobModel.skills[i]));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CompanyLogo(
                    jobModel.mainImage,
                    secondaryImage: jobModel.secondaryImage,
                  ),
                  Wrap(
                    children: skills,
                  )
                ],
              ),
            ),
            Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: jobModel.title,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 18),
                      child: SecondaryHeaderText(jobModel.position),
                    ),
                    RichText(text: jobModel.description),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
