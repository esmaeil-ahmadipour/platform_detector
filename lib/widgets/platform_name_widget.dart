import 'package:flutter/material.dart';
import 'package:platform_detector/enums.dart';
import 'package:platform_detector/platform_detector.dart';

class PlatformDetectByName extends StatelessWidget {
  // by this (StatelessWidget class) we can return any widget for each platform name separately .

  const PlatformDetectByName({
    Key? key,
    this.ifAndroid,
    this.ifWebAndroid,
    this.ifIOS,
    this.ifWebIOS,
    this.ifMacOs,
    this.ifWebMacOs,
    this.ifWindows,
    this.ifWebWindows,
    this.ifLinux,
    this.ifWebLinux,
  }) : super(key: key);
  final Widget? ifAndroid;
  final Widget? ifWebAndroid;
  final Widget? ifIOS;
  final Widget? ifWebIOS;
  final Widget? ifMacOs;
  final Widget? ifWebMacOs;
  final Widget? ifWindows;
  final Widget? ifWebWindows;
  final Widget? ifLinux;
  final Widget? ifWebLinux;

  @override
  Widget build(BuildContext context) {
    switch (PlatformDetector.platform.name) {
      case PlatformName.android:
        return ifAndroid ?? SizedBox();

      case PlatformName.web_android:
        return ifWebAndroid ?? SizedBox();

      case PlatformName.iOS:
        return ifIOS ?? SizedBox();

      case PlatformName.web_iOS:
        return ifWebIOS ?? SizedBox();

      case PlatformName.macOs:
        return ifMacOs ?? SizedBox();

      case PlatformName.web_macOs:
        return ifWebMacOs ?? SizedBox();

      case PlatformName.windows:
        return ifWindows ?? SizedBox();

      case PlatformName.web_windows:
        return ifWebWindows ?? SizedBox();

      case PlatformName.linux:
        return ifLinux ?? SizedBox();

      default:
        return ifWebLinux ?? SizedBox();
    }
  }
}
