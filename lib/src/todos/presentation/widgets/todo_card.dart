import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posthub/src/todos/data/models/todo_model.dart';
import 'package:posthub/src/todos/presentation/bloc/todo_bloc.dart';

class TodoCard extends StatefulWidget {
  const TodoCard({super.key, required this.todo});
  final TodoModel todo;

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          value: widget.todo.completed,
          onChanged: (value) {
            context.read<TodoBloc>().add(UpdateTodoEvent(
                todoId: widget.todo.id,
                todo: widget.todo.copyWith(compeleted: value)));
          },
        ),
        title: Text(
          widget.todo.title,
          style: TextStyle(fontSize: 17, color: Colors.black.withOpacity(0.75)),
        ),
      ),
    );
  }
}
