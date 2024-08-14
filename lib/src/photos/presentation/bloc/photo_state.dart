part of 'photo_bloc.dart';

sealed class PhotoState extends Equatable {
  const PhotoState();

  @override
  List<Object> get props => [];
}

final class PhotoInitial extends PhotoState {}

class CreatingPhotoState extends PhotoState {
  const CreatingPhotoState();
}

class PhotoCreateState extends PhotoState {
  const PhotoCreateState();
}

class DeletingPhotoState extends PhotoState {
  const DeletingPhotoState();
}

class PhotoDeletedState extends PhotoState {
  const PhotoDeletedState();
}

class GettingPhotoState extends PhotoState {
  const GettingPhotoState();
}

class PhotoLoadedState extends PhotoState {
  final Photo photo;

  const PhotoLoadedState({required this.photo});
  @override
  List<Object> get props => [photo.id];
}

class GettingPhotosState extends PhotoState {
  const GettingPhotosState();
}

class PhotosLoadedState extends PhotoState {
  final List<Photo> photos;

  const PhotosLoadedState({required this.photos});
  @override
  List<Object> get props => photos.map((photo) => photo.id).toList();
}

class UpdatingPhotoState extends PhotoState {
  const UpdatingPhotoState();
}

class PhotoUpdatedState extends PhotoState {
  const PhotoUpdatedState();
}

class GettingAlbumPhotosState extends PhotoState {
  const GettingAlbumPhotosState();
}

class AlbumPhotosLoadedState extends PhotoState {
  final List<Photo> photos;
  const AlbumPhotosLoadedState({required this.photos});

  @override
  List<Object> get props => photos.map((photo) => photo.id).toList();
}

class PhotoErrorState extends PhotoState {
  final String message;
  const PhotoErrorState(this.message);
}
