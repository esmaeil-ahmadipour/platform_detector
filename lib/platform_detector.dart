library platform_detector;

import 'package:flutter/foundation.dart';
import 'package:platform_detector/enums.dart';
import 'package:universal_html/html.dart';

/// ## [PlatformDetector] Class Documentation:
///
/// The `PlatformDetector` class is a singleton utility that provides information about the current platform, including type, name, and company.
///
/// ### Example Usage:
///
/// ```dart
/// // Access the platform information.
/// PlatformDetector.platform.type; // Returns the current platform type.
/// PlatformDetector.platform.name; // Returns the current platform name.
/// PlatformDetector.platform.company; // Returns the current platform company.
///
/// // Example of using the `PlatformDetectByType` widget.
/// PlatformDetectByType(
///   web: YourWebWidget(),
///   mobile: YourMobileWidget(),
///   desktop: YourDesktopWidget(),
/// )
/// ```
///
/// ### Class Overview:
///
/// - This class is designed to provide a convenient way to access platform-related information.
/// - It includes methods for detecting the current platform type, name, and company.
/// - The class is implemented as a singleton to ensure a single instance across the application.
///
/// ### Properties:
///
/// - [type] : Returns the current platform type (`PlatformType` enum).
/// - [name] : Returns the current platform name (`PlatformName` enum).
/// - [company] : Returns the current platform company (`PlatformCompany` enum).
///
/// ### Methods:
///
/// - [detectPlatformsInsideWeb] : Detects the platform when running inside a web browser.
/// - [detectPlatforms] : Detects the platform when not running inside a web browser.
/// - [byCompany] : Returns a value based on the current platform company.
/// - [byName] : Returns a value based on the current platform name.
/// - [byType] : Returns a value based on the current platform type.
/// - [init] : Initializes the platform detection process.
///
/// ### Examples:
///
/// ```dart
/// // Accessing platform information.
/// final currentPlatformType = PlatformDetector.platform.type;
/// final currentPlatformName = PlatformDetector.platform.name;
/// final currentPlatformCompany = PlatformDetector.platform.company;
///
/// // Using the `byCompany` method.
/// final valueForApple = PlatformDetector.platform.byCompany(apple: "Value for Apple", defaultValue: "Default Value");
///
/// // Using the `byName` method.
/// final valueForAndroid = PlatformDetector.platform.byName(android: "Value for Android", defaultValue: "Default Value");
///
/// // Using the `byType` method.
/// final valueForWeb = PlatformDetector.platform.byType(web: "Value for Web", defaultValue: "Default Value");
/// ```
///
class PlatformDetector {
  static final PlatformDetector _platformDetector =
      new PlatformDetector._internal();

  ///  [PlatformDetector._internal] : Constructor Method Documentation:
  ///
  /// Private constructor for the `PlatformDetector` class.
  ///
  /// This constructor is invoked internally during the creation of the `PlatformDetector` singleton.
  /// It initializes the platform-related information by calling the `init` method.
  PlatformDetector._internal() {
    init();
  }

  @visibleForTesting
  PlatformDetector.testableForWeb({required String userAgent}) {
    detectPlatformsInsideWeb(userAgent);
  }

  @visibleForTesting
  PlatformDetector.testableForNonWeb({required TargetPlatform platform}) {
    detectPlatforms(platform);
  }

  static PlatformDetector get platform => _platformDetector;

  /// Represents the detected platform type (`PlatformType` enum).
  PlatformType? _type;

  /// Represents the detected platform name (`PlatformName` enum).
  PlatformName? _name;

  /// Represents the detected platform company (`PlatformCompany` enum).
  PlatformCompany? _company;

  PlatformCompany get company => _company!;

  set company(PlatformCompany value) {
    _company = value;
  }

  PlatformName get name => _name!;

  set name(PlatformName value) {
    _name = value;
  }

  PlatformType get type => _type!;

  set type(PlatformType value) {
    _type = value;
  }

