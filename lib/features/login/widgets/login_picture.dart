import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPicture extends StatelessWidget {
  const LoginPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 140.h,
        width: 140.w,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          border: Border.all(width: 0, color: Colors.white),

          color: const Color.fromARGB(255, 245, 240, 240),
        ),
        child: Icon(Icons.person_2, size: 70, color: Colors.blue),
      ),
    );
  }
}
