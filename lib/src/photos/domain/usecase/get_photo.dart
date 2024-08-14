import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/photos/domain/entities/photo.dart';
import 'package:posthub/src/photos/domain/repositories/photo_repository.dart';

class GetPhoto extends UsecaseWithParams<Photo, int> {
  final PhotoRepository repository;

  GetPhoto({required this.repository});

  @override
  ResultFuture<Photo> call(int params) async => repository.getPhoto(id: params);
}
