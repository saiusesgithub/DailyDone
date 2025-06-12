import 'package:flutter/material.dart';

class HabitsScreen extends StatefulWidget {
  const HabitsScreen({super.key});

  @override
  State<HabitsScreen> createState() => _HabitsScreenState();
}

class _HabitsScreenState extends State<HabitsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1.0),
      appBar: AppBar(
        title: Text("DailyDone", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(13, 13, 13, 1.0),
        foregroundColor: Color.fromRGBO(255, 94, 87, 1.0),
        shadowColor: Color.fromRGBO(0, 0, 0, 0.2),
        leading: Icon(Icons.menu_outlined),
        actions: [Icon(Icons.search)],
        actionsPadding: EdgeInsets.only(right: 12),
      ),

      body: Container(),

      bottomNavigationBar: NavigationBar(
        indicatorColor: Color.fromRGBO(255, 94, 87, 1.0),
        backgroundColor: Color.fromRGBO(13, 13, 13, 1.0),
        destinations: <Widget>[
          NavigationDestination(
            icon: Icon(Icons.checklist_outlined),
            label: 'Todo',
          ),
          NavigationDestination(
            icon: Icon(Icons.whatshot_outlined),
            label: 'Habits',
            selectedIcon: Icon(Icons.whatshot_outlined),
          ),
        ],
      ),
    );
  }
}