import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/photos/domain/entities/photo.dart';
import 'package:posthub/src/photos/domain/repositories/photo_repository.dart';

class GetAlbumPhotos extends UsecaseWithParams<List<Photo>, int> {
  final PhotoRepository repository;

  GetAlbumPhotos({required this.repository});

  @override
  ResultFuture<List<Photo>> call(int params) async =>
      repository.getAlbumPhotos(albumId: params);
}
