import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/src/photos/domain/entities/photo.dart';

abstract class PhotoRepository {
  const PhotoRepository();

  ResultVoid createPhoto(
      {required int albumId,
      required String title,
      required String url,
      required String thumbnailUrl});
  ResultVoid updatePhoto({required int id, required Photo photo});

  ResultVoid deletePhoto({required int id});

  ResultFuture<Photo> getPhoto({required int id});
  ResultFuture<List<Photo>> getAlbumPhotos({required int albumId});
  ResultFuture<List<Photo>> getPhotos();
}
