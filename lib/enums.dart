/// ## [PlatformName] Enumeration Documentation:
///
/// The `PlatformName` enum represents the name of the platform, categorizing it into specific types.
///
/// ### Overview:
///
/// - This enumeration is used to identify the platform by its name.
/// - Each value of the enum represents a specific platform with its category, type, and company.
///
/// ### Values:
///
/// - [android] : Represents the Android platform, categorized as Android, with a mobile type and Google as the company.
/// - [web_android] : Represents the Android platform in a web context, categorized as Android, with a web type and Google as the company.
/// - [iOS] : Represents the iOS platform, categorized as iOS, with a mobile type and Apple as the company.
/// - [web_iOS] : Represents the iOS platform in a web context, categorized as iOS, with a web type and Apple as the company.
/// - [macOs] : Represents the macOS platform, categorized as macOS, with a desktop type and Apple as the company.
/// - [web_macOs] : Represents the macOS platform in a web context, categorized as macOS, with a web type and Apple as the company.
/// - [windows] : Represents the Windows platform, categorized as Windows, with a desktop type and Microsoft as the company.
/// - [web_windows] : Represents the Windows platform in a web context, categorized as Windows, with a web type and Microsoft as the company.
/// - [linux] : Represents the Linux platform, categorized as Linux, with a desktop type and Linux as the company.
/// - [web_linux] : Represents the Linux platform in a web context, categorized as Linux, with a web type and Linux as the company.
///
/// This enumeration is designed to simplify the identification and categorization of platforms, aiding in platform-specific logic and behavior.
///
enum PlatformName {
  android(
      PlatformCategory.android, PlatformType.mobile, PlatformCompany.google),
  web_android(
      PlatformCategory.android, PlatformType.web, PlatformCompany.google),
  iOS(PlatformCategory.iOS, PlatformType.mobile, PlatformCompany.apple),
  web_iOS(PlatformCategory.iOS, PlatformType.web, PlatformCompany.apple),
  macOs(PlatformCategory.macOs, PlatformType.desktop, PlatformCompany.apple),
  web_macOs(PlatformCategory.macOs, PlatformType.web, PlatformCompany.apple),
  windows(PlatformCategory.windows, PlatformType.desktop,
      PlatformCompany.microsoft),
  web_windows(
      PlatformCategory.windows, PlatformType.web, PlatformCompany.microsoft),
  linux(PlatformCategory.linux, PlatformType.desktop, PlatformCompany.linux),
  web_linux(PlatformCategory.linux, PlatformType.web, PlatformCompany.linux);

  const PlatformName(this.category, this.type, this.company);

  final PlatformCategory category;
  final PlatformCompany company;
  final PlatformType type;
}


/// ## [PlatformCategory] Enumeration Documentation:
///
/// The `PlatformCategory` enum represents the category of the platform, indicating its type of operating system.
///
/// ### Overview:
///
/// - This enumeration is used to categorize the platform into specific types of operating systems.
/// - Each value of the enum represents a distinct category, such as Android, macOS, iOS, Linux, or Windows.
///
/// ### Values:
///
/// - [android] : Represents the Android operating system category.
/// - [macOs] : Represents the macOS operating system category.
/// - [iOS] : Represents the iOS operating system category.
/// - [linux] : Represents the Linux operating system category.
/// - [windows] : Represents the Windows operating system category.
///
/// This enumeration simplifies the identification of the platform's operating system category, aiding in platform-specific logic and behavior.
///
enum PlatformCategory { android, macOs, iOS, linux, windows }


/// ## [PlatformType] Enumeration Documentation:
///
/// The `PlatformType` enum represents the type of platform, categorizing it as mobile, desktop, or web.
///
/// ### Overview:
///
/// - This enumeration is used to identify the general type of the platform, indicating whether it is mobile, desktop, or web-based.
/// - Each value of the enum represents a specific type: mobile, desktop, or web.
///
/// ### Values:
///
/// - [mobile] : Represents the mobile platform type, applicable when the application is running on mobile devices.
/// - [desktop] : Represents the desktop platform type, applicable when the application is running on desktop computers.
/// - [web] : Represents the web platform type, applicable when the application is running on web browsers.
///
/// This enumeration simplifies the identification of the platform's general type, facilitating platform-specific logic and behavior.
///
enum PlatformType {
  mobile, // usage: when the application is running on mobile devices.
  desktop, // usage: when the application is running on desktop computers.
  web // usage: when the application is running on web browsers.
}


/// ## [PlatformCompany] Enumeration Documentation:
///
/// The `PlatformCompany` enum represents the company associated with the platform, indicating the creator or provider of the operating system.
///
/// ### Overview:
///
/// - This enumeration is used to identify the company associated with the platform, such as Apple, Google, Linux, or Microsoft.
/// - Each value of the enum represents a specific company.
///
/// ### Values:
///
/// - [apple] : Represents the Apple company, applicable when the target platform is iOS or macOS.
/// - [google] : Represents the Google company, applicable when the target platform is Android.
/// - [linux] : Represents the Linux company, applicable when the target platform is Linux.
/// - [microsoft] : Represents the Microsoft company, applicable when the target platform is Windows.
///
/// This enumeration simplifies the identification of the platform's associated company, aiding in platform-specific logic and behavior.
///
enum PlatformCompany {
  apple, // usage: when the target platform is iOS or macOS.
  google, // usage: when the target platform is Android.
  linux, // usage: when the target platform is Linux.
  microsoft // usage: when the target platform is Windows.
}


/// ## [PlatformUserAgents] Enumeration Documentation:
///
/// The `PlatformUserAgents` enum represents user agent strings associated with specific platforms.
///
/// ### Overview:
///
/// - This enumeration is used to identify user agent strings that are commonly associated with specific platforms.
/// - Each value of the enum represents a specific user agent string.
///
/// ### Values:
///
/// - [ipad] : Represents the user agent string associated with the iPad.
/// - [iphone] : Represents the user agent string associated with the iPhone.
/// - [android] : Represents the user agent string associated with Android devices.
/// - [macintosh] : Represents the user agent string associated with macOS devices.
/// - [windows] : Represents the user agent string associated with Windows devices.
/// - [linux] : Represents the user agent string associated with Linux devices.
///
/// This enumeration simplifies the identification of user agent strings, aiding in platform-specific logic and behavior.
///
enum PlatformUserAgents { ipad, iphone, android, macintosh, windows, linux }
