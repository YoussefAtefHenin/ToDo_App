import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/gen/locale-keys.g.dart';

class LoginDesc extends StatelessWidget {
  const LoginDesc({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            LocaleKeys.login_title.tr(),
            style: TextStyle(fontSize: 27.sp, fontWeight: FontWeight.w600),
          ),
          1.verticalSpace,
          Text(
            LocaleKeys.login_subtitle.tr(),
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
