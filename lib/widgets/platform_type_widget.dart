import 'package:flutter/material.dart';
import 'package:platform_detector/enums.dart';
import 'package:platform_detector/platform_detector.dart';

class PlatformDetectByType extends StatelessWidget {
  // by this (StatelessWidget class) we can return any widget for each platform type separately .

  const PlatformDetectByType(
      {Key? key, this.ifWeb, this.ifMobile, this.ifDesktop})
      : super(key: key);
  final Widget? ifWeb;
  final Widget? ifMobile;
  final Widget? ifDesktop;

  @override
  Widget build(BuildContext context) {
    switch (PlatformDetector.platform.type) {
      case PlatformType.web:
        return ifWeb ?? SizedBox();
      case PlatformType.desktop:
        return ifDesktop ?? SizedBox();
      default:
        return ifMobile ?? SizedBox();
    }
  }
}
