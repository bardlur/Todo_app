import 'package:hive/hive.dart';
import 'package:to_do/data/type_task.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject{
  Task
    ({
    required this.title, 
    required this.subtitle,
    this.isDone = false,
    required this.time,
    required this.taskType
    });

  @HiveField(0)
  String title;

  @HiveField(1)
  String subtitle;

  @HiveField(2)
  bool isDone;

  @HiveField(3)
  DateTime time;

  @HiveField(4)
  TaskType taskType;
}