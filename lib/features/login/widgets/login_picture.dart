import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/gen/locale-keys.g.dart';

class LoginPicture extends StatefulWidget {
  final Function(String) onImageSelected;

  const LoginPicture({super.key, required this.onImageSelected});

  @override
  State<LoginPicture> createState() => _LoginPictureState();
}

class _LoginPictureState extends State<LoginPicture> {
  final picker = ImagePicker();
  XFile? photo;

  void pickImageFromCamera() async {
    photo = await picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      widget.onImageSelected(photo!.path);
    }

    setState(() {});
  }

  void pickImageFromGallery() async {
    photo = await picker.pickImage(source: ImageSource.gallery);

    if (photo != null) {
      widget.onImageSelected(photo!.path);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                top: 40.h,
                left: 25.w,
                right: 25.w,
                bottom: 40.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomButton(
                    text: LocaleKeys.Bottom_Sheet_camera.tr(),
                    onTap: () {
                      Navigator.pop(context);
                      pickImageFromCamera();
                    },
                  ),
                  40.verticalSpace,
                  CustomButton(
                    text: LocaleKeys.Bottom_Sheet_gallery.tr(),
                    onTap: () {
                      Navigator.pop(context);
                      pickImageFromGallery();
                    },
                  ),
                ],
              ),
            ),
          );
        },
        child: CircleAvatar(
          radius: 70.r,
          backgroundColor: const Color.fromARGB(255, 245, 240, 240),
          backgroundImage: photo != null
              ? Image.file(File(photo!.path)).image
              : null,
          child: photo == null
              ? Icon(Icons.person_2, size: 70, color: Colors.blue)
              : null,
        ),
      ),
    );
  }
}
