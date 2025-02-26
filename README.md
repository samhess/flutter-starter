# Flutter Starter

This project is a starting point for a cross-platform Flutter application. It runs a [MaterialApp](https://api.flutter.dev/flutter/material/MaterialApp-class.html) with 5 screens/pages.

The responsive layout includes:
- Top [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html) (small)
- Left [Drawer](https://api.flutter.dev/flutter/material/Drawer-class.html) (small)
- Bottom [NavigationBar](https://api.flutter.dev/flutter/material/NavigationBar-class.html) (small)
- Extented Left [NavigationRail](https://api.flutter.dev/flutter/material/NavigationRail-class.html) (large)
- Body with sample content
  - Counter
  - Country (get random country data from an external API)
  - Sunflower
  - Brick Braker (simplified brick-breaker game)
  - Words (generate compunded words)

### Development
```sh
flutter pub outdated
flutter pub upgrade --major-versions
flutter devices
flutter run
# Chrome
flutter run -d chrome
# Windows
flutter run -d windows
# Android Emulator
flutter emulators --launch Medium_Phone_API_35
flutter run -d emulator-5554
```

### Resources

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
