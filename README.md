# Platform Detector Library

Platform Detector  Package : With this package, you can identify your app is running on which platform.
(Includes identification running on the web, mobile device, desktop, mobile browser, desktop browser, etc.)

## Installation

### Add Dependency

To get started, add the `platform_detector` package to your `pubspec.yaml` file:

```yaml
dependencies:
  platform_detector: ^0.2.0
```

### Import the Library

Import the library in your Dart file:

```dart
import 'package:platform_detector/platform_detector.dart';
```

---

### Platform Information

Accessing platform information is straightforward. Use the following methods to retrieve details about the current platform:


```dart
final PlatformType currentPlatformType = PlatformDetector.platform.type;
final PlatformName currentPlatformName = PlatformDetector.platform.name;
final PlatformCompany currentPlatformCompany = PlatformDetector.platform.company;
``` 

---

### Detecting Platforms

Utilize the byCompany, byName, and byType methods for conditional checks based on platform characteristics:

```dart
// Example of using the `byCompany` method.
final valueForApple = PlatformDetector.platform.byCompany<String>(
  defaultValue: 'Default Value',
  apple: 'Value for Apple',
  google: 'Value for Google',
  microsoft: 'Value for Microsoft',
  linux: 'Value for Linux',
);
```

```dart
// Example of using the `byType` method.
final valueForWeb = PlatformDetector.platform.byType<String>(
  defaultValue: 'Default Value',
  web: 'Value for Web',
  desktop: 'Value for Desktop',
  mobile: 'Value for Mobile',
);
```

```dart
// Example of using the `byName` method.
final valueForAndroid = PlatformDetector.platform.byName<String>(
  defaultValue: 'Default Value',
  android: 'Value for Android',
  webAndroid: 'Value for Web Android',
  iOS: 'Value for iOS',
  webIOS: 'Value for Web iOS',
  macOs: 'Value for macOS',
  webMacOs: 'Value for Web macOS',
  windows: 'Value for Windows',
  webWindows: 'Value for Web Windows',
  linux: 'Value for Linux',
  webLinux: 'Value for Web Linux',
);
```
---

### Conditional Checks

Perform conditional checks for platform company, name, and type:

**Conditional checks based on platform companies.**

```dart
if (isGoogle()) {
  // Code specific to Google platform.
}

if (isApple()) {
  // Code specific to Apple platform.
}

if (isLinuxCommunity()) {
  // Code specific to Linux platform.
}

if (isMicrosoft()) {
  // Code specific to Microsoft platform.
}
```

---

**Conditional checks based on platform type.**

```dart
// Conditional checks based on platform type.
if (isWeb()) {
  // Code specific to Web platform.
}

if (isDesktop()) {
  // Code specific to Desktop platform (Windows/Linux/MacOs).
}

if (isMobile()) {
  // Code specific to Mobile platform (iOS/Android).
}
```

---

**Code specific to Android (web / apk / web and apk ).**

```dart
if (isAndroidOs()) {
  // Code specific to Android operating system (web and apk).
}

if (isAndroidApp()) {
  // Code specific to Android application (apk).
}

if (isAndroidWeb()) {
  // Code specific to Web on Android platform (web).
}

// Similar conditional checks can be performed for iOS, macOS, Windows, and Linux.
```

---

### Example Widget

Integrate the library with your widgets for platform-specific rendering:

```dart
// Example of using the `PlatformDetectByType` widget.
PlatformDetectByType(
  web: YourWebWidget(),
  mobile: YourMobileWidget(),
  desktop: YourDesktopWidget(),
);
```

```dart
PlatformDetectByName(
  android: YourAndroidWidget("This widget will be shown on Android."),
  webAndroid: YourWebAndroidWidget("This widget will be shown on Web for Android."),
  iOS: YourIOSWidget("This widget will be shown on iOS."),
  webIOS: YourWebIOSWidget("This widget will be shown on Web for iOS."),
  macOs: YourMacOsWidget("This widget will be shown on macOS."),
  webMacOs: YourWebMacOsWidget("This widget will be shown on Web for macOS."),
  windows: YourWindowsWidget("This widget will be shown on Windows."),
  webWindows: YourWebWindowsWidget("This widget will be shown on Web for Windows."),
  linux: YourLinuxWidget("This widget will be shown on Linux."),
  webLinux: YourWebLinuxWidget("This widget will be shown on Web for Linux."),
)
```

```dart
 PlatformDetectMatchedName(
   match: YourMatchedWidget("This widget will be shown on a specific platform name."),
   notMatch: YourNotMatchedWidget("This widget will be shown on platforms with names other than the specified name."),
   platformName: PlatformName.iOS,
 )
```

```dart
 PlatformDetectMatchedCompany(
   match: YourMatchedWidget("This widget will be shown on a specific platform company."),
   notMatch: YourNotMatchedWidget("This widget will be shown on companies other than the specified type."),
   platformCompany: PlatformCompany.apple,
 )
```

```dart
 PlatformDetectMatchedName(
   match: YourMatchedWidget("This widget will be shown on a specific platform name."),
   notMatch: YourNotMatchedWidget("This widget will be shown on platforms with names other than the specified name."),
   platformName: PlatformName.iOS,
 )
```

---

### Notes

The library is designed to provide a convenient way to access platform-related information in Flutter applications.
It supports conditional checks based on platform characteristics, enabling you to write platform-specific code.
Use the provided utility methods, such as byCompany, byName, and byType, to handle platform-specific logic.
The library uses the singleton pattern to ensure a single instance across the application.
Feel free to explore and integrate the Platform Detector library into your Flutter projects.
If you encounter any issues or have suggestions for improvement, please check the GitHub repository for the latest updates and contribute to the community.

