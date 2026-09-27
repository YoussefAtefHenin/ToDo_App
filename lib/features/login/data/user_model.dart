import 'package:hive_flutter/adapters.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String image;
  UserModel({required this.name, required this.image});
}

// dart run build_runner build --delete-conflicting-outputs
