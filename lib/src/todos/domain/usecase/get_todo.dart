import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/todos/domain/entities/todo.dart';
import 'package:posthub/src/todos/domain/repositories/todo_repository.dart';

class GetTodo extends UsecaseWithParams<Todo, int> {
  final TodoRepository _repository;

  GetTodo({required TodoRepository repository}) : _repository = repository;

  @override
  ResultFuture<Todo> call(int params) async => _repository.getTodo(id: params);
}
