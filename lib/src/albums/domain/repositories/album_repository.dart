import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/src/albums/domain/entities/album.dart';

abstract class AlbumRepository {
  const AlbumRepository();
  ResultVoid createAlbum({
    required int userId,
    required String title,
  });

  ResultVoid updateAlum({required int id, required Album album});

  ResultVoid deletAlbum({required int id});

  ResultFuture<List<Album>> getAlbums();

  ResultFuture<Album> getAlbum({required int id});

  ResultFuture<List<Album>> getUserAlbums({required int userId});
}
