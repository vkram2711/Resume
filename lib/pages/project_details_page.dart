import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:resume/widgets/text/title_text.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailsPage extends StatefulWidget {
  final String project;
  final BoxDecoration decoration;

  const ProjectDetailsPage(
      {Key? key, required this.project, required this.decoration})
      : super(key: key);

  @override
  _ProjectDetailScreenState createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailsPage> {
  String _markdownData = '';

  @override
  void initState() {
    super.initState();
    _loadMarkdown();
  }

  Future<void> _loadMarkdown() async {
    final String markdownFileName =
        'assets/markdown/${widget.project.toLowerCase().replaceAll(' ', '_')}.md';
    try {
      final String data = await rootBundle.loadString(markdownFileName);
      setState(() {
        _markdownData = data;
      });
    } catch (e) {
      print('Error loading markdown: $e');
      setState(() {
        _markdownData = '# Error loading markdown';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final accentColor = Colors.yellow[600]!;
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'work_card_${widget.project}',
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Container(
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height,
                decoration: widget.decoration.copyWith(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),

                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBar(
                      title:Text('Project Details', style: Theme.of(context).textTheme.headlineLarge),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      leading: IconButton(
                        icon: Icon(Icons.arrow_back, color: accentColor),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                      color: Colors.yellow[600],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: MarkdownBody(
                          data: _markdownData,
                          onTapLink: (text, href, title) {
                            if (href != null) {
                              launchUrl(Uri.parse(href));
                            }
                          },
                          styleSheet:
                              MarkdownStyleSheet.fromTheme(Theme.of(context))
                                  .copyWith(
                            p: Theme.of(context).textTheme.bodyMedium,
                            h1: Theme.of(context).textTheme.headlineLarge,
                            h2: Theme.of(context).textTheme.headlineMedium,
                            h3: Theme.of(context).textTheme.headlineSmall,
                            h4: Theme.of(context).textTheme.titleLarge,
                            h5: Theme.of(context).textTheme.titleMedium,
                            h6: Theme.of(context).textTheme.titleSmall,
                            a: TextStyle(
                                color: accentColor,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
