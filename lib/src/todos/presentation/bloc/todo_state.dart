part of 'todo_bloc.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

final class TodoInitial extends TodoState {}

class CreatingTodoState extends TodoState {
  const CreatingTodoState();
}

class TodoCreateState extends TodoState {
  const TodoCreateState();
}

class DeletingTodoState extends TodoState {
  const DeletingTodoState();
}

class TodoDeletedState extends TodoState {
  const TodoDeletedState();
}

class GettingTodoState extends TodoState {
  const GettingTodoState();
}

class TodoLoadedState extends TodoState {
  final Todo todo;

  const TodoLoadedState({required this.todo});
  @override
  List<Object> get props => [todo.id];
}

class GettingTodosState extends TodoState {
  const GettingTodosState();
}

class TodosLoadedState extends TodoState {
  final List<TodoModel> todos;

  const TodosLoadedState({required this.todos});
  @override
  List<Object> get props => todos.map((todo) => todo.id).toList();
}

class UpdatingTodoState extends TodoState {
  const UpdatingTodoState();
}

class TodoUpdatedState extends TodoState {
  const TodoUpdatedState();
}

class GettingUserTodosState extends TodoState {
  const GettingUserTodosState();
}

class UserTodosLoadedState extends TodoState {
  final List<Todo> todos;
  const UserTodosLoadedState({required this.todos});

  @override
  List<Object> get props => todos.map((todo) => todo.id).toList();
}

class GettingCompleteTodosState extends TodoState {
  const GettingCompleteTodosState();
}

class CompleteTodosLoadedState extends TodoState {
  final List<Todo> todos;
  const CompleteTodosLoadedState({required this.todos});

  @override
  List<Object> get props => todos.map((todo) => todo.id).toList();
}

class TodoErrorState extends TodoState {
  final String message;
  const TodoErrorState(this.message);
}