  /// ### [detectPlatformsInsideWeb] Method Documentation :
  ///
  /// The `detectPlatformsInsideWeb` function is a utility for detecting the current web platform and populating platform-related information.
  ///
  /// ### Usage:
  /// ```dart
  /// PlatformType type;
  /// PlatformName name;
  /// PlatformCompany company;
  ///
  /// detectPlatformsInsideWeb();
  ///
  /// // Now 'type', 'name', and 'company' hold information about the current web platform.
  /// print('Platform Type: $type');
  /// print('Platform Name: $name');
  /// print('Platform Company: $company');
  /// ```
  ///
  /// ### Overview:
  /// - This utility function detects the current web platform and populates platform-related information based on the user agent.
  ///
  /// ### Detection Process:
  /// - It retrieves the user agent information using `window.navigator.userAgent`.
  /// - Based on the user agent, it sets the values for `type`, `name`, and `company`.
  ///
  /// ### Supported Web Platforms:
  /// - iOS: Detected when the user agent contains "iphone" or "ipad".
  /// - Android: Detected when the user agent contains "android".
  /// - macOS: Detected when the user agent contains "macintosh".
  /// - Windows: Detected when the user agent contains "windows".
  /// - Linux: Detected when the user agent contains "linux".
  ///
  /// ### Platform Type Enumeration:
  /// - [PlatformType.web] : Represents the web platform.
  ///
  /// ### Platform Name Enumeration (for Web):
  /// - [PlatformName.iOS] : iOS web platform.
  /// - [PlatformName.web_android] : Android web platform.
  /// - [PlatformName.web_macOs] : macOS web platform.
  /// - [PlatformName.web_windows] : Windows web platform.
  /// - [PlatformName.web_linux] : Linux web platform.
  ///
  /// ### Platform Company Enumeration (for Web):
  /// - [PlatformCompany.apple] : Apple Inc.
  /// - [PlatformCompany.google] : Google LLC.
  /// - [PlatformCompany.microsoft] : Microsoft Corporation.
  /// - [PlatformCompany.linux] : Linux Community.
  ///
  detectPlatformsInsideWeb(String userAgent) {
    if (userAgent.contains(PlatformUserAgents.iphone.name) ||
        userAgent.contains(PlatformUserAgents.ipad.name)) {
      type = PlatformType.web;
      name = PlatformName.web_iOS;
      company = PlatformCompany.apple;
    }

    if (userAgent.contains(PlatformUserAgents.android.name)) {
      type = PlatformType.web;
      name = PlatformName.web_android;
      company = PlatformCompany.google;
    }

    if (userAgent.contains(PlatformUserAgents.macintosh.name)) {
      type = PlatformType.web;
      name = PlatformName.web_macOs;
      company = PlatformCompany.apple;
    }

    if (userAgent.contains(PlatformUserAgents.windows.name)) {
      type = PlatformType.web;
      name = PlatformName.web_windows;
      company = PlatformCompany.microsoft;
    }

    if (userAgent.contains(PlatformUserAgents.linux.name)) {
      type = PlatformType.web;
      name = PlatformName.web_linux;
      company = PlatformCompany.linux;
    }
  }

