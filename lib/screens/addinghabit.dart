import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/habits_model.dart';

class AddingHabit extends StatefulWidget {
  final Color accentColor;
  const AddingHabit({super.key, required this.accentColor});

  @override
  State<AddingHabit> createState() => _AddingHabitState();
}

class _AddingHabitState extends State<AddingHabit> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1.0),
      appBar: AppBar(
        title: Text(
          "Add New Habit",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(13, 13, 13, 1.0),
        foregroundColor: widget.accentColor,
        shadowColor: Color.fromRGBO(0, 0, 0, 0.2),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.cancel_outlined),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),

      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    TextField(
                      controller: titlecontroller,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: widget.accentColor),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: widget.accentColor),
                        ),
                        labelText: "Title",
                        labelStyle: TextStyle(
                          color: widget.accentColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        floatingLabelAlignment: FloatingLabelAlignment.center,
                      ),
                    ),

                    SizedBox(height: 20),

                    TextField(
                      controller: descriptioncontroller,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: widget.accentColor),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: widget.accentColor),
                        ),
                        labelText: "Description",
                        labelStyle: TextStyle(
                          color: widget.accentColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        floatingLabelAlignment: FloatingLabelAlignment.center,
                      ),
                      maxLines: 3,
                      minLines: 1,
                    ),

                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                final habitBox = Hive.box<Habits>('habitBox');

                final newHabit = Habits(
                  title: titlecontroller.text,
                  description: descriptioncontroller.text,
                  createdon: DateTime.now(),
                  datescompleted: [],
                );
                habitBox.add(newHabit);
                Navigator.pop(context);
              },

              child: Text("Add"),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(widget.accentColor),
                foregroundColor: WidgetStatePropertyAll(
                  Color.fromRGBO(13, 13, 13, 1.0),
                ),
                minimumSize: WidgetStatePropertyAll(Size(100, 40)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
