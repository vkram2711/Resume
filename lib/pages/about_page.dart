import 'package:flutter/material.dart';
import 'package:resume/resources/styles.dart';
import 'package:resume/widgets/image_with_outlined_shadow.dart';
import 'package:resume/widgets/inherited/resume_inherited.dart';
import 'package:resume/widgets/text/about_text.dart';
import 'package:resume/widgets/header.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ResumeInherited.of(context).isWeb) {
      return _WebLayout();
    } else {
      return _MobileLayout();
    }
  }
}

// ── Web layout ──────────────────────────────────────────────────────────────

class _WebLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header(accentText: '1. ', text: 'About me'),
        const SizedBox(height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  AboutText(),
                  SizedBox(height: 24),
                  _SkillsSection(),
                  SizedBox(height: 16),
                  _EducationBlock(),
                ],
              ),
            ),
            const Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Padding(
                padding: EdgeInsets.only(top: 40, left: 24),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ImageWithOutlinedShadow(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ── Mobile layout ────────────────────────────────────────────────────────────

class _MobileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header(accentText: '1. ', text: 'About me'),
        const SizedBox(height: 12),
        Expanded(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                AboutText(fontSize: 14),
                SizedBox(height: 16),
                _SkillsSection(fontSize: 13),
                SizedBox(height: 12),
                _EducationBlock(fontSize: 13),
                SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ── Shared sub-widgets ───────────────────────────────────────────────────────

class _SkillsSection extends StatelessWidget {
  final double fontSize;

  const _SkillsSection({this.fontSize = 16});

  static const _categories = [
    {'label': 'Backend', 'skills': 'Python, Django/FastAPI, Go'},
    {'label': 'Frontend', 'skills': 'React, TypeScript'},
    {'label': 'Cloud/Infra', 'skills': 'PostgreSQL, MySQL, Firebase, MongoDB, Docker, AWS/GCP'},
    {'label': 'AI/ML', 'skills': 'PyTorch, TensorFlow, XGBoost, NLP, RAG, LangChain'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _categories
          .map((cat) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: '${cat['label']}: ',
                        style: accentTextStyle(context, fontSize: fontSize)),
                    TextSpan(
                        text: cat['skills'],
                        style: primaryTextStyle(context, fontSize: fontSize)),
                  ]),
                ),
              ))
          .toList(),
    );
  }
}

class _EducationBlock extends StatelessWidget {
  final double fontSize;

  const _EducationBlock({this.fontSize = 16});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'Education: ',
                style: accentTextStyle(context, fontSize: fontSize)),
            TextSpan(
                text: 'Minerva University, BSc CS & Business (May 2026) — ~1.5% acceptance, 7-city global rotational program',
                style: primaryTextStyle(context, fontSize: fontSize)),
          ]),
        ),
        const SizedBox(height: 4),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'Awards: ',
                style: accentTextStyle(context, fontSize: fontSize)),
            TextSpan(
                text: 'Dev Challenge XII — 1st place (2000+ participants); INTARG 2020 Gold medal',
                style: primaryTextStyle(context, fontSize: fontSize)),
          ]),
        ),
      ],
    );
  }
}
