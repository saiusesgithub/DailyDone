import 'package:daily_done/screens/about.dart';
import 'package:daily_done/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color accentColor = Color.fromRGBO(255, 94, 87, 1.0);

  void updateAccent(Color newColor) {
    setState(() {
      accentColor = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Poppins'),
        colorScheme: ColorScheme.dark(primary: accentColor),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: accentColor,
        ),
      ),
      title: 'DailyDone',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      home: HomeScreen(accentColor: accentColor, onAccentColorChanged: updateAccent),
      routes: {
        '/about': (context) => AboutPage(accentColor: accentColor,),
      }
    );
  }
}
