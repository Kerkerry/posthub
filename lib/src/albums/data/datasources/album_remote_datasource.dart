import 'package:posthub/src/albums/domain/entities/album.dart';

abstract class AlbumRemoteDatasource {
  const AlbumRemoteDatasource();
  Future createAlbum({
    required int userId,
    required String title,
  });

  Future updateAlum({required int id, required Album album});

  Future deletAlbum({required int id});

  Future<List<Album>> getAlbums();

  Future<Album> getAlbum({required int id});

  Future<List<Album>> getUserAlbums({required int userId});
}