  /// ### [detectPlatforms] Method Documentation :
  ///
  /// The `detectPlatforms` function , is called when the code is not running on the web and is a utility for detecting the current platform and populating platform-related information.
  ///
  /// ### Usage:
  /// ```dart
  /// PlatformType type;
  /// PlatformName name;
  /// PlatformCompany company;
  ///
  /// detectPlatforms();
  ///
  /// // Now 'type', 'name', and 'company' hold information about the current platform.
  /// print('Platform Type: $type');
  /// print('Platform Name: $name');
  /// print('Platform Company: $company');
  /// ```
  ///
  /// ### Overview:
  /// - This utility function detects the current platform (mobile, desktop) and populates platform-related information.
  ///
  /// ### Detection Process:
  /// - It uses `defaultTargetPlatform` to determine the current platform.
  /// - Based on the detected platform, it sets the values for `type`, `name`, and `company`.
  ///
  /// ### Supported Platforms:
  /// - Mobile Platforms: iOS, Android
  /// - Desktop Platforms: macOS, Windows, Linux
  ///
  /// ### Platform Type Enumeration:
  /// - [PlatformType.mobile] : Represents mobile platforms.
  /// - [PlatformType.desktop] : Represents desktop platforms.
  ///
  /// ### Platform Name Enumeration:
  /// - [PlatformName.iOS] : iOS platform.
  /// - [PlatformName.android] : Android platform.
  /// - [PlatformName.macOs] : macOS platform.
  /// - [PlatformName.windows] : Windows platform.
  /// - [PlatformName.linux] : Linux platform.
  ///
  /// ### Platform Company Enumeration:
  /// - [PlatformCompany.apple] : Apple Inc.
  /// - [PlatformCompany.google] : Google LLC.
  /// - [PlatformCompany.microsoft] : Microsoft Corporation.
  /// - [PlatformCompany.linux] : Linux Community.
  ///
  detectPlatforms(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.iOS:
        {
          type = PlatformType.mobile;
          name = PlatformName.iOS;
          company = PlatformCompany.apple;
        }
        break;
      case TargetPlatform.android:
        {
          type = PlatformType.mobile;
          name = PlatformName.android;
          company = PlatformCompany.google;
        }
        break;
      case TargetPlatform.macOS:
        {
          type = PlatformType.desktop;
          name = PlatformName.macOs;
          company = PlatformCompany.apple;
        }
        break;
      case TargetPlatform.windows:
        {
          type = PlatformType.desktop;
          name = PlatformName.windows;
          company = PlatformCompany.microsoft;
        }
        break;
      default:
        {
          type = PlatformType.desktop;
          name = PlatformName.linux;
          company = PlatformCompany.linux;
        }
    }
  }

  /// ### [byCompany] Method Documentation :
  ///
  /// Returns a value based on the current platform company.
  ///
  /// - [defaultValue] : The default value to return if the current platform company does not match any provided case.
  /// - [apple] : The value to return if the current platform company is Apple.
  /// - [google] : The value to return if the current platform company is Google.
  /// - [microsoft] : The value to return if the current platform company is Microsoft.
  /// - [linux] : The value to return if the current platform company is Linux.
  ///
  /// Example:
  ///
  /// ```dart
  /// var result = platform.byCompany<String>(
  ///   defaultValue: 'Unknown Company',
  ///   apple: 'Apple Inc.',
  ///   google: 'Google Inc.',
  ///   microsoft: 'Microsoft Corporation',
  ///   linux: 'Linux OS',
  /// );
  /// ```
  ///
  T byCompany<T>(
      {required T defaultValue, T? apple, T? google, T? linux, T? microsoft}) {
    return switch (this.company) {
      PlatformCompany.apple => apple ??= defaultValue,
      PlatformCompany.google => google ??= defaultValue,
      PlatformCompany.microsoft => microsoft ??= defaultValue,
      PlatformCompany.linux => linux ??= defaultValue,
    };
  }

  /// ### [byName] Method Documentation :
  ///
  /// Returns a value based on the current platform name.
  ///
  /// - [defaultValue] : The default value to return if the current platform name does not match any provided case.
  /// - [android] : The value to return if the current platform name is Android.
  /// - [webAndroid] : The value to return if the current platform name is Web Android.
  /// - [iOS] : The value to return if the current platform name is iOS.
  /// - [webIOS] : The value to return if the current platform name is Web iOS.
  /// - [macOs] : The value to return if the current platform name is macOS.
  /// - [webMacOs] : The value to return if the current platform name is Web macOS.
  /// - [windows] : The value to return if the current platform name is Windows.
  /// - [webWindows] : The value to return if the current platform name is Web Windows.
  /// - [linux] : The value to return if the current platform name is Linux.
  /// - [webLinux] : The value to return if the current platform name is Web Linux.
  ///
  /// Example:
  ///
  /// ```dart
  /// var result = platform.byName<String>(
  ///   defaultValue: 'Unknown Platform',
  ///   android: 'Android Platform',
  ///   webAndroid: 'Web on Android Platform',
  ///   iOS: 'iOS Platform',
  ///   webIOS: 'Web on iOS Platform',
  ///   macOs: 'macOS Platform',
  ///   webMacOs: 'Web on macOS Platform',
  ///   windows: 'Windows Platform',
  ///   webWindows: 'Web on Windows Platform',
  ///   linux: 'Linux Platform',
  ///   webLinux: 'Web on Linux Platform',
  /// );
  /// ```
  ///
  T byName<T>(
      {required T defaultValue,
      T? android,
      T? webAndroid,
      T? iOS,
      T? webIOS,
      T? macOs,
      T? webMacOs,
      T? windows,
      T? webWindows,
      T? linux,
      T? webLinux}) {
    return switch (this.name) {
      PlatformName.android => android ??= defaultValue,
      PlatformName.web_android => webAndroid ??= defaultValue,
      PlatformName.iOS => iOS ??= defaultValue,
      PlatformName.web_iOS => webIOS ??= defaultValue,
      PlatformName.macOs => macOs ??= defaultValue,
      PlatformName.web_macOs => webMacOs ??= defaultValue,
      PlatformName.windows => windows ??= defaultValue,
      PlatformName.web_windows => webWindows ??= defaultValue,
      PlatformName.linux => linux ??= defaultValue,
      PlatformName.web_linux => webLinux ??= defaultValue,
    };
  }

  /// ### [byType] Method Documentation :
  ///
  /// Returns a value based on the current platform type.
  ///
  /// - [defaultValue] : The default value to return if the current platform type does not match any provided case.
  /// - [web] : The value to return if the current platform type is web.
  /// - [desktop] : The value to return if the current platform type is desktop.
  /// - [mobile] : The value to return if the current platform type is mobile.
  ///
  /// Example:
  ///
  /// ```dart
  /// var result = platform.byType<String>(
  ///   defaultValue: 'Unknown Type',
  ///   web: 'Web Platform',
  ///   desktop: 'Desktop Platform',
  ///   mobile: 'Mobile Platform',
  /// );
  /// ```
  ///
  T byType<T>({required T defaultValue, T? web, T? desktop, T? mobile}) {
    return switch (this.type) {
      PlatformType.web => web ??= defaultValue,
      PlatformType.desktop => desktop ??= defaultValue,
      PlatformType.mobile => mobile ??= defaultValue,
    };
  }

  /// ### [init] Method Documentation :
  ///
  /// Initializes the platform-related information based on the current platform.
  /// [detectPlatformsInsideWeb] : The `detectPlatformsInsideWeb` function is a utility for detecting the current web platform and populating platform-related information.
  /// [detectPlatforms] : The `detectPlatforms` function , is called when the code is not running on the web and is a utility for detecting the current platform and populating platform-related information.
  void init() {
    if (kIsWeb) {
      final userAgent = window.navigator.userAgent.toString().toLowerCase();
      detectPlatformsInsideWeb(userAgent);
    } else {
      detectPlatforms(defaultTargetPlatform);
    }
  }
}

