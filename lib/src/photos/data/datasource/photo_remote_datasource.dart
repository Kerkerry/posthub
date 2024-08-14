import 'package:posthub/src/photos/domain/entities/photo.dart';

abstract class PhotoRemoteDatasource {
  const PhotoRemoteDatasource();
  Future createPhoto(
      {required int albumId,
      required String title,
      required String url,
      required String thumbnailUrl});
  Future updatePhoto({required int id, required Photo photo});

  Future deletePhoto({required int id});

  Future<Photo> getPhoto({required int id});
  Future<List<Photo>> getAlbumPhotos({required int albumId});
  Future<List<Photo>> getPhotos();
}
