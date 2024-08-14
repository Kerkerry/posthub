import 'package:posthub/src/todos/data/models/todo_model.dart';
import 'package:posthub/src/todos/domain/entities/todo.dart';

abstract class TodoRemoteDatasource {
  const TodoRemoteDatasource();
  Future createTodo({
    required int userId,
    required String title,
    required bool completed,
  });

  Future updateTodo({required int id, required Todo todo});

  Future deletTodo({required int id});

  Future<List<TodoModel>> getTodos();

  Future<Todo> getTodo({required int id});

  Future<List<Todo>> getUserTodos({required int userId});
  Future<List<Todo>> getCompletedTodos({required bool completed});
}
