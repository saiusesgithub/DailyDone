import 'package:flutter/material.dart';


class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('this is todo screen',style: TextStyle(color: Colors.white),),);
  }
}