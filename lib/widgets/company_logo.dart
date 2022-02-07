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
    bool isMainSvg = RegExp(r"\.svg").allMatches(mainImage).isNotEmpty;
    bool isSecondSvg = false;
    if (secondaryProvided) {
      isSecondSvg = RegExp(r"\.svg").allMatches(secondaryImage!).isNotEmpty;
    }
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Center(
            child: isMainSvg
                ? SvgPicture.asset(mainImage)
                : Image.asset(mainImage)),
        secondaryProvided
            ? isSecondSvg
                ? SvgPicture.asset(
                    secondaryImage!,
                    width: 50,
                    height: 50,
                  )
                : Image.asset(
                    secondaryImage!,
                    width: 50,
                    height: 50,
                  )
            : Container()
      ],
    );
  }
}
