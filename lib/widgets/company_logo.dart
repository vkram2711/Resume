import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompanyLogo extends StatelessWidget {
  final String mainImage;
  final String? secondaryImage;

  const CompanyLogo(this.mainImage, {this.secondaryImage, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool secondaryProvided = secondaryImage != null;
    bool isMainSvg = RegExp(r"\.svg")
        .allMatches(mainImage)
        .isNotEmpty;
    bool isSecondSvg = false;

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        isMainSvg
            ? SvgPicture.asset(mainImage, width: 50, height: 50)
            : Image.asset(mainImage, width: 50, height: 50),
      ]
    );
  }
}