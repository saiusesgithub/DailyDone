import 'package:daily_done/screens/addingtask.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  final Color accentColor;
  const TodoScreen({super.key, required this.accentColor});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('this is todo screen', style: TextStyle(color: Colors.white)),

        Container(
          padding: EdgeInsets.all(15),
          alignment: Alignment.bottomRight,
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Addingtask(accentColor: widget.accentColor),
                ),
              );
            },
            label: Text(
              "New Task",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            icon: Icon(Icons.add),
            backgroundColor: widget.accentColor,
            foregroundColor: Color.fromRGBO(13, 13, 13, 1.0),
          ),
        ),
      ],
    );
  }
}
