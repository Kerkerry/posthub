import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posthub/src/photos/presentation/widgets/error_card.dart';
import 'package:posthub/src/todos/presentation/bloc/todo_bloc.dart';
import 'package:posthub/src/todos/presentation/widgets/todo_card.dart';
import 'package:posthub/src/users/presentation/widgets/loading_column.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  void getTodos() {
    context.read<TodoBloc>().add(const GetTodosEvent());
  }

  @override
  void initState() {
    getTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<TodoBloc, TodoState>(
        listener: (context, state) {
          if (state is TodoUpdatedState) {
            getTodos();
          }
        },
        builder: (context, state) {
          if (state is TodoErrorState) {
            return ErrorCard(error: state.message);
          }
          if (state is GettingTodoState) {
            return const LoadingColumn(message: 'Fetching todos');
          }
          if (state is TodosLoadedState) {
            return ListView.builder(
                itemCount: state.todos.length,
                itemBuilder: (context, index) {
                  final todo = state.todos[index];
                  return TodoCard(todo: todo);
                });
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
