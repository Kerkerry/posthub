import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/photos/domain/repositories/photo_repository.dart';

class DeletePhoto extends UsecaseWithParams<void, int> {
  final PhotoRepository repository;

  DeletePhoto({required this.repository});

  @override
  ResultFuture<void> call(int params) async =>
      repository.deletePhoto(id: params);
}
