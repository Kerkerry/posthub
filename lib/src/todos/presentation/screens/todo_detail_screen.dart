import 'package:flutter/material.dart';

class TodoDetailScreen extends StatelessWidget {
  const TodoDetailScreen({super.key, required this.todoId});
  final int todoId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
