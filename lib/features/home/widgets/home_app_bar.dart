import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/core/utils/app_constants.dart';
import 'package:todo_app/features/login/data/user_model.dart';
import 'package:todo_app/gen/locale-keys.g.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel? user = Hive.box<UserModel>(
      AppConstants.userBox,
    ).get(AppConstants.currentUser);
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.blueGrey,
          backgroundImage: Image.file(File(user?.image ?? "")).image,
        ),
        15.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.Home_App_Bar.tr(),
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
              5.verticalSpace,
              Text(
                user?.name ?? "",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
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
      ],
    );
  }
}
