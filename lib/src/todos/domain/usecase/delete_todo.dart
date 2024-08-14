import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/todos/domain/repositories/todo_repository.dart';

class DeleteTodo extends UsecaseWithParams<void, int> {
  final TodoRepository _repository;

  DeleteTodo({required TodoRepository repository}) : _repository = repository;

  @override
  ResultFuture<void> call(int params) async =>
      _repository.deletTodo(id: params);
}
