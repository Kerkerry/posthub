import 'package:dartz/dartz.dart';
import 'package:posthub/core/errors/exception.dart';
import 'package:posthub/core/errors/failure.dart';
import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/src/photos/data/datasource/photo_remote_datasource.dart';
import 'package:posthub/src/photos/domain/entities/photo.dart';
import 'package:posthub/src/photos/domain/repositories/photo_repository.dart';

class PhotoRepositoryImplementation implements PhotoRepository {
  final PhotoRemoteDatasource _datasource;

  PhotoRepositoryImplementation({required PhotoRemoteDatasource datasource})
      : _datasource = datasource;
  @override
  ResultVoid createPhoto(
      {required int albumId,
      required String title,
      required String url,
      required String thumbnailUrl}) async {
    try {
      await _datasource.createPhoto(
          albumId: albumId, title: title, url: url, thumbnailUrl: thumbnailUrl);
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultVoid deletePhoto({required int id}) async {
    try {
      await _datasource.deletePhoto(id: id);
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Photo>> getAlbumPhotos({required int albumId}) async {
    try {
      final result = await _datasource.getAlbumPhotos(albumId: albumId);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<Photo> getPhoto({required int id}) async {
    try {
      final result = await _datasource.getPhoto(id: id);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Photo>> getPhotos() async {
    try {
      final result = await _datasource.getPhotos();
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultVoid updatePhoto({required int id, required Photo photo}) async {
    try {
      await _datasource.updatePhoto(id: id, photo: photo);
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
}
