import 'dart:convert';

import 'package:posthub/core/constants/api_constants.dart';
import 'package:posthub/core/errors/exception.dart';
import 'package:posthub/core/constants/get_api_params.dart';
import 'package:posthub/core/helper/logger_helper.dart';
import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/src/users/data/datasource/user_remote_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:posthub/src/users/data/models/user_model.dart';

class UserRemoteDatasourceImplementation extends UserRemoteDatasource {
  const UserRemoteDatasourceImplementation(this._client);
  final http.Client _client;

  @override
  Future createuser(
      {required String name,
      required String username,
      required String email,
      required DataMap address,
      required String phone,
      required String website,
      required DataMap company}) async {
    try {
      final response =
          await _client.post(Uri.https(kBaseUrl, kCreateUserEndpoint),
              body: jsonEncode({
                'name': name,
                'username': username,
                'email': email,
                'address': address,
                'phone': phone,
                'website': website,
                'company': company
              }),
              headers: {'Content-Type': 'application/json'});
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
  Future deleteUser({required int id}) async {
    try {
      final response =
          await _client.post(Uri.https(kBaseUrl, getEndpoint('/users', id)));
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
  Future<List<UserModel>> getUsers() async {
    try {
      final response = await _client.get(Uri.http(kBaseUrl, kGetUserEndpoint),
          headers: {'Content-Type': 'application/json', 'Charset': 'utf-8'});
      if (response.statusCode != 200) {
        logger.e(response.statusCode);
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
      return List<DataMap>.from(jsonDecode(response.body) as List)
          .map((user) => UserModel.fromMap(user))
          .toList();
    } on APIException catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future updateUser({required int id, required UserModel user}) async {
    try {
      final response = await _client.put(
          Uri.https(kBaseUrl, getEndpoint('/users', id)),
          body: user.toJson());
      if (response.statusCode != 200) {
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
    } on APIException catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future<UserModel> getUser({required id}) async {
    try {
      final response =
          await _client.get(Uri.https(kBaseUrl, getEndpoint('/users', id)));
      if (response.statusCode != 200) {
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
      return UserModel.fromJson(response.body);
    } on APIException catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future getUserByEmail({required String email}) async {
    try {
      final uri = 'https://$kBaseUrl${getUserByEmailEndpoint(email)}';
      final response = await _client.get(Uri.parse(uri));
      if (response.statusCode != 200) {
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
      if (jsonDecode(response.body).isEmpty) {
        throw (const APIException(
            message: 'The user is not registered', statusCode: 404));
      }
      return UserModel.fromMap(jsonDecode(response.body)[0]);
    } on APIException catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }
}
