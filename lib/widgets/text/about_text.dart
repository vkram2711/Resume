import 'package:flutter/material.dart';
import 'package:resume/resources/styles.dart';

class AboutText extends StatelessWidget {
  const AboutText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: primaryTextStyle(context), // Default style for the entire text
        children: [
          TextSpan(
            text:
            "I'm Vlad, an AI/full-stack engineer with 6+ years of experience building and shipping production systems across startups and freelance projects. My current focus is on AI and backend engineering — LLM pipelines, RAG architectures, and scalable web applications.",
          ),
          TextSpan(
            text:
            "Most recently, I was an ML/AI Engineer at PrivateJet.com, where I deployed locally hosted LLMs and built an XGBoost pricing model on 100k+ records. Before that, I worked as a full-stack engineer at Edgur (an early-stage edtech startup in Atlanta), and independently as a consultant on Upwork, completing 10+ AI, backend, and mobile projects for clients across continents.",
          ),
          TextSpan(
            text:
            "I studied CS and Business at Minerva University — a program that had me living and working across 7 cities on 4 continents, which means I'm comfortable in fast-moving, cross-cultural environments.",
          ),
          TextSpan(
            text:
            "I'm based in Tokyo and open to full-time roles in AI engineering, backend systems, or full-stack product development.",
          ),
        ],
      ),
    );
  }
}