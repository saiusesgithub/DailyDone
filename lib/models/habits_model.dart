import 'package:hive/hive.dart';

part 'habits_model.g.dart';

@HiveType(typeId: 1)
class Habits extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String? description;

  @HiveField(2)
  DateTime createdon;

  @HiveField(3)
  List<DateTime> datescompleted;

  Habits({
    required this.title,
    required this.description,
    required this.createdon,
    required this.datescompleted,
  });
}
