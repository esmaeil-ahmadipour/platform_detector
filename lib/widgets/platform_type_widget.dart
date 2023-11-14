import 'package:flutter/material.dart';
import 'package:platform_detector/enums.dart';
import 'package:platform_detector/platform_detector.dart';

/// ## [PlatformDetectByType] Widget Documentation:
///
/// The `PlatformDetectByType` widget allows you to conditionally render different widgets based on the platform type.
///
/// ### Example1:
///
/// ```dart
/// PlatformDetectByType(
///   web: YourWebWidget("This is can run on Web on any platform ;)"),
///   mobile: YourMobileWidget("This is Mobile App like : android , iOS"),
///   desktop: YourDesktopWidget("This is Desktop App like : linux , windows , macOs"),
/// )
/// ```
///
/// ### Example2:
///
/// ```dart
/// PlatformDetectByType(
///   web: YourWebWidget("This is can run on Web on any platform ;)"),
/// )
/// ```
///
/// ### Widget Overview:
///
/// - This widget is designed to simplify the process of displaying different content for web, mobile, and desktop platforms.
/// - It takes three optional parameters (`web`, `mobile`, and `desktop`) representing the widgets to be displayed on each platform.
///
/// ### Properties:
///
/// - [web] : The widget to be displayed on the web platform. If not provided, a `SizedBox` is used.
/// - [mobile] : The widget to be displayed on mobile platforms. If not provided, a `SizedBox` is used.
/// - [desktop] : The widget to be displayed on desktop platforms. If not provided, a `SizedBox` is used.
///
/// This widget simplifies the process of handling platform-specific UI by allowing you to specify different widgets for each platform.
/// It's particularly useful when you want to provide a tailored user experience based on the user's device.
///
class PlatformDetectByType extends StatelessWidget {
  const PlatformDetectByType(
      {Key? key,
      this.web = const SizedBox(),
      this.mobile = const SizedBox(),
      this.desktop = const SizedBox()})
      : super(key: key);
  final Widget? web;
  final Widget? mobile;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    switch (PlatformDetector.platform.type) {
      case PlatformType.web:
        return web!;
      case PlatformType.desktop:
        return desktop!;
      default:
        return mobile!;
    }
  }
}
