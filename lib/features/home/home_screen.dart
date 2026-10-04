import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/core/models/task_model.dart';
import 'package:todo_app/core/utils/app_constants.dart';
import 'package:todo_app/features/add_task/add_task_screen.dart';
import 'package:todo_app/features/home/widgets/task_item.dart';
import 'package:todo_app/features/login/data/user_model.dart';
import 'package:todo_app/gen/locale-keys.g.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<TaskModel> task = Hive.box<TaskModel>(
      AppConstants.taskBox,
    ).values.toList();

    final totalTasks = task.length;

    final doneTasks = task.where((element) => element.status == "Done").length;

    final pendingTasks = task
        .where((element) => element.status == "Pending")
        .length;

    UserModel? user = Hive.box<UserModel>(
      AppConstants.userBox,
    ).get(AppConstants.currentUser);

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
          setState(() {});
        },
        label: Row(
          children: [Text(LocaleKeys.Bottom_Add_Task.tr()), Icon(Icons.add)],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Color.fromARGB(255, 245, 240, 240),
                    backgroundImage: Image.file(File(user?.image ?? "")).image,
                  ),
                  15.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.Home_App_Bar.tr(),
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        5.verticalSpace,
                        Text(
                          user?.name ?? "",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
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
              ),

              15.verticalSpace,

              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "$totalTasks",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        5.verticalSpace,
                        Text(
                          "Tasks",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "$doneTasks",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        5.verticalSpace,
                        Text(
                          "Done",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "$pendingTasks",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        5.verticalSpace,
                        Text(
                          "Pending",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              20.verticalSpace,

              Text(
                LocaleKeys.Today_Tasks.tr(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              10.verticalSpace,

              task.isNotEmpty
                  ? Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) =>
                            TaskItem(taskModel: task[index]),
                        separatorBuilder: (context, index) => 10.verticalSpace,
                        itemCount: task.length,
                      ),
                    )
                  : Lottie.asset("assets/icons/empty_box.json"),

              40.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
