import 'dart:convert';

import 'package:posthub/core/constants/api_constants.dart';
import 'package:posthub/core/constants/get_api_params.dart';
import 'package:posthub/core/errors/exception.dart';
import 'package:posthub/core/helper/logger_helper.dart';
import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/src/todos/data/datasources/todo_remote_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:posthub/src/todos/data/models/todo_model.dart';
import 'package:posthub/src/todos/domain/entities/todo.dart';

class TodoRemoteDatasourceImplementation implements TodoRemoteDatasource {
  final http.Client _client;

  TodoRemoteDatasourceImplementation({required http.Client client})
      : _client = client;

  @override
  Future createTodo(
      {required int userId,
      required String title,
      required bool completed}) async {
    try {
      final response = await _client.post(Uri.https(kBaseUrl, kTodosEndPoint),
          body: jsonEncode(
              {'userId': userId, 'title': title, 'completed': completed}),
          headers: headers);
      if (response.statusCode != 201) {
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
      logger.e('${response.statusCode}:${response.body}');
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future deletTodo({required int id}) async {
    try {
      final response = await _client
          .delete(Uri.https(kBaseUrl, '$kTodosEndPoint/$id'), headers: headers);
      if (response.statusCode != 200) {
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
      logger.e('${response.statusCode}:${response.body}');
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future<Todo> getTodo({required int id}) async {
    try {
      final response = await _client
          .get(Uri.https(kBaseUrl, '$kTodosEndPoint/$id'), headers: headers);
      if (response.statusCode != 200) {
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
      return TodoModel.fromJson(response.body);
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future<List<TodoModel>> getTodos() async {
    try {
      final response = await _client.get(Uri.https(kBaseUrl, kTodosEndPoint),
          headers: headers);
      if (response.statusCode != 200) {
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
      return List<DataMap>.from(jsonDecode(response.body) as List)
          .map((todo) => TodoModel.fromMap(todo))
          .toList();
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future<List<Todo>> getUserTodos({required int userId}) async {
    final uri = 'https://$kBaseUrl${getUserTodosEndpoint(userId)}';
    try {
      final response = await _client.get(Uri.parse(uri), headers: headers);
      if (response.statusCode != 200) {
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
      return List<DataMap>.from(jsonDecode(response.body) as List)
          .map((todo) => TodoModel.fromMap(todo))
          .toList();
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future updateTodo({required int id, required Todo todo}) async {
    try {
      final response =
          await _client.put(Uri.https(kBaseUrl, '$kTodosEndPoint/$id'),
              body: jsonEncode({
                'id': todo.id,
                'userId': todo.userId,
                'title': todo.title,
                'completed': todo.completed
              }),
              headers: headers);
      if (response.statusCode != 200) {
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
      logger.e('${response.statusCode}:${response.body}');
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future<List<Todo>> getCompletedTodos({required bool completed}) async {
    final uri = 'https://$kBaseUrl${getCompletedTodosEndpoint(completed)}';
    try {
      final response = await _client.get(Uri.parse(uri), headers: headers);
      if (response.statusCode != 200) {
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
      return List<DataMap>.from(jsonDecode(response.body) as List)
          .map((todo) => TodoModel.fromMap(todo))
          .toList();
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }
}
