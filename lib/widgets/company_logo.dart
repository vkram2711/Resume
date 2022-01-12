import 'package:flutter/material.dart';

class CompanyLogo extends StatelessWidget {
  final String mainImage;
  final String? secondaryImage;

  const CompanyLogo(this.mainImage, {this.secondaryImage, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(mainImage);
  }
}
