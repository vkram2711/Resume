import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompanyLogo extends StatelessWidget {
  final String? mainImage;
  final String? secondaryImage;
  final String? title;

  const CompanyLogo(this.mainImage, {this.secondaryImage, this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accentColor = Theme.of(context).splashColor;

    if (mainImage == null || mainImage!.isEmpty) {
      final initials = _initials(title ?? '?');
      return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: accentColor, width: 1.5),
          borderRadius: BorderRadius.circular(6),
        ),
        alignment: Alignment.center,
        child: Text(
          initials,
          style: TextStyle(
            color: accentColor,
            fontSize: initials.length > 2 ? 13 : 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      );
    }

    bool isMainSvg = mainImage!.endsWith('.svg');
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        isMainSvg
            ? SvgPicture.asset(mainImage!, width: 50, height: 50)
            : Image.asset(mainImage!, width: 50, height: 50),
      ],
    );
  }

  String _initials(String title) {
    final words = title.trim().split(RegExp(r'\s+'));
    if (words.length >= 2) {
      return (words[0][0] + words[1][0]).toUpperCase();
    }
    return title.substring(0, title.length.clamp(0, 2)).toUpperCase();
  }
}
