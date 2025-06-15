import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  bool priority;

  @HiveField(3)
  bool isDone;

  Todo({
    required this.title,
    required this.description,
    required this.isDone,
    required this.priority,
  });
}
