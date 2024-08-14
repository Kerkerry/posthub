import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/todos/data/models/todo_model.dart';
import 'package:posthub/src/todos/domain/repositories/todo_repository.dart';

class GetTodos extends UsecaseWithoutParams<List<TodoModel>> {
  final TodoRepository _repository;

  GetTodos({required TodoRepository repository}) : _repository = repository;

  @override
  ResultFuture<List<TodoModel>> call() async => _repository.getTodos();
}
