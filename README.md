# Todo App

A Flutter Todo application with a clean and simple user interface.

## Current Features

* Lottie Splash Screen
* Login Screen
* Name validation
* Image Picker
* Responsive UI
* Localization using `easy_localization`

## Screenshots

### Lottie Splash Screen

<p align="center">
  <img src="https://github.com/user-attachments/assets/f5d176d4-2d2e-49d3-b164-284fd514274d" width="250"/>
  <img src="https://github.com/user-attachments/assets/4be32ac5-aa52-4e26-9998-9aca0ba29d02" width="250"/>
</p>

### Login Screen

<p align="center">
  <img src="https://github.com/user-attachments/assets/5da01a7d-2d66-4ae6-bdfc-1d1e3604d119" width="250"/>
  <img src="https://github.com/user-attachments/assets/e3d53ec2-fac2-4888-93a4-52c7170228c6" width="250"/>
  <img src="https://github.com/user-attachments/assets/c76c20ef-d249-4c05-851a-4a8a16b025b5" width="250"/>
  <img src="https://github.com/user-attachments/assets/0c7ff4ca-02f5-4c6e-ba63-013570128a88" width="250"/>
  <img src="https://github.com/user-attachments/assets/5abaa772-03e0-48c4-b116-89867626bb09" width="250"/>
  <img src="https://github.com/user-attachments/assets/459e5e25-cf1b-4fed-92ba-78c5c10fbc1c" width="250"/>
</p>

## Localization

The project uses `easy_localization` for localization and translation management.

To generate the localization keys, run:

```bash
dart run easy_localization:generate --source-dir ./assets/translations -f keys -o locale-keys.g.dart -O lib/gen
```

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Technologies

* Flutter
* Dart
* Flutter ScreenUtil
* Lottie
* Image Picker
* Easy Localization
