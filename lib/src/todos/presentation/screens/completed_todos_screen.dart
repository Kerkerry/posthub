import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posthub/src/photos/presentation/widgets/error_card.dart';
import 'package:posthub/src/todos/data/models/todo_model.dart';
import 'package:posthub/src/todos/presentation/bloc/todo_bloc.dart';
import 'package:posthub/src/todos/presentation/widgets/todo_card.dart';
import 'package:posthub/src/users/presentation/widgets/loading_column.dart';

class CompleteTodosScreen extends StatefulWidget {
  const CompleteTodosScreen({super.key});

  @override
  State<CompleteTodosScreen> createState() => _CompleteTodosScreenState();
}

class _CompleteTodosScreenState extends State<CompleteTodosScreen> {
  void getComplete() {
    context.read<TodoBloc>().add(const GetCompleteTodosEvent(complete: true));
  }

  @override
  void initState() {
    getComplete();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Completed todos"),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoErrorState) {
            return ErrorCard(error: state.message);
          }
          if (state is GettingCompleteTodosState) {
            return const LoadingColumn(message: 'Fetching todos');
          }
          if (state is CompleteTodosLoadedState) {
            return ListView.builder(
                itemCount: state.todos.length,
                itemBuilder: (context, index) {
                  final todo = state.todos[index];
                  return TodoCard(todo: todo as TodoModel);
                });
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
