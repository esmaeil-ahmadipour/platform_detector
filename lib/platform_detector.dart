library platform_detector;

import 'package:flutter/foundation.dart';
import 'package:platform_detector/enums.dart';
import 'package:universal_html/html.dart';

class PlatformDetector {
  // create singleton object .
  static final PlatformDetector _platformDetector =
      new PlatformDetector._internal();

  PlatformDetector._internal() {
    init(); // calling init method just once .
  }

  static PlatformDetector get platform => _platformDetector;

  PlatformType? _type; // value sample : web , mobile , desktop .
  PlatformName? _name; // value sample : android , web_android , windows , etc .
  PlatformCompany?
      _company; // value sample : apple , google , microsoft , linux .

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

  detectPlatformsInsideWeb() {
    // by this (method) we sure inside the web and on which platform .

    final userAgent = window.navigator.userAgent.toString().toLowerCase();
    // detect platform  from userAgent & save other details
    if (userAgent.contains("iphone") || userAgent.contains("ipad")) {
      type = PlatformType.web;
      name = PlatformName.iOS;
      company = PlatformCompany.apple;
    }

    if (userAgent.contains("android")) {
      type = PlatformType.web;
      name = PlatformName.web_android;
      company = PlatformCompany.google;
    }

    if (userAgent.contains("macintosh")) {
      type = PlatformType.web;
      name = PlatformName.web_macOs;
      company = PlatformCompany.apple;
    }

    if (userAgent.contains("windows")) {
      type = PlatformType.web;
      name = PlatformName.web_windows;
      company = PlatformCompany.microsoft;
    }

    if (userAgent.contains("linux")) {
      type = PlatformType.web;
      name = PlatformName.web_linux;
      company = PlatformCompany.linux;
    }
  }

  detectPlatforms() {
    // by this (method) we can detect platform & save other details .
    switch (defaultTargetPlatform) {
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

  dynamic byCompany(
      {required defaultValue, ifApple, ifGoogle, ifLinux, ifMicrosoft}) {
    // by this (method) we can return some value for the platform company & save other details .
    switch (PlatformDetector.platform.company) {
      case PlatformCompany.apple:
        return ifApple ?? defaultValue;
      case PlatformCompany.google:
        return ifGoogle ?? defaultValue;
      case PlatformCompany.microsoft:
        return ifMicrosoft ?? defaultValue;
      default:
        return ifLinux ?? defaultValue;
    }
  }

  dynamic byName(
      {required defaultValue,
      ifAndroid,
      ifWebAndroid,
      ifIOS,
      ifWebIOS,
      ifMacOs,
      ifWebMacOs,
      ifWindows,
      ifWebWindows,
      ifLinux,
      ifWebLinux}) {
    // by this (method) we can return some value for the platform name .
    switch (PlatformDetector.platform.name) {
      case PlatformName.android:
        return ifAndroid ?? defaultValue;

      case PlatformName.web_android:
        return ifWebAndroid ?? defaultValue;

      case PlatformName.iOS:
        return ifIOS ?? defaultValue;

      case PlatformName.web_iOS:
        return ifWebIOS ?? defaultValue;

      case PlatformName.macOs:
        return ifMacOs ?? defaultValue;

      case PlatformName.web_macOs:
        return ifWebMacOs ?? defaultValue;

      case PlatformName.windows:
        return ifWindows ?? defaultValue;

      case PlatformName.web_windows:
        return ifWebWindows ?? defaultValue;

      case PlatformName.linux:
        return ifLinux ?? defaultValue;

      default:
        return ifWebLinux ?? defaultValue;
    }
  }

  dynamic byType({required defaultValue, ifWeb, ifDesktop, ifMobile}) {
    // by this (method) we can return some value for the platform type .
    switch (PlatformDetector.platform.type) {
      case PlatformType.web:
        return ifWeb ?? defaultValue;
      case PlatformType.desktop:
        return ifDesktop ?? defaultValue;
      default:
        return ifMobile ?? defaultValue;
    }
  }

  void init() {
    // by this (method ) we can detect platform is inside web or not.
    kIsWeb ? detectPlatformsInsideWeb() : detectPlatforms();
  }
}
