import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/todos/domain/entities/todo.dart';
import 'package:posthub/src/todos/domain/repositories/todo_repository.dart';

class GetUserTodos extends UsecaseWithParams<List<Todo>, int> {
  final TodoRepository _repository;

  GetUserTodos({required TodoRepository repository}) : _repository = repository;

  @override
  ResultFuture<List<Todo>> call(int params) async =>
      _repository.getUserTodos(userId: params);
}
