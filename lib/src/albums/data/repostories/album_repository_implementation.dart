import 'package:dartz/dartz.dart';
import 'package:posthub/core/errors/exception.dart';
import 'package:posthub/core/errors/failure.dart';
import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/src/albums/data/datasources/album_remote_datasource.dart';
import 'package:posthub/src/albums/domain/entities/album.dart';
import 'package:posthub/src/albums/domain/repositories/album_repository.dart';

class AlbumRepositoryImplementation implements AlbumRepository {
  final AlbumRemoteDatasource _remoteDatasource;

  AlbumRepositoryImplementation(
      {required AlbumRemoteDatasource remoteDatasource})
      : _remoteDatasource = remoteDatasource;

  @override
  ResultVoid createAlbum({required int userId, required String title}) async {
    try {
      await _remoteDatasource.createAlbum(userId: userId, title: title);
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultVoid deletAlbum({required int id}) async {
    try {
      await _remoteDatasource.deletAlbum(id: id);
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<Album> getAlbum({required int id}) async {
    try {
      final result = await _remoteDatasource.getAlbum(id: id);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Album>> getAlbums() async {
    try {
      final result = await _remoteDatasource.getAlbums();
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Album>> getUserAlbums({required int userId}) async {
    try {
      final result = await _remoteDatasource.getUserAlbums(userId: userId);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultVoid updateAlum({required int id, required Album album}) async {
    try {
      await _remoteDatasource.updateAlum(id: id, album: album);
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
}
