import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/core/utils/app_constants.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/features/home/home_screen.dart';
import 'package:todo_app/features/login/data/user_model.dart';
import 'package:todo_app/features/login/widgets/login_desc.dart';
import 'package:todo_app/features/login/widgets/login_picture.dart';
import 'package:todo_app/core/widgets/custom_text_field.dart';
import 'package:todo_app/gen/locale-keys.g.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController nameController = TextEditingController();

  String photoPath = "";

  void saveUserData(UserModel user) {
    Hive.box<UserModel>(AppConstants.userBox)
        .put(AppConstants.currentUser, user)
        .then((value) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        })
        .catchError((error) {
          print(error);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                25.verticalSpace,
                IconButton(
                  onPressed: () {
                    if (context.locale.languageCode == 'en') {
                      context.setLocale(const Locale('ar'));
                    } else {
                      context.setLocale(const Locale('en'));
                    }
                  },
                  icon: const Icon(Icons.language),
                ),
                100.verticalSpace,

                LoginPicture(
                  onImageSelected: (path) {
                    photoPath = path;
                  },
                ),

                20.verticalSpace,
                LoginDesc(),
                30.verticalSpace,
                Text(
                  LocaleKeys.login_full_name.tr(),
                  style: TextStyle(fontSize: 18.sp),
                ),
                5.verticalSpace,

                CustomTextField(
                  controller: nameController,
                  hintText: LocaleKeys.login_hint_text.tr(),
                ),

                100.verticalSpace,

                CustomButton(
                  text: LocaleKeys.login_text_button.tr(),
                  onTap: () {
                    if (photoPath.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            LocaleKeys.Error.tr(),
                            style: TextStyle(fontSize: 30.sp),
                          ),
                          content: Text(
                            LocaleKeys.Photo_Is_Required.tr(),
                            style: TextStyle(fontSize: 20.sp),
                          ),
                        ),
                      );
                      return;
                    }
                    if (nameController.text.trim().isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            LocaleKeys.Error.tr(),
                            style: TextStyle(fontSize: 30.sp),
                          ),
                          content: Text(
                            LocaleKeys.Name_Is_Required.tr(),
                            style: TextStyle(fontSize: 20.sp),
                          ),
                        ),
                      );
                      return;
                    }

                    saveUserData(
                      UserModel(name: nameController.text, image: photoPath),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



// dart run easy_localization:generate --source-dir ./assets/translations -f keys -o locale-keys.g.dart -O lib/gen