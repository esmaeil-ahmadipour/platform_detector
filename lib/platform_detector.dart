library platform_detector;

import 'package:flutter/foundation.dart';
import 'package:platform_detector/enums.dart';
import 'package:platform_detector/platform_details.dart';
import 'package:universal_html/html.dart';

class PlatformDetector {
  PlatformDetector() {
    init();
  }

  PlatformDetails? _platformDetails;

  PlatformDetails get platformDetails => _platformDetails!;

  set platformDetails(PlatformDetails value) {
    _platformDetails = value;
  }

  PlatformDetails? detectPlatformsInsideWeb() {
    final userAgent = window.navigator.userAgent.toString().toLowerCase();
    if (userAgent.contains("iphone") || userAgent.contains("ipad"))
      return PlatformDetails.fromParameters(
          type: PlatformType.web,
          name: PlatformName.iOS,
          company: PlatformCompany.apple);

    if (userAgent.contains("android"))
      return PlatformDetails.fromParameters(
          type: PlatformType.web,
          name: PlatformName.web_android,
          company: PlatformCompany.google);

    if (userAgent.contains("macintosh"))
      return PlatformDetails.fromParameters(
          type: PlatformType.web,
          name: PlatformName.web_macOs,
          company: PlatformCompany.apple);

    if (userAgent.contains("windows"))
      return PlatformDetails.fromParameters(
          type: PlatformType.web,
          name: PlatformName.web_windows,
          company: PlatformCompany.microsoft);

    if (userAgent.contains("linux"))
      return PlatformDetails.fromParameters(
          type: PlatformType.web,
          name: PlatformName.web_linux,
          company: PlatformCompany.linux);
  }

  PlatformDetails detectPlatforms() {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        return PlatformDetails.fromParameters(
            type: PlatformType.mobile,
            name: PlatformName.iOS,
            company: PlatformCompany.apple);
      case TargetPlatform.android:
        return PlatformDetails.fromParameters(
            type: PlatformType.mobile,
            name: PlatformName.android,
            company: PlatformCompany.google);
      case TargetPlatform.macOS:
        return PlatformDetails.fromParameters(
            type: PlatformType.desktop,
            name: PlatformName.macOs,
            company: PlatformCompany.apple);
      case TargetPlatform.windows:
        return PlatformDetails.fromParameters(
            type: PlatformType.desktop,
            name: PlatformName.windows,
            company: PlatformCompany.google);
      default:
        return PlatformDetails.fromParameters(
            type: PlatformType.desktop,
            name: PlatformName.linux,
            company: PlatformCompany.linux);
    }
  }

  void init() => kIsWeb
      ? platformDetails = detectPlatformsInsideWeb()!
      : platformDetails = detectPlatforms();
}
