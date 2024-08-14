part of 'photo_bloc.dart';

sealed class PhotoEvent extends Equatable {
  const PhotoEvent();

  @override
  List<Object> get props => [];
}

class CreatePhotoEvent extends PhotoEvent {
  final int albumId;
  final String title;
  final String url;
  final String thumbnailUrl;

  const CreatePhotoEvent(
      {required this.albumId,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

  @override
  List<Object> get props => [albumId, title, url, thumbnailUrl];
}

class UpdatePhotoEvent extends PhotoEvent {
  final int photoId;
  final Photo photo;

  const UpdatePhotoEvent({required this.photoId, required this.photo});
  @override
  List<Object> get props => [photo.id, photoId];
}

class DeletePhotoEvent extends PhotoEvent {
  final int id;

  const DeletePhotoEvent({required this.id});
}

class GetPhotoEvent extends PhotoEvent {
  final int id;
  const GetPhotoEvent({required this.id});
}

class GetAlbumPhotosEvent extends PhotoEvent {
  final int albumId;
  const GetAlbumPhotosEvent({required this.albumId});
}

class GetPhotosEvent extends PhotoEvent {
  const GetPhotosEvent();
}
