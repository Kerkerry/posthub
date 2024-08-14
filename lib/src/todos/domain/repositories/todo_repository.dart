import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/src/todos/data/models/todo_model.dart';
import 'package:posthub/src/todos/domain/entities/todo.dart';

abstract class TodoRepository {
  const TodoRepository();

  ResultVoid createTodo({
    required int userId,
    required String title,
    required bool completed,
  });

  ResultVoid updateTodo({required int id, required Todo todo});

  ResultVoid deletTodo({required int id});

  ResultFuture<List<TodoModel>> getTodos();

  ResultFuture<Todo> getTodo({required int id});

  ResultFuture<List<Todo>> getUserTodos({required int userId});
  ResultFuture<List<Todo>> getCompletedTodos({required bool completed});
}
