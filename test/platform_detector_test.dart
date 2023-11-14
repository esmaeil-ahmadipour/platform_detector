import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:platform_detector/enums.dart';
import 'package:platform_detector/platform_detector.dart';

void main() {
  group('Tests different platforms on NonWeb', () {
    test('Test iOS/NonWeb platform', () {
      PlatformDetector detectedIOS =
          PlatformDetector.testableForNonWeb(platform: TargetPlatform.iOS);
      expect(detectedIOS.type, PlatformType.mobile);
      expect(detectedIOS.company, PlatformCompany.apple);
      expect(detectedIOS.name, PlatformName.iOS);
      expect(isIOS(detectedIOS), true);
      expect(isIOS(detectedIOS), true);
      expect(isIOSApp(detectedIOS), true);
    });

    test('Test android/NonWeb platform', () {
      PlatformDetector detectedAndroid =
          PlatformDetector.testableForNonWeb(platform: TargetPlatform.android);
      expect(detectedAndroid.type, PlatformType.mobile);
      expect(detectedAndroid.company, PlatformCompany.google);
      expect(detectedAndroid.name, PlatformName.android);
      expect(isAndroidOs(detectedAndroid), true);
      expect(isAndroidApp(detectedAndroid), true);
    });

    test('Test windows/NonWeb platform', () {
      PlatformDetector detectedWindows =
          PlatformDetector.testableForNonWeb(platform: TargetPlatform.windows);
      expect(detectedWindows.type, PlatformType.desktop);
      expect(detectedWindows.company, PlatformCompany.microsoft);
      expect(detectedWindows.name, PlatformName.windows);
      expect(isWindowsOs(detectedWindows), true);
      expect(isWindowsApp(detectedWindows), true);
    });

    test('Test linux/NonWeb platform', () {
      PlatformDetector detectedLinux =
          PlatformDetector.testableForNonWeb(platform: TargetPlatform.linux);
      expect(detectedLinux.type, PlatformType.desktop);
      expect(detectedLinux.company, PlatformCompany.linux);
      expect(detectedLinux.name, PlatformName.linux);
      expect(isLinuxOs(detectedLinux), true);
      expect(isLinuxApp(detectedLinux), true);
    });

    test('Test macOs/NonWeb platform', () {
      PlatformDetector detectedMacOs =
          PlatformDetector.testableForNonWeb(platform: TargetPlatform.macOS);
      expect(detectedMacOs.type, PlatformType.desktop);
      expect(detectedMacOs.company, PlatformCompany.apple);
      expect(detectedMacOs.name, PlatformName.macOs);
      expect(isMacOs(detectedMacOs), true);
      expect(isMacOsApp(detectedMacOs), true);
    });
  });

  group('Tests different platforms on Web', () {
    test('Test iphone platform on web', () {
      PlatformDetector detectedIOS = PlatformDetector.testableForWeb(
          userAgent: PlatformUserAgents.iphone.name);
      expect(detectedIOS.type, PlatformType.web);
      expect(detectedIOS.company, PlatformCompany.apple);
      expect(detectedIOS.name, PlatformName.web_iOS);
      expect(isIOS(detectedIOS), true);
      expect(isIOSWeb(detectedIOS), true);
    });

    test('Test ipad platform on web', () {
      PlatformDetector detectedIOS = PlatformDetector.testableForWeb(
          userAgent: PlatformUserAgents.ipad.name);
      expect(detectedIOS.type, PlatformType.web);
      expect(detectedIOS.company, PlatformCompany.apple);
      expect(detectedIOS.name, PlatformName.web_iOS);
      expect(isIOS(detectedIOS), true);
      expect(isIOSWeb(detectedIOS), true);
    });

    test('Test macOs platform on web', () {
      PlatformDetector detectedMacOs = PlatformDetector.testableForWeb(
          userAgent: PlatformUserAgents.macintosh.name);
      expect(detectedMacOs.type, PlatformType.web);
      expect(detectedMacOs.company, PlatformCompany.apple);
      expect(detectedMacOs.name, PlatformName.web_macOs);
      expect(isMacOs(detectedMacOs), true);
      expect(isMacOsWeb(detectedMacOs), true);
    });
    test('Test android platform on web', () {
      PlatformDetector detectedAndroid = PlatformDetector.testableForWeb(
          userAgent: PlatformUserAgents.android.name);
      expect(detectedAndroid.type, PlatformType.web);
      expect(detectedAndroid.company, PlatformCompany.google);
      expect(detectedAndroid.name, PlatformName.web_android);
      expect(isAndroidOs(detectedAndroid), true);
      expect(isAndroidWeb(detectedAndroid), true);
    });

    test('Test windows platform on web', () {
      PlatformDetector detectedWindows = PlatformDetector.testableForWeb(
          userAgent: PlatformUserAgents.windows.name);
      expect(detectedWindows.type, PlatformType.web);
      expect(detectedWindows.company, PlatformCompany.microsoft);
      expect(detectedWindows.name, PlatformName.web_windows);
      expect(isWindowsOs(detectedWindows), true);
      expect(isWindowsWeb(detectedWindows), true);
    });

    test('Test linux platform on web', () {
      PlatformDetector detectedLinux = PlatformDetector.testableForWeb(
          userAgent: PlatformUserAgents.linux.name);
      expect(detectedLinux.type, PlatformType.web);
      expect(detectedLinux.company, PlatformCompany.linux);
      expect(detectedLinux.name, PlatformName.web_linux);
      expect(isLinuxOs(detectedLinux), true);
      expect(isLinuxWeb(detectedLinux), true);
    });
  });

  group('Tests on different platform types (Running on NonWeb Platform)', () {
    test('Test for detect mobile platform (iOS Case)', () {
      PlatformDetector detectedIOS =
          PlatformDetector.testableForNonWeb(platform: TargetPlatform.iOS);
      expect(detectedIOS.type, PlatformType.mobile);
      expect(isMobile(detectedIOS), true);
    });
    test('Test for detect mobile platform (android Case)', () {
      PlatformDetector detectedAndroid =
          PlatformDetector.testableForNonWeb(platform: TargetPlatform.android);
      expect(detectedAndroid.type, PlatformType.mobile);
      expect(isMobile(detectedAndroid), true);
    });

    test('Test for detect desktop platform (windows Case)', () {
      PlatformDetector detectedWindows =
          PlatformDetector.testableForNonWeb(platform: TargetPlatform.windows);
      expect(detectedWindows.type, PlatformType.desktop);
      expect(isDesktop(detectedWindows), true);
    });
    test('Test for detect desktop platform (linux Case)', () {
      PlatformDetector detectedLinux =
          PlatformDetector.testableForNonWeb(platform: TargetPlatform.windows);
      expect(detectedLinux.type, PlatformType.desktop);
      expect(isDesktop(detectedLinux), true);
    });
  });

  group('Tests on different platform types (Running on Web Platform)', () {
    test('Test for detect web platform (ipad Case)', () {
      PlatformDetector detectedIOS = PlatformDetector.testableForWeb(
          userAgent: PlatformUserAgents.ipad.name);
      expect(detectedIOS.type, PlatformType.web);
      expect(isWeb(detectedIOS), true);
    });
    test('Test for detect web platform (iphone Case)', () {
      PlatformDetector detectedIOS = PlatformDetector.testableForWeb(
          userAgent: PlatformUserAgents.iphone.name);
      expect(detectedIOS.type, PlatformType.web);
      expect(isWeb(detectedIOS), true);
    });
    test('Test for detect web platform (android Case)', () {
      PlatformDetector detectedAndroid = PlatformDetector.testableForWeb(
          userAgent: PlatformUserAgents.android.name);
      expect(detectedAndroid.type, PlatformType.web);
      expect(isWeb(detectedAndroid), true);
    });
    test('Test for detect web platform (linux Case)', () {
      PlatformDetector detectedLinux = PlatformDetector.testableForWeb(
          userAgent: PlatformUserAgents.linux.name);
      expect(detectedLinux.type, PlatformType.web);
      expect(isWeb(detectedLinux), true);
    });
    test('Test for detect web platform (macintosh Case)', () {
      PlatformDetector detectedMacintosh = PlatformDetector.testableForWeb(
          userAgent: PlatformUserAgents.macintosh.name);
      expect(detectedMacintosh.type, PlatformType.web);
      expect(isWeb(detectedMacintosh), true);
    });
    test('Test for detect web platform (windows Case)', () {
      PlatformDetector detectedWindows = PlatformDetector.testableForWeb(
          userAgent: PlatformUserAgents.windows.name);
      expect(detectedWindows.type, PlatformType.web);
      expect(isWeb(detectedWindows), true);
    });
  });

  group('Tests on different platform companies', () {
    // Linux company
    test('Test for detect platform company (Linux case on Web)', () {
      PlatformDetector detectedLinux = PlatformDetector.testableForWeb(
          userAgent: PlatformUserAgents.linux.name);
      expect(detectedLinux.type, PlatformType.web);
      expect(isLinuxCommunity(detectedLinux), true);
    });
    test('Test for detect platform company (Linux case on NonWeb)', () {
      PlatformDetector detectedLinux =
          PlatformDetector.testableForNonWeb(platform: TargetPlatform.linux);
      expect(detectedLinux.type, PlatformType.desktop);
      expect(isLinuxCommunity(detectedLinux), true);
    });

    // Microsoft company
    test('Test for detect platform company (Microsoft case on Web)', () {
      PlatformDetector detectedWindows = PlatformDetector.testableForWeb(
          userAgent: PlatformUserAgents.windows.name);
      expect(detectedWindows.type, PlatformType.web);
      expect(isMicrosoft(detectedWindows), true);
    });
    test('Test for detect platform company (Microsoft case on NonWeb)', () {
      PlatformDetector detectedWindows =
          PlatformDetector.testableForNonWeb(platform: TargetPlatform.windows);
      expect(detectedWindows.type, PlatformType.desktop);
      expect(isMicrosoft(detectedWindows), true);
    });

    // Apple company
    test('Test for detect platform company (Apple case on Web)', () {
      PlatformDetector detectedMacOs = PlatformDetector.testableForWeb(
          userAgent: PlatformUserAgents.macintosh.name);
      expect(detectedMacOs.type, PlatformType.web);
      expect(isApple(detectedMacOs), true);
    });
    test('Test for detect platform company (Apple case on NonWeb)', () {
      PlatformDetector detectedMacOs =
          PlatformDetector.testableForNonWeb(platform: TargetPlatform.macOS);
      expect(detectedMacOs.type, PlatformType.desktop);
      expect(isApple(detectedMacOs), true);
    });
    test('Test for detect platform company (Apple case on Web)', () {
      PlatformDetector detectedIpad = PlatformDetector.testableForWeb(
          userAgent: PlatformUserAgents.ipad.name);
      expect(detectedIpad.type, PlatformType.web);
      expect(isApple(detectedIpad), true);
    });
    test('Test for detect platform company (Apple case on Web)', () {
      PlatformDetector detectedIphone = PlatformDetector.testableForWeb(
          userAgent: PlatformUserAgents.iphone.name);
      expect(detectedIphone.type, PlatformType.web);
      expect(isApple(detectedIphone), true);
    });
    test('Test for detect platform company (Apple case on NonWeb)', () {
      PlatformDetector detectedIOS =
          PlatformDetector.testableForNonWeb(platform: TargetPlatform.iOS);
      expect(detectedIOS.type, PlatformType.mobile);
      expect(isApple(detectedIOS), true);
    });

    // Google company
    test('Test for detect platform company (Apple case on NonWeb)', () {
      PlatformDetector detectedAndroid =
          PlatformDetector.testableForNonWeb(platform: TargetPlatform.android);
      expect(detectedAndroid.type, PlatformType.mobile);
      expect(isGoogle(detectedAndroid), true);
    });
    test('Test for detect platform company (Apple case on Web)', () {
      PlatformDetector detectedAndroid = PlatformDetector.testableForWeb(
          userAgent: PlatformUserAgents.android.name);
      expect(detectedAndroid.type, PlatformType.web);
      expect(isGoogle(detectedAndroid), true);
    });
  });

  group('Tests byName Method', () {
    test('Testing byName Method (ipad Case on Web)', () {
      PlatformDetector detector = PlatformDetector.testableForWeb(
          userAgent: PlatformUserAgents.ipad.name);
      expect(
          detector.byName<int>(
              defaultValue: 0,
              android: 1,
              iOS: 2,
              linux: 3,
              macOs: 4,
              webAndroid: 5,
              webIOS: 6,
              webLinux: 7,
              webMacOs: 8,
              webWindows: 9,
              windows: 10),
          6);
    });
    test('Testing byName Method (iphone Case on Web)', () {
      PlatformDetector detector = PlatformDetector.testableForWeb(
          userAgent: PlatformUserAgents.iphone.name);
      expect(
          detector.byName<int>(
              defaultValue: 0,
              android: 1,
              iOS: 2,
              linux: 3,
              macOs: 4,
              webAndroid: 5,
              webIOS: 6,
              webLinux: 7,
              webMacOs: 8,
              webWindows: 9,
              windows: 10),
          6);
    });
    test('Testing byName Method (macintosh Case on Web)', () {
      PlatformDetector detector = PlatformDetector.testableForWeb(
          userAgent: PlatformUserAgents.macintosh.name);
      expect(
          detector.byName<int>(
              defaultValue: 0,
              android: 1,
              iOS: 2,
              linux: 3,
              macOs: 4,
              webAndroid: 5,
              webIOS: 6,
              webLinux: 7,
              webMacOs: 8,
              webWindows: 9,
              windows: 10),
          8);
    });
    test('Testing byName Method (android Case on Web)', () {
      PlatformDetector detector = PlatformDetector.testableForWeb(
          userAgent: PlatformUserAgents.android.name);
      expect(
          detector.byName<int>(
              defaultValue: 0,
              android: 1,
              iOS: 2,
              linux: 3,
              macOs: 4,
              webAndroid: 5,
              webIOS: 6,
              webLinux: 7,
              webMacOs: 8,
              webWindows: 9,
              windows: 10),
          5);
    });
    test('Testing byName Method (linux Case on Web)', () {
      PlatformDetector detector = PlatformDetector.testableForWeb(
          userAgent: PlatformUserAgents.linux.name);
      expect(
          detector.byName<int>(
              defaultValue: 0,
              android: 1,
              iOS: 2,
              linux: 3,
              macOs: 4,
              webAndroid: 5,
              webIOS: 6,
              webLinux: 7,
              webMacOs: 8,
              webWindows: 9,
              windows: 10),
          7);
    });
    test('Testing byName Method (windows Case on Web)', () {
      PlatformDetector detector = PlatformDetector.testableForWeb(
          userAgent: PlatformUserAgents.windows.name);
      expect(
          detector.byName<int>(
              defaultValue: 0,
              android: 1,
              iOS: 2,
              linux: 3,
              macOs: 4,
              webAndroid: 5,
              webIOS: 6,
              webLinux: 7,
              webMacOs: 8,
              webWindows: 9,
              windows: 10),
          9);
    });
    test('Testing byName Method (defaultValue Case on Web)', () {
      PlatformDetector detector = PlatformDetector.testableForWeb(
          userAgent: PlatformUserAgents.windows.name);
      expect(
          detector.byName<int>(
              defaultValue: 0,
              android: 1,
              iOS: 2,
              linux: 3,
              macOs: 4,
              webAndroid: 5,
              webIOS: 6,
              webLinux: 7,
              webMacOs: 8,
              windows: 10),
          0);
    });

    test('Testing byName Method (iOS Case on NonWeb)', () {
      PlatformDetector detector =
          PlatformDetector.testableForNonWeb(platform: TargetPlatform.iOS);
      expect(
          detector.byName<int>(
              defaultValue: 0,
              android: 1,
              iOS: 2,
              linux: 3,
              macOs: 4,
              webAndroid: 5,
              webIOS: 6,
              webLinux: 7,
              webMacOs: 8,
              webWindows: 9,
              windows: 10),
          2);
    });
    test('Testing byName Method (macOS Case on NonWeb)', () {
      PlatformDetector detector =
          PlatformDetector.testableForNonWeb(platform: TargetPlatform.macOS);
      expect(
          detector.byName<int>(
              defaultValue: 0,
              android: 1,
              iOS: 2,
              linux: 3,
              macOs: 4,
              webAndroid: 5,
              webIOS: 6,
              webLinux: 7,
              webMacOs: 8,
              webWindows: 9,
              windows: 10),
          4);
    });
    test('Testing byName Method (android Case on NonWeb)', () {
      PlatformDetector detector =
          PlatformDetector.testableForNonWeb(platform: TargetPlatform.android);
      expect(
          detector.byName<int>(
              defaultValue: 0,
              android: 1,
              iOS: 2,
              linux: 3,
              macOs: 4,
              webAndroid: 5,
              webIOS: 6,
              webLinux: 7,
              webMacOs: 8,
              webWindows: 9,
              windows: 10),
          1);
    });
    test('Testing byName Method (linux Case on NonWeb)', () {
      PlatformDetector detector =
          PlatformDetector.testableForNonWeb(platform: TargetPlatform.linux);
      expect(
          detector.byName<int>(
              defaultValue: 0,
              android: 1,
              iOS: 2,
              linux: 3,
              macOs: 4,
              webAndroid: 5,
              webIOS: 6,
              webLinux: 7,
              webMacOs: 8,
              webWindows: 9,
              windows: 10),
          3);
    });
    test('Testing byName Method (windows Case on NonWeb)', () {
      PlatformDetector detector =
          PlatformDetector.testableForNonWeb(platform: TargetPlatform.windows);
      expect(
          detector.byName<int>(
              defaultValue: 0,
              android: 1,
              iOS: 2,
              linux: 3,
              macOs: 4,
              webAndroid: 5,
              webIOS: 6,
              webLinux: 7,
              webMacOs: 8,
              webWindows: 9,
              windows: 10),
          10);
    });
    test('Testing byName Method (defaultValue Case on NonWeb)', () {
      PlatformDetector detector =
          PlatformDetector.testableForNonWeb(platform: TargetPlatform.windows);
      expect(
          detector.byName<int>(
              defaultValue: 0,
              android: 1,
              iOS: 2,
              linux: 3,
              macOs: 4,
              webAndroid: 5,
              webIOS: 6,
              webLinux: 7,
              webMacOs: 8,
              webWindows: 9),
          0);
    });
  });

  group('Tests byType Method', () {
    test('Testing byType Method (ipad Case on Web)', () {
      PlatformDetector detector = PlatformDetector.testableForWeb(
          userAgent: PlatformUserAgents.ipad.name);
      expect(
          detector.byType<int>(defaultValue: 0, desktop: 1, mobile: 2, web: 3),
          3);
    });
    test('Testing byType Method (macOS Case on NonWeb)', () {
      PlatformDetector detector2 =
          PlatformDetector.testableForNonWeb(platform: TargetPlatform.macOS);
      expect(
          detector2.byType<int>(defaultValue: 0, desktop: 1, mobile: 2, web: 3),
          1);
    });
    test('Testing byType Method (android Case on NonWeb)', () {
      PlatformDetector detector =
          PlatformDetector.testableForNonWeb(platform: TargetPlatform.android);
      expect(
          detector.byType<int>(defaultValue: 0, desktop: 1, mobile: 2, web: 3),
          2);
    });
    test('Testing byType Method (windows Case on NonWeb)', () {
      PlatformDetector detector =
          PlatformDetector.testableForNonWeb(platform: TargetPlatform.android);
      expect(detector.byType<int>(defaultValue: 0, desktop: 1, web: 3), 0);
    });
  });

  group('Tests byCompany Method', () {
    test('Testing byCompany Method (apple Case on Web)', () {
      PlatformDetector detector = PlatformDetector.testableForWeb(
          userAgent: PlatformUserAgents.ipad.name);
      expect(
          detector.byCompany<int>(
              defaultValue: 0, apple: 1, linux: 2, google: 3, microsoft: 4),
         1);
    });
    test('Testing byCompany Method (linux Case on NonWeb)', () {
      PlatformDetector detector = PlatformDetector.testableForNonWeb(
          platform:TargetPlatform.linux);
      expect(
          detector.byCompany<int>(
              defaultValue: 0, apple: 1, linux: 2, google: 3, microsoft: 4),
          2);
    });
    test('Testing byCompany Method (google Case on NonWeb)', () {
      PlatformDetector detector = PlatformDetector.testableForNonWeb(
          platform:TargetPlatform.android);
      expect(
          detector.byCompany<int>(
              defaultValue: 0, apple: 1, linux: 2, google: 3, microsoft: 4),
          3);
    });
    test('Testing byCompany Method (microsoft Case on NonWeb)', () {
      PlatformDetector detector = PlatformDetector.testableForNonWeb(
          platform:TargetPlatform.windows);
      expect(
          detector.byCompany<int>(
              defaultValue: 0, apple: 1, linux: 2, google: 3, microsoft: 4),
          4);
    });
    test('Testing byCompany Method (defaultValue Case on NonWeb)', () {
      PlatformDetector detector = PlatformDetector.testableForNonWeb(
          platform:TargetPlatform.windows);
      expect(
          detector.byCompany<int>(
              defaultValue: 0, apple: 1, linux: 2, google: 3),
          0);
    });
  });
}
