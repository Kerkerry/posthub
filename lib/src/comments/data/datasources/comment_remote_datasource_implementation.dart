import 'dart:convert';

import 'package:posthub/core/constants/api_constants.dart';
import 'package:posthub/core/errors/exception.dart';
import 'package:posthub/core/constants/get_api_params.dart';
import 'package:posthub/core/helper/logger_helper.dart';
import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/src/comments/data/datasources/comment_remote_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:posthub/src/comments/data/models/comment_model.dart';
import 'package:posthub/src/comments/domain/entities/comment.dart';

class CommentRemoteDatasourceImplementation implements CommentRemoteDatasource {
  final http.Client _client;
  CommentRemoteDatasourceImplementation({required http.Client client})
      : _client = client;

  @override
  Future createComment(
      {required int postId,
      required String name,
      required String email,
      required String body}) async {
    try {
      final response = await _client.post(
          Uri.https(kBaseUrl, kGetCommentsEndpoint),
          body: jsonEncode(
              {'postId': postId, 'name': name, 'email': email, 'body': body}),
          headers: headers);
      if (response.statusCode != 201) {
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
      logger.e('Status code:${response.statusCode}   "Body": ${response.body}');
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future deletComment({required int id}) async {
    final String endpoint = '$kGetCommentsEndpoint/$id';
    logger.e(Uri.https(kBaseUrl, endpoint));
    try {
      final response =
          await _client.post(Uri.https(kBaseUrl, endpoint), headers: headers);
      if (response.statusCode != 200) {
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
      logger.e('Status code:${response.statusCode}   "Body": ${response.body}');
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future<Comment> getComment({required int id}) async {
    try {
      final response = await _client.get(
          Uri.https(kBaseUrl, '$kGetCommentsEndpoint/$id'),
          headers: headers);
      if (response.statusCode != 200) {
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
      return CommentModel.fromJson(response.body);
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future<List<Comment>> getComments() async {
    try {
      final response = await _client
          .get(Uri.https(kBaseUrl, kGetCommentsEndpoint), headers: headers);
      if (response.statusCode != 200) {
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }

      return List<DataMap>.from(jsonDecode(response.body) as List)
          .map((comment) => CommentModel.fromMap(comment))
          .toList();
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future<List<Comment>> getPostComments({required int postId}) async {
    try {
      final response = await _client.get(
          Uri.https(kBaseUrl, getPostCommentsEndpoint(postId: postId)),
          headers: headers);
      if (response.statusCode != 200) {
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
      logger.e(response.body);
      return List<DataMap>.from(jsonDecode(response.body) as List)
          .map((comment) => CommentModel.fromMap(comment))
          .toList();
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future updateComment({required int id, required Comment comment}) async {
    try {
      final response =
          await _client.put(Uri.https(kBaseUrl, '$kGetCommentsEndpoint/$id'),
              body: jsonEncode({
                'id': comment.id,
                'postId': comment.postId,
                'name': comment.name,
                'email': comment.email,
                'body': comment.body
              }),
              headers: headers);
      if (response.statusCode != 200) {
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
      logger.e('Status code:${response.statusCode}   "Body": ${response.body}');
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }
}
