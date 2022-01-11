import 'package:flutter/material.dart';
import 'package:platform_detector/enums.dart';
import 'package:platform_detector/platform_detector.dart';

class PlatformDetectMatchedCompany extends StatelessWidget {
  // by this (StatelessWidget class) we can return multiple widgets for a specific platform company.
  // (One for when it's matched with the platform and the other when not matched)

  const PlatformDetectMatchedCompany(
      {Key? key,
      required this.ifMatch,
      required this.ifNotMatch,
      required this.platformCompany})
      : super(key: key);

  final Widget ifMatch;
  final Widget ifNotMatch;
  final PlatformCompany platformCompany;

  @override
  Widget build(BuildContext context) {
    return PlatformDetector.platform.company == platformCompany
        ? ifMatch
        : ifNotMatch;
  }
}
