import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/core/models/task_model.dart';
import 'package:todo_app/core/utils/app_constants.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/core/widgets/custom_text_field.dart';
import 'package:todo_app/features/add_task/widgets/status_drop_dowen.dart';
import 'package:todo_app/features/login/data/user_model.dart';
import 'package:todo_app/gen/locale-keys.g.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  List<Color> taskColors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.red,
    Colors.greenAccent,
    Colors.black,
  ];

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  var statusController = TextEditingController();
  int? selectedIndexColor;

  void saveTask(TaskModel task) {
    Hive.box<TaskModel>(AppConstants.taskBox)
        .add(task)
        .then((v) {
          Navigator.pop(context);
        })
        .catchError((error) {
          print(error.toString());
        });
  }

  @override
  void disPose() {
    titleController.dispose();
    descriptionController.dispose();
    dateController.dispose();
    timeController.dispose();
    statusController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.App_Bar_Add_Task.tr()),
        backgroundColor: Colors.white,
        centerTitle: false,
        actions: [
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LocaleKeys.Title.tr(), style: TextStyle(fontSize: 18.sp)),
              5.verticalSpace,
              CustomTextField(
                controller: titleController,
                hintText: LocaleKeys.Task_Title.tr(),
              ),
              15.verticalSpace,
              Text(
                LocaleKeys.Description.tr(),
                style: TextStyle(fontSize: 18.sp),
              ),
              5.verticalSpace,
              CustomTextField(
                controller: descriptionController,
                hintText: LocaleKeys.Task_Description.tr(),
                maxLines: 5,
              ),
              15.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.Date.tr(),
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        5.verticalSpace,
                        CustomTextField(
                          controller: dateController,
                          hintText: LocaleKeys.Date.tr(),
                          onTap: () {
                            showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2028),
                            ).then(
                              (value) => dateController.text = DateFormat.yMEd()
                                  .format(value ?? DateTime.now()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.Time.tr(),
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        5.verticalSpace,
                        CustomTextField(
                          controller: timeController,
                          hintText: LocaleKeys.Time.tr(),
                          onTap: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then(
                              (value) => timeController.text =
                                  value?.format(context) ?? "",
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              15.verticalSpace,
              Text(LocaleKeys.Status.tr(), style: TextStyle(fontSize: 18.sp)),
              5.verticalSpace,
              StatusDropDowen(
                onChange: (value) {
                  statusController.text = value ?? "";
                },
              ),
              15.verticalSpace,
              Text(
                LocaleKeys.Choose_Color.tr(),
                style: TextStyle(fontSize: 18.sp),
              ),
              5.verticalSpace,

              SizedBox(
                height: 50.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndexColor = index;
                      });
                    },
                    child: CircleAvatar(
                      radius: 32.r,
                      backgroundColor: taskColors[index],
                      child: index == selectedIndexColor
                          ? Icon(Icons.check, color: Colors.white, size: 30.sp)
                          : null,
                    ),
                  ),
                  separatorBuilder: (context, index) => 0.horizontalSpace,
                  itemCount: taskColors.length,
                ),
              ),
              20.verticalSpace,
              CustomButton(
                text: LocaleKeys.Save_Task.tr(),
                onTap: () {
                  saveTask(
                    TaskModel(
                      title: titleController.text,
                      description: descriptionController.text,
                      date: dateController.text,
                      time: timeController.text,
                      status: statusController.text,
                      color: taskColors[selectedIndexColor ?? 0].toARGB32(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
