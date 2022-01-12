import 'package:flutter/material.dart';

class JobModel {
  String mainImage;
  String? secondaryImage;
  TextSpan title;
  String titleShort;
  String position;
  TextSpan description;
  List<String> skills;

  JobModel(
      {required this.mainImage,
      this.secondaryImage,
      required this.title,
      required this.titleShort,
      required this.position,
      required this.description,
      required this.skills});
}
