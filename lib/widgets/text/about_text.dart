import 'package:flutter/material.dart';
import 'package:resume/resources/styles.dart';

class AboutText extends StatelessWidget {
  final double fontSize;

  const AboutText({Key? key, this.fontSize = 20}) : super(key: key);

  static const _paragraphs = [
    "I'm Vlad, an AI/Full-Stack Engineer with production experience shipping LLM pipelines, ML models, and full-stack products at startups. My focus is on AI and backend engineering — XGBoost models, RAG architectures, LLM integrations, and scalable web applications.",
    "Most recently, I was an ML/AI Engineer at PrivateJet.com, where I built an LLM-integrated XGBoost pricing model trained on 100k+ charter flight records (improving quote accuracy by ~20%) and evaluated 20 locally-hosted LLMs for sales automation. Before that, I worked as a Full-Stack / AI Engineer at Edgur (an early-stage edtech startup in Atlanta), and independently as a consultant on Upwork, completing 10+ backend, mobile, and AI projects across continents.",
    "I studied CS and Business at Minerva University — a selective program (acceptance rate ~1.5%) with a global rotational model across 7 cities, including SF, Seoul, Berlin, Buenos Aires, Taipei, and Tokyo.",
    "Currently based in Tokyo (valid zairyu card), graduating May 2026, and looking for an AI/full-stack engineering role at an English-friendly tech company in Tokyo.",
  ];

  @override
  Widget build(BuildContext context) {
    final style = primaryTextStyle(context, fontSize: fontSize);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _paragraphs
          .map((p) => Padding(
                padding: EdgeInsets.only(bottom: fontSize * 0.7),
                child: Text(p, style: style, softWrap: true),
              ))
          .toList(),
    );
  }
}
