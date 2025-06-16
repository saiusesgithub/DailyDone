import 'package:daily_done/models/habits_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HabitsScreen extends StatefulWidget {
  final accentColor;
  const HabitsScreen({super.key, required this.accentColor});

  @override
  State<HabitsScreen> createState() => _HabitsScreenState();
}

class _HabitsScreenState extends State<HabitsScreen> {
  @override
  Widget build(BuildContext context) {
    final habitsbox = Hive.box<HabitsAdapter>('habits');

    return Container(
      padding: EdgeInsets.all(15),
      alignment: Alignment.bottomRight,
      child: FloatingActionButton.extended(
        onPressed: () {},
        label: Text("New Habit", style: TextStyle(fontWeight: FontWeight.bold)),
        icon: Icon(Icons.add),
        backgroundColor: widget.accentColor,
        foregroundColor: Color.fromRGBO(13, 13, 13, 1.0),
      ),
    );
  }
}
