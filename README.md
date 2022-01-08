Language: [English]

# platform_detector

Platform Detector  Package : With this package, you can identify your app is running on which platform.
(Includes identification running on the web, mobile device, desktop, mobile browser, desktop browser, etc.)

## Get started

### Add dependency

```yaml
dependencies:
  platform_detector: ^0.0.2
```

### simple to use

```dart
import 'package:platform_detector/platform_detector.dart';

void getHttp() async {
  try {
    var response = await Dio().get('http://www.google.com');
    print(response);
  } catch (e) {
    print(e);
  }
}
```