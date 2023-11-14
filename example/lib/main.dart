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
        primarySwatch: PlatformDetector.platform.byName<MaterialColor>(
            // by this (method) set primarySwatch color for some platforms and other platform get color from defaultValue (blue color).
            defaultValue: Colors.blue,
            android: Colors.green,
            webWindows: Colors.deepPurple,
            iOS: Colors.red),
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
          PlatformDetector.platform.byType<String>(
            // by this (method) set custom text in appbar (according platform type) .
            defaultValue: "",
            web: "This is Web Application.",
            desktop: "This is Desktop Application.",
            mobile: "This is Mobile Application.",
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            PlatformDetectByType(
              // by this (widget) set custom widget according platform type .
              web: CustomWidget(
                icon: Icons.web,
                text: "Web",
              ),
              desktop: CustomWidget(
                icon: Icons.desktop_mac,
                text: "Desktop",
              ),
              mobile: CustomWidget(
                icon: Icons.phone_android,
                text: "Mobile",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
