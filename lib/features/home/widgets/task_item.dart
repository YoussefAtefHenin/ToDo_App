import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/models/task_model.dart';

class TaskItem extends StatelessWidget {
  final TaskModel? taskModel;
  const TaskItem({super.key, this.taskModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: Color(taskModel!.color),
      elevation: 2,

      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Row(
          children: [
            Container(
              height: 100.h,
              width: 20.w,
              decoration: BoxDecoration(
                color: Color(taskModel!.color),
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),
            20.horizontalSpace,
            Expanded(
              child: Column(
                // spacing: 5.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskModel?.title ?? "",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    taskModel?.description ?? "",
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  5.verticalSpace,
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: Color(taskModel!.color).withValues(alpha: .3),
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: Text(
                      taskModel?.status ?? "",
                      style: TextStyle(
                        color: Color(taskModel!.color),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(onTap: () {}, child: Icon(Icons.arrow_forward_ios)),
                25.verticalSpace,
                Text(taskModel?.time ?? ""),
                Text(taskModel?.date ?? ""),
              ],
            ),
            // Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
