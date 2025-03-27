import 'package:flutter/material.dart';
import 'package:resume/models/job_model.dart';
import 'package:resume/pages/project_details_page.dart';
import 'package:resume/widgets/company_logo.dart';
import 'package:resume/widgets/inherited/resume_inherited.dart';
import 'package:resume/widgets/text/primary_text.dart';
import 'package:resume/widgets/text/secondary_header_text.dart';
import 'buttons/details_button.dart';

class WorkCard extends StatelessWidget {
  final JobModel jobModel;

  const WorkCard(this.jobModel, {Key? key}) : super(key: key);

  void _openDetailsPage(BuildContext context) {
    Navigator.of(context).push(PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 600),
      pageBuilder: (context, animation, secondaryAnimation) {
        return ProjectDetailsPage(
          project: jobModel.titleShort,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).splashColor,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.black,
          ),
        );
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = !ResumeInherited.of(context).isWeb;
    final padding = isMobile ? 16.0 : 32.0;
    final logoMaxWidth = isMobile ? 100.0 : 150.0;
    final accentColor = Theme.of(context).splashColor;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: padding),
          child: Hero(
            tag: 'work_card_${jobModel.title.toPlainText()}',
            child: Material(
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: accentColor, width: 2.0),
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.black,
                ),
                child: Padding(
                  padding: EdgeInsets.all(padding),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: logoMaxWidth),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: padding),
                              child: CompanyLogo(
                                jobModel.mainImage,
                                secondaryImage: jobModel.secondaryImage,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(text: jobModel.title),
                                DetailsButton(
                                  onPressed: () => _openDetailsPage(context),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 18),
                              child: SecondaryHeaderText(jobModel.position),
                            ),
                            Flexible(
                              child: _buildDescription(context, jobModel.description),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: padding, top: 16),
                                child: PrimaryText(jobModel.timeInterval),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDescription(BuildContext context, List<String> points) {
    final isMobile = !ResumeInherited.of(context).isWeb;
    final textSize = isMobile ? 16.0 : 24.0;
    final spacing = isMobile ? 8.0 : 12.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: points
          .map((point) => Padding(
        padding: EdgeInsets.only(bottom: spacing),
        child: Text(
          '• $point',
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: textSize),
        ),
      ))
          .toList(),
    );
  }
}