/// - [isGoogle] : `true` if the current platform's company is Google.
bool isGoogle([PlatformDetector? detector]) =>
    (detector?.company ?? PlatformDetector.platform.company) ==
    PlatformCompany.google;

/// - [isApple] : `true` if the current platform's company is Apple.
bool isApple([PlatformDetector? detector]) =>
    (detector?.company ?? PlatformDetector.platform.company) ==
    PlatformCompany.apple;

/// - [isLinuxCommunity] : `true` if the current platform's company is Linux.
bool isLinuxCommunity([PlatformDetector? detector]) =>
    (detector?.company ?? PlatformDetector.platform.company) ==
    PlatformCompany.linux;

/// - [isMicrosoft] : `true` if the current platform's company is Microsoft.
bool isMicrosoft([PlatformDetector? detector]) =>
    (detector?.company ?? PlatformDetector.platform.company) ==
    PlatformCompany.microsoft;

/// - [isWeb] : `true` if the current platform type is Web.
bool isWeb([PlatformDetector? detector]) =>
    (detector?.type ?? PlatformDetector.platform.type) == PlatformType.web;

/// - [isDesktop] : `true` if the current platform type is Desktop.
bool isDesktop([PlatformDetector? detector]) =>
    (detector?.type ?? PlatformDetector.platform.type) == PlatformType.desktop;

