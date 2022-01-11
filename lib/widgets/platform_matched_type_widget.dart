import 'package:flutter/material.dart';
import 'package:platform_detector/enums.dart';
import 'package:platform_detector/platform_detector.dart';

class PlatformDetectMatchedType extends StatelessWidget {
  // by this (StatelessWidget class) we can return multiple widgets for a specific platform type.
  // (One for when it's matched with the platform and the other when not matched)

  const PlatformDetectMatchedType(
      {Key? key,
      required this.ifMatch,
      required this.ifNotMatch,
      required this.platformType})
      : super(key: key);
  final Widget ifMatch;
  final Widget ifNotMatch;
  final PlatformType platformType;

  @override
  Widget build(BuildContext context) {
    return PlatformDetector.platform.type == platformType
        ? ifMatch
        : ifNotMatch;
  }
}
