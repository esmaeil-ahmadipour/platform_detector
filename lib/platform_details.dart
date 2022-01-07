import 'package:platform_detector/enums.dart';

class PlatformDetails {
  late PlatformType platformType;
  late PlatformName  platformName;
  late PlatformCompany platformCompany;

  PlatformDetails({
    required this.platformType,
    required this.platformName,
   required this.platformCompany
  });

  PlatformDetails.fromParameters({required PlatformType type, required PlatformName name, required PlatformCompany company}) {
    platformType = type;
    platformName = name;
    platformCompany = company;
  }
}
