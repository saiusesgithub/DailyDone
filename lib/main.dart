import 'package:daily_done/screens/about.dart';
import 'package:daily_done/screens/habits_screen.dart';
import 'package:daily_done/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:daily_done/models/todo_model.dart';
import 'package:daily_done/models/habits_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(TodoAdapter()); // ✅ register your model
  await Hive.openBox<Todo>('todos');

  Hive.registerAdapter(HabitsAdapter());
  await Hive.openBox<Habits>('habitBox'); 
  
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color accentColor = Color.fromRGBO(255, 94, 87, 1.0);

  @override
  void initState() {
    super.initState();
    loadAccentColor();
  }

  void loadAccentColor() async{
    final prefs = await SharedPreferences.getInstance();
    int? savedColor = prefs.getInt('accentColor');
    if (savedColor != null) {
      setState(() {
        accentColor = Color(savedColor);
      });
    }
  }

  void updateAccent(Color newColor) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('accentColor', newColor.value); // save as int

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
        '/habits' : (context) => HabitsScreen(accentColor: accentColor),
      }
    );
  }
}
