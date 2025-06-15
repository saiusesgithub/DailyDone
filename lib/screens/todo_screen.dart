import 'package:daily_done/screens/addingtask.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:daily_done/models/todo_model.dart';

class TodoScreen extends StatefulWidget {
  final Color accentColor;
  const TodoScreen({super.key, required this.accentColor});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    final todobox = Hive.box<Todo>('todos');

    return ValueListenableBuilder(
      valueListenable: todobox.listenable(),
      builder: (context, Box<Todo> box, _) {
        final todos = box.values.toList();

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return ListTile(
                    title: Text(
                      todo.title,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      todo.description,
                      style: TextStyle(
                        color: Colors.white,
                        decoration: todo.isDone
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    trailing: Checkbox(
                      value: todo.isDone,
                      onChanged: (value) {
                        todo.isDone = value!;
                        todo.save();
                      },
                    ),
                    onLongPress: () {
                      todo.delete();
                    },
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomRight,
              child: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          Addingtask(accentColor: widget.accentColor),
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
      },
    );
  }
}




// Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text('this is todo screen', style: TextStyle(color: Colors.white)),

//         Container(
//           padding: EdgeInsets.all(15),
//           alignment: Alignment.bottomRight,
//           child: FloatingActionButton.extended(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => Addingtask(accentColor: widget.accentColor),
//                 ),
//               );
//             },
//             label: Text(
//               "New Task",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             icon: Icon(Icons.add),
//             backgroundColor: widget.accentColor,
//             foregroundColor: Color.fromRGBO(13, 13, 13, 1.0),
//           ),
//         ),
//       ],
//     );