/// - [isMobile] : `true` if the current platform type is Mobile.
bool isMobile([PlatformDetector? detector]) =>
    (detector?.type ?? PlatformDetector.platform.type) == PlatformType.mobile;

/// - [isAndroidOs] : `true` if the current platform OS category is Android (It does not matter if it is a web or an application).
bool isAndroidOs([PlatformDetector? detector]) =>
    (detector?.name.category ?? PlatformDetector.platform.name.category) ==
    PlatformCategory.android;

/// - [isAndroidApp] : `true` if the current platform OS is Android and this is an Android Application.
bool isAndroidApp([PlatformDetector? detector]) =>
    (detector?.name ?? PlatformDetector.platform.name) == PlatformName.android;

/// - [isAndroidWeb] : `true` if the current platform is Web on Android.
bool isAndroidWeb([PlatformDetector? detector]) =>
    (detector?.name ?? PlatformDetector.platform.name) ==
    PlatformName.web_android;

/// - [isIOS] : `true` if the current platform OS category is iOS (It does not matter if it is a web or an application).
bool isIOS([PlatformDetector? detector]) =>
    (detector?.name.category ?? PlatformDetector.platform.name.category) ==
    PlatformCategory.iOS;

/// - [isIOSApp] : `true` if the current platform OS is iOS and this is an iOS Application.
bool isIOSApp([PlatformDetector? detector]) =>
    (detector?.name ?? PlatformDetector.platform.name) == PlatformName.iOS;

/// - [isIOSWeb] : `true` if the current platform is Web on iOS.
bool isIOSWeb([PlatformDetector? detector]) =>
    (detector?.name ?? PlatformDetector.platform.name) == PlatformName.web_iOS;

/// - [isMacOs] : `true` if the current platform OS category is MacOs (It does not matter if it is a web or an application).
bool isMacOs([PlatformDetector? detector]) =>
    (detector?.name.category ?? PlatformDetector.platform.name.category) ==
    PlatformCategory.macOs;

/// - [isMacOsApp] : `true` if the current platform OS is MacOs and this is an MacOs Application.
bool isMacOsApp([PlatformDetector? detector]) =>
    (detector?.name ?? PlatformDetector.platform.name) == PlatformName.macOs;

/// - [isMacOsWeb] : `true` if the current platform is Web on MacOs.
bool isMacOsWeb([PlatformDetector? detector]) =>
    (detector?.name ?? PlatformDetector.platform.name) ==
    PlatformName.web_macOs;

/// - [isWindowsOs] : `true` if the current platform OS category is Windows (It does not matter if it is a web or an application).
bool isWindowsOs([PlatformDetector? detector]) =>
    (detector?.name.category ?? PlatformDetector.platform.name.category) ==
    PlatformCategory.windows;

/// - [isWindowsApp] : `true` if the current platform OS is Windows and this is an Windows Application.
// bool isWindowsApp = PlatformDetector.platform.name == PlatformName.windows;
bool isWindowsApp([PlatformDetector? detector]) =>
    (detector?.name ?? PlatformDetector.platform.name) == PlatformName.windows;

/// - [isWindowsWeb] : `true` if the current platform is Web on Windows.
bool isWindowsWeb([PlatformDetector? detector]) =>
    (detector?.name ?? PlatformDetector.platform.name) ==
    PlatformName.web_windows;

/// - [isLinuxOs] : `true` if the current platform OS category is Linux (It does not matter if it is a web or an application).
bool isLinuxOs([PlatformDetector? detector]) =>
    (detector?.name.category ?? PlatformDetector.platform.name.category) ==
    PlatformCategory.linux;

/// - [isLinuxApp] : `true` if the current platform OS is Linux and this is an Linux Application.
bool isLinuxApp([PlatformDetector? detector]) =>
    (detector?.name ?? PlatformDetector.platform.name) == PlatformName.linux;

/// - [isLinuxWeb] : `true` if the current platform is Web on Linux.
bool isLinuxWeb([PlatformDetector? detector]) =>
    (detector?.name ?? PlatformDetector.platform.name) ==
    PlatformName.web_linux;
