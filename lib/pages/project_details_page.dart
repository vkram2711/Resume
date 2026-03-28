import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
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
      setState(() {
        _markdownData = '# Error loading content';
      });
    }
  }

  void _handleLink(String href) {
    Uri uri = Uri.parse(href);
    // Resolve relative paths (e.g. assets/pdf/...) against the app's base URL
    if (!uri.hasScheme) {
      uri = Uri.base.resolve(href);
    }
    launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Widget _buildImage(Uri uri) {
    final path = uri.path;
    Widget image;

    if ((uri.scheme.isEmpty || uri.scheme == 'asset') &&
        path.startsWith('assets/')) {
      image = Image.asset(
        Uri.decodeComponent(path),
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) =>
            const Icon(Icons.broken_image, color: Colors.grey, size: 48),
      );
    } else if (uri.scheme == 'http' || uri.scheme == 'https') {
      image = Image.network(
        uri.toString(),
        fit: BoxFit.contain,
        loadingBuilder: (_, child, progress) => progress == null
            ? child
            : const Padding(
                padding: EdgeInsets.all(24),
                child: Center(child: CircularProgressIndicator()),
              ),
        errorBuilder: (_, __, ___) =>
            const Icon(Icons.broken_image, color: Colors.grey, size: 48),
      );
    } else {
      return const Icon(Icons.broken_image, color: Colors.grey, size: 48);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 420),
          child: image,
        ),
      ),
    );
  }

  MarkdownStyleSheet _buildStyleSheet(BuildContext context, Color accentColor) {
    return MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
      // --- Paragraphs ---
      p: const TextStyle(
        fontSize: 16,
        height: 1.75,
        color: Color(0xFFBDBDBD),
        fontFamily: 'ProximaNova',
      ),

      // --- Headings ---
      h1: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: accentColor,
        fontFamily: 'ProximaNova',
        height: 1.4,
      ),
      h2: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        fontFamily: 'ProximaNova',
        height: 1.4,
      ),
      h3: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: accentColor,
        fontFamily: 'ProximaNova',
        height: 1.4,
      ),
      h4: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        fontFamily: 'ProximaNova',
      ),
      h5: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Colors.grey[300],
        fontFamily: 'ProximaNova',
      ),
      h6: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.grey[400],
        fontFamily: 'ProximaNova',
      ),

      // --- Inline ---
      a: TextStyle(
        color: accentColor,
        decoration: TextDecoration.underline,
        fontFamily: 'ProximaNova',
      ),
      strong: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'ProximaNova',
      ),
      em: const TextStyle(
        color: Color(0xFFE0E0E0),
        fontStyle: FontStyle.italic,
        fontFamily: 'ProximaNova',
      ),

      // --- Code ---
      code: TextStyle(
        fontFamily: 'monospace',
        fontSize: 14,
        color: Colors.yellow[200],
        backgroundColor: const Color(0xFF1C1C1C),
      ),
      codeblockDecoration: BoxDecoration(
        color: const Color(0xFF1C1C1C),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFF2E2E2E), width: 1),
      ),
      codeblockPadding: const EdgeInsets.all(16),

      // --- Blockquote ---
      blockquoteDecoration: BoxDecoration(
        color: const Color(0xFF0F0F0F),
        border: Border(left: BorderSide(color: accentColor, width: 4)),
      ),
      blockquotePadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      blockquote: const TextStyle(
        color: Color(0xFFE0E0E0),
        fontStyle: FontStyle.italic,
        fontSize: 16,
        height: 1.65,
        fontFamily: 'ProximaNova',
      ),

      // --- Horizontal rule ---
      horizontalRuleDecoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(color: Color(0xFF2E2E2E), width: 1)),
      ),

      // --- Lists ---
      listBullet: TextStyle(
        color: accentColor,
        fontSize: 16,
        fontFamily: 'ProximaNova',
      ),
      listIndent: 24,

      // --- Spacing ---
      blockSpacing: 16,
    );
  }

  @override
  Widget build(BuildContext context) {
    final accentColor = Colors.yellow[600]!;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Hero(
          tag: 'work_card_${widget.project}',
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Container(
                width: size.width * 0.9,
                height: size.height,
                decoration: widget.decoration.copyWith(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- Header ---
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 12, 16, 0),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back, color: accentColor),
                            onPressed: () => Navigator.pop(context),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              widget.project,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(color: accentColor),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(thickness: 1.0, color: accentColor),

                    // --- Markdown content ---
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 20),
                        child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 800),
                            child: MarkdownBody(
                              data: _markdownData,
                              selectable: true,
                              onTapLink: (text, href, title) {
                                if (href != null) _handleLink(href);
                              },
                              imageBuilder: (uri, title, alt) =>
                                  _buildImage(uri),
                              styleSheet:
                                  _buildStyleSheet(context, accentColor),
                            ),
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
