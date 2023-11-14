import 'package:flutter/material.dart';
import 'package:platform_detector/enums.dart';
import 'package:platform_detector/platform_detector.dart';

/// ## [PlatformDetectByCompany] Widget Documentation:
///
/// The `PlatformDetectByCompany` widget allows you to conditionally render different widgets based on the detected platform company.
///
/// ### Example1:
///
/// ```dart
/// PlatformDetectByCompany(
///   apple: YourAppleWidget("This widget will be shown on Apple devices."),
///   google: YourGoogleWidget("This widget will be shown on Google devices."),
///   microsoft: YourMicrosoftWidget("This widget will be shown on Microsoft devices."),
///   linux: YourLinuxWidget("This widget will be shown on Linux devices."),
/// )
/// ```
///
/// ### Example2:
///
/// ```dart
/// PlatformDetectByCompany(
///   apple: YourAppleWidget("This widget will be shown on Apple devices."),
/// )
/// ```
///
/// ### Widget Overview:
///
/// - This widget is designed to simplify the process of displaying different content based on the detected platform company.
/// - It takes four optional parameters (`apple`, `google`, `microsoft`, and `linux`) representing the widgets to be displayed for each platform company.
///
/// ### Properties:
///
/// - [apple] : The widget to be displayed on Apple devices. If not provided, a `SizedBox` is used.
/// - [google] : The widget to be displayed on Google devices. If not provided, a `SizedBox` is used.
/// - [microsoft] : The widget to be displayed on Microsoft devices. If not provided, a `SizedBox` is used.
/// - [linux] : The widget to be displayed on Linux devices. If not provided, a `SizedBox` is used.
///
/// This widget simplifies the process of handling platform-specific UI by allowing you to specify different widgets for each platform company.
/// It's particularly useful when you want to provide a tailored user experience based on the detected platform.
///
class PlatformDetectByCompany extends StatelessWidget {
  const PlatformDetectByCompany(
      {Key? key,
      this.apple = const SizedBox(),
      this.google = const SizedBox(),
      this.microsoft = const SizedBox(),
      this.linux = const SizedBox()})
      : super(key: key);
  final Widget? apple;
  final Widget? google;
  final Widget? linux;
  final Widget? microsoft;

  @override
  Widget build(BuildContext context) {
    return switch (PlatformDetector.platform.company) {
      PlatformCompany.apple => apple!,
      PlatformCompany.google => google!,
      PlatformCompany.microsoft => microsoft!,
      PlatformCompany.linux => linux!
    };
  }
}
