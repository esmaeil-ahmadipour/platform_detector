import 'package:flutter/material.dart';
import 'package:platform_detector/enums.dart';
import 'package:platform_detector/platform_detector.dart';

class PlatformDetectMatchedName extends StatelessWidget {
  // by this (StatelessWidget class) we can return multiple widgets for a specific platform name.
  // (One for when it's matched with the platform and the other when not matched)

  const PlatformDetectMatchedName(
      {Key? key,
      required this.ifMatch,
      required this.ifNotMatch,
      required this.platformName})
      : super(key: key);
  final Widget ifMatch;
  final Widget ifNotMatch;
  final PlatformName platformName;

  @override
  Widget build(BuildContext context) {
    return PlatformDetector.platform.name == platformName
        ? ifMatch
        : ifNotMatch;
  }
}
