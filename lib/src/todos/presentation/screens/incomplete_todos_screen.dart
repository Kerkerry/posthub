import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posthub/src/photos/presentation/widgets/error_card.dart';
import 'package:posthub/src/todos/data/models/todo_model.dart';
import 'package:posthub/src/todos/presentation/bloc/todo_bloc.dart';
import 'package:posthub/src/todos/presentation/widgets/todo_card.dart';
import 'package:posthub/src/users/presentation/widgets/loading_column.dart';

class InCompleteTodosScreen extends StatefulWidget {
  const InCompleteTodosScreen({super.key});

  @override
  State<InCompleteTodosScreen> createState() => _InCompleteTodosScreenState();
}

class _InCompleteTodosScreenState extends State<InCompleteTodosScreen> {
  void getInComplete() {
    context.read<TodoBloc>().add(const GetCompleteTodosEvent(complete: false));
  }

  @override
  void initState() {
    getInComplete();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Incompleted todos"),
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
