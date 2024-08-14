part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class CreateTodoEvent extends TodoEvent {
  final int userId;
  final String title;
  final bool completed;

  const CreateTodoEvent(
      {required this.userId, required this.title, required this.completed});

  @override
  List<Object> get props => [userId, title, completed];
}

class UpdateTodoEvent extends TodoEvent {
  final int todoId;
  final Todo todo;

  const UpdateTodoEvent({required this.todoId, required this.todo});
  @override
  List<Object> get props => [todo.id, todoId];
}

class DeleteTodoEvent extends TodoEvent {
  final int id;

  const DeleteTodoEvent({required this.id});
}

class GetTodoEvent extends TodoEvent {
  final int id;
  const GetTodoEvent({required this.id});
}

class GetUserTodosEvent extends TodoEvent {
  final int userId;
  const GetUserTodosEvent({required this.userId});
}

class GetCompleteTodosEvent extends TodoEvent {
  final bool complete;
  const GetCompleteTodosEvent({required this.complete});
}

class GetTodosEvent extends TodoEvent {
  const GetTodosEvent();
}
