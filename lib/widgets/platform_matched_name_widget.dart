import 'package:flutter/material.dart';
import 'package:platform_detector/enums.dart';
import 'package:platform_detector/platform_detector.dart';

/// ## [PlatformDetectMatchedName] Widget Documentation:
///
/// The `PlatformDetectMatchedName` widget allows you to conditionally render different widgets based on a specific platform name.
///
/// ### Example1:
///
/// ```dart
/// PlatformDetectMatchedName(
///   match: YourMatchedWidget("This widget will be shown on a specific platform name."),
///   notMatch: YourNotMatchedWidget("This widget will be shown on platforms with names other than the specified name."),
///   platformName: PlatformName.iOS,
/// )
/// ```
///
/// ### Example2:
///
/// ```dart
/// PlatformDetectMatchedName(
///   match: YourMatchedWidget("This widget will be shown on a specific platform name."),
///   platformName: PlatformName.iOS,
/// )
/// ```
///
/// ### Widget Overview:
///
/// - This widget is designed to conditionally render different widgets based on a specified platform name.
/// - It takes three parameters (`match`, `notMatch`, and `platformName`) representing the widgets to be displayed on match, not match, and the specified platform name.
///
/// ### Properties:
///
/// - [match] : The widget to be displayed when the platform name matches the specified name.
/// - [notMatch] : The widget to be displayed when the platform name does not match the specified name. If not provided, a `SizedBox` is used.
/// - [platformName] : The specific platform name to match against.
///
/// This widget simplifies the process of handling platform-specific UI by allowing you to show different widgets based on a specific platform name.
/// It's particularly useful when you want to provide a custom user experience for a particular platform.
///
class PlatformDetectMatchedName extends StatelessWidget {
  const PlatformDetectMatchedName(
      {Key? key,
      required this.match,
      this.notMatch = const SizedBox(),
      required this.platformName})
      : super(key: key);
  final Widget match;
  final Widget? notMatch;
  final PlatformName platformName;

  @override
  Widget build(BuildContext context) {
    return PlatformDetector.platform.name == platformName ? match : notMatch!;
  }
}
