import 'package:equatable/equatable.dart';
import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/albums/domain/entities/album.dart';
import 'package:posthub/src/albums/domain/repositories/album_repository.dart';

class UpdateAlbum extends UsecaseWithParams<void, UpdateAlbumParams> {
  final AlbumRepository repository;

  UpdateAlbum({required this.repository});

  @override
  ResultFuture<void> call(UpdateAlbumParams params) async =>
      repository.updateAlum(id: params.id, album: params as Album);
}

class UpdateAlbumParams extends Equatable {
  final int id;
  final int userId;
  final String title;

  const UpdateAlbumParams(
      {required this.id, required this.userId, required this.title});

  @override
  List<Object?> get props => [userId, title];
}
