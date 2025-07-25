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

        todos.sort((a, b) {
          if (a.isDone != b.isDone) return a.isDone ? 1 : -1;
          if (a.priority != b.priority) return a.isDone ? 1 : -1;
          return 0;
        });

        if (box.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.hourglass_empty, color: Colors.grey, size: 64),
                SizedBox(height: 12),
                Text(
                  "No Tasks Yet!",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    return GestureDetector(
                      onHorizontalDragUpdate:
                          (_) {}, // Helps Flutter recognize swipe on mobile
                      behavior: HitTestBehavior.translucent,
          
                      child: Dismissible(
                        direction: DismissDirection.endToStart,
                        key: Key(todo.key.toString()),
                        onDismissed: (direction) {
                          todo.delete();
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text('Task deleted')));
                        },
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                        child: ListTile(
                          title: Text(
                            todo.title,
                            style: TextStyle(
                              color: widget.accentColor,
                              decoration: todo.isDone
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                          subtitle: Text(
                            todo.description,
                            style: TextStyle(
                              color: widget.accentColor,
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
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
