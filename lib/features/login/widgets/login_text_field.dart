import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/gen/locale-keys.g.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.login_full_name.tr(),
          style: TextStyle(
            fontSize: 18.sp,
            // fontWeight: FontWeight.w500
          ),
        ),
        5.verticalSpace,
        TextFormField(
          onTapOutside: (value) {
            FocusScope.of(context).unfocus();
          },
          cursorColor: Colors.blue,

          decoration: InputDecoration(
            hintText: "Youssef Atef",
            hintStyle: TextStyle(fontSize: 20.sp),
            fillColor: const Color.fromARGB(255, 245, 240, 240),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
        ),
      ],
    );
  }
}
