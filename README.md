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
  <img src="https://github.com/user-attachments/assets/e9212fb4-747d-4ab8-a9b2-ca56ef001ee3" width="250"/>
  <img src="https://github.com/user-attachments/assets/ca01a2aa-81ca-4508-8270-2c2d8c77e69c" width="250"/>
  <img src="https://github.com/user-attachments/assets/ef0227ef-8e69-4129-9b06-50b73a6948ec" width="250"/>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/0ff7c414-4496-487f-8299-8cd2ca907956" width="250"/>
  <img src="https://github.com/user-attachments/assets/44fb48f6-d3da-4f0a-93e1-99c5d3fda1de" width="250"/>
</p>

### Home Screen and Add Task Screen

<p align="center">
  <img src="https://github.com/user-attachments/assets/ae20a162-e378-4e6b-a7a7-db6639d51ceb" width="250"/>
  <img src="https://github.com/user-attachments/assets/98748f5a-245a-4fde-a815-cccafae3e7f5" width="250"/>
  <img src="https://github.com/user-attachments/assets/880c6a15-5b8a-4902-9d42-210335530f72" width="250"/>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/d8896e48-a9f3-4411-b10d-5ff8472444dd" width="250"/>
  <img src="https://github.com/user-attachments/assets/908e148a-f993-4093-831c-80cf45c6a480" width="250"/>
  <img src="https://github.com/user-attachments/assets/51dbc80e-0da5-499a-80c2-e5fabe4e8162" width="250"/>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/831ef3ec-eca7-42c4-aa57-be3865884c92" width="250"/>
  <img src="https://github.com/user-attachments/assets/83ae8840-96e4-4bcc-bfb0-1a3f8713b64f" width="250"/>
  <img src="https://github.com/user-attachments/assets/1423cd13-1c61-4c7b-ba73-5cadaf917996" width="250"/>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/4b9ad749-7e55-498a-866a-79781fa9a60b" width="250"/>
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
