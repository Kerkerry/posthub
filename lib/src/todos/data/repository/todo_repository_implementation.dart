import 'package:dartz/dartz.dart';
import 'package:posthub/core/errors/exception.dart';
import 'package:posthub/core/errors/failure.dart';
import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/src/todos/data/datasources/todo_remote_datasource.dart';
import 'package:posthub/src/todos/data/models/todo_model.dart';
import 'package:posthub/src/todos/domain/entities/todo.dart';
import 'package:posthub/src/todos/domain/repositories/todo_repository.dart';

class TodoRepositoryImplementation implements TodoRepository {
  final TodoRemoteDatasource _datasource;

  TodoRepositoryImplementation({required TodoRemoteDatasource datasource})
      : _datasource = datasource;

  @override
  ResultVoid createTodo(
      {required int userId,
      required String title,
      required bool completed}) async {
    try {
      await _datasource.createTodo(
          userId: userId, title: title, completed: completed);
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultVoid deletTodo({required int id}) async {
    try {
      await _datasource.deletTodo(id: id);
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<Todo> getTodo({required int id}) async {
    try {
      final result = await _datasource.getTodo(id: id);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<TodoModel>> getTodos() async {
    try {
      final result = await _datasource.getTodos();
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Todo>> getUserTodos({required int userId}) async {
    try {
      final result = await _datasource.getUserTodos(userId: userId);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultVoid updateTodo({required int id, required Todo todo}) async {
    try {
      await _datasource.updateTodo(id: id, todo: todo);
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Todo>> getCompletedTodos({required bool completed}) async {
    try {
      final result = await _datasource.getCompletedTodos(completed: completed);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
}
