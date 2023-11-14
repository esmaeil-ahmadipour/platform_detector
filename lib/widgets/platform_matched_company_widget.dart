import 'package:flutter/material.dart';
import 'package:platform_detector/enums.dart';
import 'package:platform_detector/platform_detector.dart';

/// ## [PlatformDetectMatchedCompany] Widget Documentation:
///
/// The `PlatformDetectMatchedCompany` widget allows you to conditionally render different widgets based on a specific platform company.
///
/// ### Example1:
///
/// ```dart
/// PlatformDetectMatchedCompany(
///   match: YourMatchedWidget("This widget will be shown on a specific platform company."),
///   notMatch: YourNotMatchedWidget("This widget will be shown on companies other than the specified type."),
///   platformCompany: PlatformCompany.apple,
/// )
/// ```
///
/// ### Example2:
///
/// ```dart
/// PlatformDetectMatchedCompany(
///   match: YourMatchedWidget("This widget will be shown on a specific platform company."),
///   platformCompany: PlatformCompany.apple,
/// )
/// ```
///
/// ### Widget Overview:
///
/// - This widget is designed to conditionally render different widgets based on a specified platform company.
/// - It takes three parameters (`match`, `notMatch`, and `platformCompany`) representing the widgets to be displayed on match, not match, and the specified platform company.
///
/// ### Properties:
///
/// - [match] : The widget to be displayed when the platform company matches the specified company.
/// - [notMatch] : The widget to be displayed when the platform company does not match the specified company. If not provided, a `SizedBox` is used.
/// - [platformCompany] : The specific platform company to match against.
///
/// This widget simplifies the process of handling platform-specific UI by allowing you to show different widgets based on a specific platform company.
/// It's particularly useful when you want to provide a custom user experience for a particular platform company.
///
class PlatformDetectMatchedCompany extends StatelessWidget {
  const PlatformDetectMatchedCompany(
      {Key? key,
      required this.match,
      this.notMatch = const SizedBox(),
      required this.platformCompany})
      : super(key: key);

  final Widget match;
  final Widget? notMatch;
  final PlatformCompany platformCompany;

  @override
  Widget build(BuildContext context) {
    return PlatformDetector.platform.company == platformCompany
        ? match
        : notMatch!;
  }
}
