import 'package:equatable/equatable.dart';
import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/todos/domain/entities/todo.dart';
import 'package:posthub/src/todos/domain/repositories/todo_repository.dart';

class UpdateTodo extends UsecaseWithParams<void, UpdateTodoParams> {
  final TodoRepository _repository;

  UpdateTodo({required TodoRepository repository}) : _repository = repository;
  @override
  ResultFuture<void> call(UpdateTodoParams params) async =>
      _repository.updateTodo(id: params.todoId, todo: params.todo);
}

class UpdateTodoParams extends Equatable {
  final int todoId;
  final Todo todo;

  const UpdateTodoParams({required this.todoId, required this.todo});

  @override
  List<Object?> get props => [todoId, todo.id];
}
