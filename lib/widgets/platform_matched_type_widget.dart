import 'package:flutter/material.dart';
import 'package:platform_detector/enums.dart';
import 'package:platform_detector/platform_detector.dart';

/// ## [PlatformDetectMatchedType] Widget Documentation:
///
/// The `PlatformDetectMatchedType` widget conditionally renders different widgets based on a specific platform type.
///
/// ### Example1:
///
/// ```dart
/// PlatformDetectMatchedType(
///   match: YourMatchedWidget("Displayed on the specified platform type."),
///   notMatch: YourNotMatchedWidget("Displayed on platforms other than the specified type."),
///   platformType: PlatformType.web,
/// )
/// ```
///
/// ### Example2:
///
/// ```dart
/// PlatformDetectMatchedType(
///   match: YourMatchedWidget("Displayed on the specified platform type."),
///   platformType: PlatformType.web,
/// )
/// ```
///
/// ### Widget Overview:
///
/// - This widget simplifies the process of displaying different widgets based on a specified platform type.
/// - It takes three parameters (`match`, `notMatch`, and `platformType`) representing the widgets to display on match, not match, and the specified platform type.
///
/// ### Properties:
///
/// - [match] : The widget displayed when the platform type matches the specified type.
/// - [notMatch] : The widget displayed when the platform type does not match the specified type. If not provided, a `SizedBox` is used.
/// - [platformType] : The specific platform type to match against.
///
/// This widget streamlines handling platform-specific UI, allowing you to show different widgets based on a specific platform type.
/// It's particularly useful for providing a custom user experience tailored to a particular platform.
///
class PlatformDetectMatchedType extends StatelessWidget {
  const PlatformDetectMatchedType(
      {Key? key,
      required this.match,
      this.notMatch = const SizedBox(),
      required this.platformType})
      : super(key: key);
  final Widget match;
  final Widget? notMatch;
  final PlatformType platformType;

  @override
  Widget build(BuildContext context) {
    return PlatformDetector.platform.type == platformType ? match : notMatch!;
  }
}
