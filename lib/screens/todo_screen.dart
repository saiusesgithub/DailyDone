import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

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
              onPressed: () {},
              label: Text(
                "New Task",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              icon: Icon(Icons.add),
              backgroundColor: Color.fromRGBO(255, 94, 87, 1.0),
              foregroundColor: Color.fromRGBO(13, 13, 13, 1.0),
            ),
          ),
        ],
      );
  }
}
