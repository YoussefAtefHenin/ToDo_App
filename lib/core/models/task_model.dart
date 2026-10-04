import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  String date;
  @HiveField(3)
  String time;
  @HiveField(4)
  String status;
  @HiveField(5)
  int color;

  TaskModel({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.status,
    required this.color,
  });
}

// dart run build_runner build --delete-conflicting-outputs
