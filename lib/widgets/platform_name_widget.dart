import 'package:flutter/material.dart';
import 'package:platform_detector/enums.dart';
import 'package:platform_detector/platform_detector.dart';

/// ## [PlatformDetectByName] Widget Documentation:
///
/// The `PlatformDetectByName` widget allows you to conditionally render different widgets based on the platform name.
///
/// ### Example1:
///
/// ```dart
/// PlatformDetectByName(
///   android: YourAndroidWidget("This widget will be shown on Android."),
///   webAndroid: YourWebAndroidWidget("This widget will be shown on Web for Android."),
///   iOS: YourIOSWidget("This widget will be shown on iOS."),
///   webIOS: YourWebIOSWidget("This widget will be shown on Web for iOS."),
///   macOs: YourMacOsWidget("This widget will be shown on macOS."),
///   webMacOs: YourWebMacOsWidget("This widget will be shown on Web for macOS."),
///   windows: YourWindowsWidget("This widget will be shown on Windows."),
///   webWindows: YourWebWindowsWidget("This widget will be shown on Web for Windows."),
///   linux: YourLinuxWidget("This widget will be shown on Linux."),
///   webLinux: YourWebLinuxWidget("This widget will be shown on Web for Linux."),
/// )
/// ```
///
/// ### Example2:
///
/// ```dart
/// PlatformDetectByName(
///   android: YourAndroidWidget("This widget will be shown on Android."),
/// )
/// ```
///
/// ### Widget Overview:
///
/// - This widget is designed to simplify the process of displaying different content based on the platform name.
/// - It takes several optional parameters, each representing the widget to be displayed on a specific platform name.
///
/// ### Properties:
///
/// - [android] : The widget to be displayed on Android. If not provided, a `SizedBox` is used.
/// - [webAndroid] : The widget to be displayed on Web for Android. If not provided, a `SizedBox` is used.
/// - [iOS] : The widget to be displayed on iOS. If not provided, a `SizedBox` is used.
/// - [webIOS] : The widget to be displayed on Web for iOS. If not provided, a `SizedBox` is used.
/// - [macOs] : The widget to be displayed on macOS. If not provided, a `SizedBox` is used.
/// - [webMacOs] : The widget to be displayed on Web for macOS. If not provided, a `SizedBox` is used.
/// - [windows] : The widget to be displayed on Windows. If not provided, a `SizedBox` is used.
/// - [webWindows] : The widget to be displayed on Web for Windows. If not provided, a `SizedBox` is used.
/// - [linux] : The widget to be displayed on Linux. If not provided, a `SizedBox` is used.
/// - [webLinux] : The widget to be displayed on Web for Linux. If not provided, a `SizedBox` is used.
///
/// This widget simplifies the process of handling platform-specific UI by allowing you to specify different widgets for each platform name.
/// It's particularly useful when you want to provide a tailored user experience based on the user's device and platform.
///
class PlatformDetectByName extends StatelessWidget {
  const PlatformDetectByName({
    Key? key,
    this.android = const SizedBox(),
    this.webAndroid = const SizedBox(),
    this.iOS = const SizedBox(),
    this.webIOS = const SizedBox(),
    this.macOs = const SizedBox(),
    this.webMacOs = const SizedBox(),
    this.windows = const SizedBox(),
    this.webWindows = const SizedBox(),
    this.linux = const SizedBox(),
    this.webLinux = const SizedBox(),
  }) : super(key: key);
  final Widget? android;
  final Widget? webAndroid;
  final Widget? iOS;
  final Widget? webIOS;
  final Widget? macOs;
  final Widget? webMacOs;
  final Widget? windows;
  final Widget? webWindows;
  final Widget? linux;
  final Widget? webLinux;

  @override
  Widget build(BuildContext context) {
    return switch (PlatformDetector.platform.name) {
      PlatformName.android => android!,
      PlatformName.web_android => webAndroid!,
      PlatformName.iOS => iOS!,
      PlatformName.web_iOS => webIOS!,
      PlatformName.macOs => macOs!,
      PlatformName.web_macOs => webMacOs!,
      PlatformName.windows => windows!,
      PlatformName.web_windows => webWindows!,
      PlatformName.linux => linux!,
      PlatformName.web_linux => webLinux!,
    };
  }
}
