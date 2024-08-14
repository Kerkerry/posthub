import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/todos/domain/entities/todo.dart';
import 'package:posthub/src/todos/domain/repositories/todo_repository.dart';

class GetCompletedTodos extends UsecaseWithParams<List<Todo>, bool> {
  final TodoRepository _repository;

  GetCompletedTodos({required TodoRepository repository})
      : _repository = repository;

  @override
  ResultFuture<List<Todo>> call(bool params) async =>
      _repository.getCompletedTodos(completed: params);
}
