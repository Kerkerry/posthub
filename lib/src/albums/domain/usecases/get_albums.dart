import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/albums/domain/entities/album.dart';
import 'package:posthub/src/albums/domain/repositories/album_repository.dart';

class GetAlbums extends UsecaseWithoutParams<List<Album>> {
  final AlbumRepository repository;

  GetAlbums({required this.repository});

  @override
  ResultFuture<List<Album>> call() async => repository.getAlbums();
}
