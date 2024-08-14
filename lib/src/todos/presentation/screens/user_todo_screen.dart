import 'package:flutter/material.dart';

class UserTodoScreen extends StatefulWidget {
  const UserTodoScreen({super.key, required this.userId});
  final int userId;

  @override
  State<UserTodoScreen> createState() => _UserTodoScreenState();
}

class _UserTodoScreenState extends State<UserTodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
