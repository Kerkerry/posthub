import 'dart:convert';

import 'package:posthub/core/constants/api_constants.dart';
import 'package:posthub/core/errors/exception.dart';
import 'package:posthub/core/constants/get_api_params.dart';
import 'package:posthub/core/helper/logger_helper.dart';
import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/src/posts/data/datasources/post_remote_datasource.dart';
import 'package:posthub/src/posts/data/models/post_model.dart';
import 'package:posthub/src/posts/domain/entities/post.dart';
import 'package:http/http.dart' as http;

class PostRemoteDatasourceImplementation implements PostRemoteDatasource {
  const PostRemoteDatasourceImplementation({required this.client});
  final http.Client client;

  @override
  Future createPost(
      {required int userId,
      required String title,
      required String body}) async {
    try {
      final response = await client.post(
          Uri.http(kBaseUrl, kCreatePostsEndpoint),
          body: jsonEncode({'userId': userId, 'title': title, 'body': body}),
          headers: headers);
      if (response.statusCode != 201) {
        logger.e(response.body);
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
    } on APIException catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future deletPost({required int id}) async {
    try {
      final response = await client.delete(
          Uri.https(kBaseUrl, getEndpoint('/posts', id)),
          headers: headers);
      if (response.statusCode != 200) {
        logger.e(response.body);
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
    } on APIException catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future<PostModel> getPost({required int id}) async {
    try {
      final response = await client.get(
          Uri.https(kBaseUrl, getEndpoint('/posts', id)),
          headers: headers);
      return PostModel.fromJson(response.body);
    } on APIException catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future<List<PostModel>> getPosts() async {
    try {
      final response = await client.get(Uri.https(kBaseUrl, kGetPostsEndpoint),
          headers: headers);
      return List<DataMap>.from(jsonDecode(response.body) as List)
          .map((post) => PostModel.fromMap(post))
          .toList();
    } on APIException catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future updatePost({required int id, required Post post}) async {
    try {
      final response = await client.put(
          Uri.https(kBaseUrl, getEndpoint('/posts', id)),
          body: jsonEncode({
            'id': post.id,
            'userId': post.userId,
            'title': post.title,
            'body': post.body
          }),
          headers: headers);
      if (response.statusCode != 200) {
        logger.e(response.body);
        throw (APIException(message: response.body, statusCode: 505));
      }
    } on APIException catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future<List<Post>> getUserPost({required int userId}) async {
    try {
      final ressponse = await client.get(
          Uri.https(kBaseUrl, getUserPostsEndpoint(userId: userId)),
          headers: headers);
      if (ressponse.statusCode != 200) {
        throw (APIException(
            message: ressponse.body, statusCode: ressponse.statusCode));
      }
      return List<DataMap>.from(jsonDecode(ressponse.body) as List)
          .map((post) => PostModel.fromMap(post))
          .toList();
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }
}
