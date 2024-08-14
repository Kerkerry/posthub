import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:posthub/core/helper/logger_helper.dart';
import 'package:posthub/src/todos/data/models/todo_model.dart';
import 'package:posthub/src/todos/domain/entities/todo.dart';
import 'package:posthub/src/todos/domain/usecase/create_todo.dart';
import 'package:posthub/src/todos/domain/usecase/delete_todo.dart';
import 'package:posthub/src/todos/domain/usecase/get_completed_todos.dart';
import 'package:posthub/src/todos/domain/usecase/get_todo.dart';
import 'package:posthub/src/todos/domain/usecase/get_todos.dart';
import 'package:posthub/src/todos/domain/usecase/get_user_todos.dart';
import 'package:posthub/src/todos/domain/usecase/update_todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final CreateTodo _createTodo;
  final DeleteTodo _deleteTodo;
  final GetTodo _getTodo;
  final GetTodos _getTodos;
  final GetUserTodos _getUserTodos;
  final UpdateTodo _updateTodo;
  final GetCompletedTodos _completeTodos;

  TodoBloc({
    required CreateTodo createTodo,
    required DeleteTodo deleteTodo,
    required GetTodo getTodo,
    required GetTodos getTodos,
    required GetUserTodos getUserTodos,
    required UpdateTodo updateTodo,
    required GetCompletedTodos completeTodos,
  })  : _createTodo = createTodo,
        _deleteTodo = deleteTodo,
        _getTodo = getTodo,
        _getTodos = getTodos,
        _getUserTodos = getUserTodos,
        _updateTodo = updateTodo,
        _completeTodos = completeTodos,
        super(TodoInitial()) {
    on<CreateTodoEvent>(_createTodoHandler);
    on<DeleteTodoEvent>(_deleteTodoHandler);
    on<GetTodoEvent>(_getTodoHandler);
    on<GetTodosEvent>(_getTodosHandler);
    on<GetUserTodosEvent>(_getUserTodosHandler);
    on<UpdateTodoEvent>(_updateTodoHandler);
    on<GetCompleteTodosEvent>(_completeTodosHandler);
  }

  FutureOr<void> _createTodoHandler(
      CreateTodoEvent event, Emitter<TodoState> emit) async {
    emit(const CreatingTodoState());
    final result = await _createTodo(CreateTodoParams(
        userId: event.userId, title: event.title, completed: event.completed));
    result.fold((failure) => emit(TodoErrorState(failure.message)),
        (_) => const TodoCreateState());
  }

  FutureOr<void> _deleteTodoHandler(
      DeleteTodoEvent event, Emitter<TodoState> emit) async {
    emit(const DeletingTodoState());
    final result = await _deleteTodo(event.id);
    result.fold((failure) => emit(TodoErrorState(failure.message)),
        (_) => emit(const TodoDeletedState()));
  }

  FutureOr<void> _getTodoHandler(
      GetTodoEvent event, Emitter<TodoState> emit) async {
    emit(const GettingTodoState());
    final result = await _getTodo(event.id);
    result.fold((failure) => emit(TodoErrorState(failure.message)),
        (todo) => emit(TodoLoadedState(todo: todo)));
  }

  FutureOr<void> _getTodosHandler(
      GetTodosEvent event, Emitter<TodoState> emit) async {
    emit(const GettingTodosState());
    final result = await _getTodos();
    result.fold((failure) => emit(TodoErrorState(failure.message)), (todos) {
      logger.e(todos);
      emit(TodosLoadedState(todos: todos));
    });
  }

  FutureOr<void> _getUserTodosHandler(
      GetUserTodosEvent event, Emitter<TodoState> emit) async {
    emit(const GettingUserTodosState());
    final result = await _getUserTodos(event.userId);
    result.fold((failure) => emit(TodoErrorState(failure.message)), (todos) {
      logger.e(todos);
      emit(UserTodosLoadedState(todos: todos));
    });
  }

  FutureOr<void> _updateTodoHandler(
      UpdateTodoEvent event, Emitter<TodoState> emit) async {
    emit(const UpdatingTodoState());
    final result = await _updateTodo(
        UpdateTodoParams(todoId: event.todoId, todo: event.todo));
    result.fold((failure) => emit(TodoErrorState(failure.message)), (_) {
      emit(const TodoUpdatedState());
    });
  }

  FutureOr<void> _completeTodosHandler(
      GetCompleteTodosEvent event, Emitter<TodoState> emit) async {
    emit(const GettingCompleteTodosState());
    final result = await _completeTodos(event.complete);
    result.fold((failure) => emit(TodoErrorState(failure.message)),
        (todos) => emit(CompleteTodosLoadedState(todos: todos)));
  }
}
