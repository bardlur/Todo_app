import 'type_enum.dart';
import 'package:hive/hive.dart';

part 'type_task.g.dart';

@HiveType(typeId: 2)
class TaskType{
  TaskType({
    required this.image,
    required this.title,
    required this.taskTypeEnum
  });

  @HiveField(0)
  String image;

  @HiveField(1)
  String title;

  @HiveField(2)
  TaskTypeEnum  taskTypeEnum;
}