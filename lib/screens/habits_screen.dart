import 'package:daily_done/models/habits_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:daily_done/screens/addinghabit.dart';

class HabitsScreen extends StatefulWidget {
  final accentColor;
  const HabitsScreen({super.key, required this.accentColor});

  @override
  State<HabitsScreen> createState() => _HabitsScreenState();
}

class _HabitsScreenState extends State<HabitsScreen> {
  @override
  Widget build(BuildContext context) {
    final habitsbox = Hive.box<Habits>('habitBox');

    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Habits>('habitBox').listenable(),
        builder: (context, Box<Habits> box, _) {
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final habit = box.getAt(index);

              return ListTile(
                title: Text(
                  habit!.title,
                  style: TextStyle(
                    color: widget.accentColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "🔥 ${calculateStreak(habit)} day streak",
                  style: TextStyle(color: widget.accentColor, fontSize: 12),
                ),

                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      final today = DateTime.now();

                      if (!isCompletedToday(habit)) {
                        habit.datescompleted.add(today);
                        habit.save();
                      }
                    });
                  },
                  icon: Icon(
                    isCompletedToday(habit)
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomRight,
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AddingHabit(accentColor: widget.accentColor),
              ),
            );
          },
          label: Text(
            "New Habit",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          icon: Icon(Icons.add),
          backgroundColor: widget.accentColor,
          foregroundColor: Color.fromRGBO(13, 13, 13, 1.0),
        ),
      ),
    );
  }

  bool isCompletedToday(Habits habit) {
    final today = DateTime.now();
    return habit.datescompleted.any(
      (date) =>
          date.year == today.year &&
          date.month == today.month &&
          date.day == today.day,
    );
  }

  int calculateStreak(Habits habit) {
    final dates = habit.datescompleted.map(
      (d) => DateTime(d.year, d.month, d.day),
    );

    int streak = 0;
    DateTime day = DateTime.now();

    while (dates.contains(DateTime(day.year, day.month, day.day))) {
      streak++;
      day = day.subtract(Duration(days: 1));
    }

    return streak;
  }
}
