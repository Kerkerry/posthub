import 'package:equatable/equatable.dart';
import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/photos/domain/repositories/photo_repository.dart';

class CreatePhoto extends UsecaseWithParams<void, CreatePhotoParams> {
  final PhotoRepository repository;

  CreatePhoto({required this.repository});

  @override
  ResultFuture<void> call(CreatePhotoParams params) async =>
      repository.createPhoto(
          albumId: params.albumId,
          title: params.title,
          url: params.url,
          thumbnailUrl: params.thumbnailUrl);
}

class CreatePhotoParams extends Equatable {
  final int albumId;
  final String title;
  final String url;
  final String thumbnailUrl;

  const CreatePhotoParams(
      {required this.albumId,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

  @override
  List<Object?> get props => [albumId, title, url, thumbnailUrl];
}
