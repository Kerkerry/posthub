import 'package:equatable/equatable.dart';
import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/photos/domain/entities/photo.dart';
import 'package:posthub/src/photos/domain/repositories/photo_repository.dart';

class UpdatePhoto extends UsecaseWithParams<void, UpdatePhotoParams> {
  final PhotoRepository repository;

  UpdatePhoto({required this.repository});
  @override
  ResultFuture<void> call(UpdatePhotoParams params) async =>
      repository.updatePhoto(id: params.photoId, photo: params.photo);
}

class UpdatePhotoParams extends Equatable {
  final int photoId;
  final Photo photo;

  const UpdatePhotoParams({required this.photoId, required this.photo});

  @override
  List<Object?> get props => [photoId, photo.id];
}
