// import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/gen/locale-keys.g.dart';

enum status { Pending, Done, inProgrees }

class StatusDropDowen extends StatelessWidget {
  final void Function(String?)? onChange;
  const StatusDropDowen({super.key, this.onChange});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      dropdownColor: Colors.white,
      decoration: InputDecoration(
        hintText: LocaleKeys.Choose_Status.tr(),
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
      items: status.values
          .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
          .toList(),
      onChanged: (v) {
        onChange!(v?.name);
      },
    );
  }
}
