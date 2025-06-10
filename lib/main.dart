import 'package:daily_done/screens/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DailyDone',
      home: Homescreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
