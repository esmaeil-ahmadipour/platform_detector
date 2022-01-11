import 'package:flutter/material.dart';
import 'package:platform_detector/enums.dart';
import 'package:platform_detector/platform_detector.dart';

class PlatformDetectByCompany extends StatelessWidget {
  // by this (StatelessWidget class) we can return any widget for each platform company separately .

  const PlatformDetectByCompany(
      {Key? key, this.ifApple, this.ifGoogle, this.ifMicrosoft, this.ifLinux})
      : super(key: key);
  final Widget? ifApple;
  final Widget? ifGoogle;
  final Widget? ifLinux;
  final Widget? ifMicrosoft;

  @override
  Widget build(BuildContext context) {
    switch (PlatformDetector.platform.company) {
      case PlatformCompany.apple:
        return ifApple ?? SizedBox();
      case PlatformCompany.google:
        return ifGoogle ?? SizedBox();
      case PlatformCompany.microsoft:
        return ifMicrosoft ?? SizedBox();
      default:
        return ifLinux ?? SizedBox();
    }
  }
}
