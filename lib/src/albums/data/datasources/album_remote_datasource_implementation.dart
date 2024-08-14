import 'dart:convert';

import 'package:posthub/core/constants/api_constants.dart';
import 'package:posthub/core/errors/exception.dart';
import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/src/albums/data/datasources/album_remote_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:posthub/src/albums/data/models/album_model.dart';
import 'package:posthub/src/albums/domain/entities/album.dart';

class AlbumRemoteDatasourceImplementation implements AlbumRemoteDatasource {
  const AlbumRemoteDatasourceImplementation({required http.Client client})
      : _client = client;
  final http.Client _client;

  @override
  Future createAlbum({required int userId, required String title}) async {
    try {
      final response = await _client.post(Uri.https(kBaseUrl, kAlbumsEndpoint),
          body: jsonEncode({'userId': userId, 'title': title}),
          headers: headers);
      if (response.statusCode != 201) {
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future deletAlbum({required int id}) async {
    try {
      final response = await _client.delete(
          Uri.https(kBaseUrl, '$kAlbumsEndpoint/$id'),
          headers: headers);
      if (response.statusCode != 200) {
        throw (APIException(
            statusCode: response.statusCode, message: response.body));
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future<Album> getAlbum({required int id}) async {
    try {
      final response = await _client
          .get(Uri.https(kBaseUrl, '$kAlbumsEndpoint/$id'), headers: headers);
      if (response.statusCode != 200) {
        throw (APIException(
            statusCode: response.statusCode, message: response.body));
      }
      return AlbumModel.fromJson(response.body);
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future<List<Album>> getAlbums() async {
    try {
      final response = await _client.get(Uri.https(kBaseUrl, kAlbumsEndpoint),
          headers: headers);
      if (response.statusCode != 200) {
        throw (APIException(
            statusCode: response.statusCode, message: response.body));
      }
      return List<DataMap>.from(jsonDecode(response.body) as List)
          .map((album) => AlbumModel.fromMap(album))
          .toList();
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future<List<Album>> getUserAlbums({required int userId}) async {
    try {
      final response = await _client.get(
          Uri.https(kBaseUrl, '$kGetUserEndpoint/$userId$kAlbumsEndpoint'),
          headers: headers);
      if (response.statusCode != 200) {
        throw (APIException(
            statusCode: response.statusCode, message: response.body));
      }
      return List<DataMap>.from(jsonDecode(response.body) as List)
          .map((album) => AlbumModel.fromMap(album))
          .toList();
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future updateAlum({required int id, required Album album}) async {
    try {
      final response = await _client.put(
          Uri.https(kBaseUrl, '$kAlbumsEndpoint/$id'),
          body: jsonEncode(
              {'id': album.id, 'userId': album.userId, 'title': album.title}),
          headers: headers);
      if (response.statusCode != 200) {
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }
}
