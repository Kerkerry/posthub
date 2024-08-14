import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/albums/domain/entities/album.dart';
import 'package:posthub/src/albums/domain/repositories/album_repository.dart';

class GetAlbum extends UsecaseWithParams<Album, int> {
  final AlbumRepository repository;

  GetAlbum({required this.repository});

  @override
  ResultFuture<Album> call(int params) async => repository.getAlbum(id: params);
}
