import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/features/home/home_screen.dart';
import 'package:todo_app/features/login/widgets/login_desc.dart';
import 'package:todo_app/features/login/widgets/login_picture.dart';
import 'package:todo_app/features/login/widgets/login_text_field.dart';
import 'package:todo_app/gen/locale-keys.g.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                25.verticalSpace,
                IconButton(
                  onPressed: () {
                    if (context.locale.languageCode == 'en') {
                      context.setLocale(Locale('ar'));
                    } else {
                      context.setLocale(Locale('en'));
                    }
                  },
                  icon: Icon(Icons.language),
                ),
                100.verticalSpace,
                LoginPicture(),
                20.verticalSpace,
                LoginDesc(),
                30.verticalSpace,
                LoginTextField(),
                100.verticalSpace,
                CustomButton(
                  text: LocaleKeys.login_text_button.tr(),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
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