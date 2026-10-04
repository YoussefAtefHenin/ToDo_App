import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final int? maxLines;
  final void Function()? onTap;

  const CustomTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.maxLines,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: onTap != null,
      onTap: onTap,
      maxLines: maxLines,
      controller: controller,
      onTapOutside: (value) {
        FocusScope.of(context).unfocus();
      },
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        hintText: hintText,
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
    );
  }
}
