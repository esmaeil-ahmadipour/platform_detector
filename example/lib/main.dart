import 'package:flutter/material.dart';
import 'package:platform_detector/enums.dart';
import 'package:platform_detector/platform_detector.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: PlatformDetector().platformDetails.platformName ==
                PlatformName.web_windows
            ? Colors
                .blue //  When app is web_application on windows , Set appBar to blue color .
            : PlatformDetector().platformDetails.platformName ==
                    PlatformName.android
                ? Colors
                    .green // When app is android , Set appBar to green color .
                : Colors.red, // Else ,  Set appBar to red color .
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            PlatformDetector().platformDetails.platformType == PlatformType.web
                ? "This is Web Application." // When platformType is web.
                : PlatformDetector().platformDetails.platformType ==
                        PlatformType.mobile
                    ? "This is Mobile Application." // When platformType is mobile device.
                    : "This is Desktop Application." // When platformType is desktop device.
            ),
      ),
    );
  }
}
