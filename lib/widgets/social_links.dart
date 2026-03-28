import 'package:flutter/material.dart';
import 'package:resume/resources/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({Key? key}) : super(key: key);

  static const _links = [
    {'label': 'GitHub', 'url': 'https://github.com/vkram2711'},
    {'label': 'LinkedIn', 'url': 'https://linkedin.com/in/vlad-kramarenko'},
    {'label': 'Upwork', 'url': 'https://upwork.com/freelancers/~01fde4bc85457f3469'},
    {'label': 'Email', 'url': 'mailto:vkramarenko.at.work@gmail.com'},
    {'label': 'vkram.dev', 'url': 'https://vkram.dev'},
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 8,
      children: _links
          .map((link) => _SocialLink(label: link['label']!, url: link['url']!))
          .toList(),
    );
  }
}

class _SocialLink extends StatefulWidget {
  final String label;
  final String url;

  const _SocialLink({required this.label, required this.url});

  @override
  State<_SocialLink> createState() => _SocialLinkState();
}

class _SocialLinkState extends State<_SocialLink> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: () => launch(widget.url),
        child: Text(
          widget.label,
          style: accentTextStyle(context, fontSize: 18, underline: _hovering),
        ),
      ),
    );
  }
}
