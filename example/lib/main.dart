import 'package:flutter/material.dart';
import 'package:platform_detector/platform_detector.dart';
import 'package:platform_detector/widgets/platform_type_widget.dart';
import 'package:platform_detector_example/custom_widget/custom_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: PlatformDetector.platform.byName(
            // by this (method) set primarySwatch color for some platforms and other platform get color from defaultValue (white color).
            defaultValue: Colors.white,
            ifAndroid: Colors.green,
            ifWebWindows: Colors.blue,
            ifIOS: Colors.black),
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
          PlatformDetector.platform.byType(
            // by this (method) set custom text in appbar (according platform type) .
            defaultValue: "",
            ifWeb: "This is Web Application.",
            ifDesktop: "This is Desktop Application.",
            ifMobile: "This is Mobile Application.",
          ),
        ),
      ),
      body: Center(
        child: PlatformDetectByType(
          // by this (widget) set custom widget according platform type .
          ifWeb: CustomWidget(
            icon: Icons.web,
            text: "Web",
          ),
          ifDesktop: CustomWidget(
            icon: Icons.desktop_mac,
            text: "Desktop",
          ),
          ifMobile: CustomWidget(
            icon: Icons.phone_android,
            text: "Mobile",
          ),
        ),
      ),
    );
  }
}
