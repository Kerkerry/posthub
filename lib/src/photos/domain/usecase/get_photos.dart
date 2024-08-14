import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/photos/domain/entities/photo.dart';
import 'package:posthub/src/photos/domain/repositories/photo_repository.dart';

class GetPhotos extends UsecaseWithoutParams<List<Photo>> {
  final PhotoRepository repository;

  GetPhotos({required this.repository});

  @override
  ResultFuture<List<Photo>> call() async => repository.getPhotos();
}
