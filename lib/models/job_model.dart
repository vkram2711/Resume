import 'package:flutter/material.dart';

class JobLink {
  final String url;
  final IconData icon;
  final String tooltip;

  const JobLink({required this.url, required this.icon, required this.tooltip});
}

class JobModel {
  String? mainImage;
  String? secondaryImage;
  TextSpan title;
  String titleShort;
  String position;
  String timeInterval;
  List<String> description;
  List<String> skills;
  List<JobLink> links;

  JobModel(
      {this.mainImage,
      this.secondaryImage,
      required this.title,
      required this.titleShort,
      required this.position,
      required this.timeInterval,
      required this.description,
      required this.skills,
      this.links = const []});
}
