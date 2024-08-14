import 'dart:convert';

import 'package:posthub/core/constants/api_constants.dart';
import 'package:posthub/core/constants/get_api_params.dart';
import 'package:posthub/core/errors/exception.dart';
import 'package:posthub/core/helper/logger_helper.dart';
import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/src/photos/data/datasource/photo_remote_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:posthub/src/photos/data/models/photo_model.dart';
import 'package:posthub/src/photos/domain/entities/photo.dart';

class PhotoRemoteDatasourceImplementation implements PhotoRemoteDatasource {
  final http.Client _client;
  PhotoRemoteDatasourceImplementation({required http.Client client})
      : _client = client;

  @override
  Future createPhoto(
      {required int albumId,
      required String title,
      required String url,
      required String thumbnailUrl}) async {
    try {
      final response = await _client.post(
        Uri.https(kBaseUrl, kPhotosEndpoint),
        body: jsonEncode({
          'albumId': albumId,
          'title': title,
          'url': url,
          'thumbnailUrl': thumbnailUrl
        }),
        headers: headers,
      );
      if (response.statusCode != 201) {
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
      logger.e("${response.statusCode} ${response.body}");
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future deletePhoto({required int id}) async {
    try {
      final response = await _client.delete(
        Uri.https(kBaseUrl, '/photos/$id'),
        headers: headers,
      );
      if (response.statusCode != 200) {
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
      logger.e("${response.statusCode} ${response.body}");
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future<List<Photo>> getAlbumPhotos({required int albumId}) async {
    try {
      final response = await _client.get(
        Uri.https(kBaseUrl, getAlbumPhotosEndpoint(albumId: albumId)),
        headers: headers,
      );
      if (response.statusCode != 200) {
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
      return List<DataMap>.from(jsonDecode(response.body) as List)
          .map((photo) => PhotoModel.fromMap(photo))
          .toList();
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future<Photo> getPhoto({required int id}) async {
    try {
      final response = await _client.get(
        Uri.https(kBaseUrl, '/photos/$id'),
        headers: headers,
      );
      if (response.statusCode != 200) {
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
      return PhotoModel.fromJson(response.body);
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future<List<Photo>> getPhotos() async {
    try {
      final response = await _client.get(
        Uri.https(kBaseUrl, kPhotosEndpoint),
        headers: headers,
      );
      if (response.statusCode != 200) {
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
      return List<DataMap>.from(jsonDecode(response.body) as List)
          .map((photo) => PhotoModel.fromMap(photo))
          .toList();
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future updatePhoto({required int id, required Photo photo}) async {
    try {
      final response = await _client.put(
        Uri.https(kBaseUrl, '$kPhotosEndpoint/$id'),
        body: jsonEncode({
          'id': photo.id,
          'albumId': photo.albumId,
          'title': photo.title,
          'url': photo.url,
          'thumbnailUrl': photo.thumbnailUrl
        }),
        headers: headers,
      );
      if (response.statusCode != 200) {
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
      logger.e("${response.statusCode} ${response.body}");
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }
}
