import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/albums/domain/entities/album.dart';
import 'package:posthub/src/albums/domain/repositories/album_repository.dart';

class GetUserAlbums extends UsecaseWithParams<List<Album>, int> {
  final AlbumRepository repository;

  GetUserAlbums({required this.repository});

  @override
  ResultFuture<List<Album>> call(int params) async =>
      repository.getUserAlbums(userId: params);
}
