import 'package:equatable/equatable.dart';
import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/todos/domain/repositories/todo_repository.dart';

class CreateTodo extends UsecaseWithParams<void, CreateTodoParams> {
  final TodoRepository _repository;

  CreateTodo({required TodoRepository repository}) : _repository = repository;
  @override
  ResultFuture<void> call(CreateTodoParams params) async =>
      _repository.createTodo(
          userId: params.userId,
          title: params.title,
          completed: params.completed);
}

class CreateTodoParams extends Equatable {
  final int userId;
  final String title;
  final bool completed;

  const CreateTodoParams(
      {required this.userId, required this.title, required this.completed});

  @override
  List<Object?> get props => [userId, title, completed];
}
