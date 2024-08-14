import 'package:equatable/equatable.dart';
import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/albums/domain/repositories/album_repository.dart';

class CreateAlbum extends UsecaseWithParams<void, AlbumParams> {
  final AlbumRepository repository;

  CreateAlbum({required this.repository});
  @override
  ResultFuture<void> call(AlbumParams params) async =>
      repository.createAlbum(userId: params.userId, title: params.title);
}

class AlbumParams extends Equatable {
  final int userId;
  final String title;

  const AlbumParams({required this.userId, required this.title});

  @override
  List<Object?> get props => [userId, title];
}
