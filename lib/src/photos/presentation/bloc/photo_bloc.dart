import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:posthub/core/helper/logger_helper.dart';
import 'package:posthub/src/photos/domain/entities/photo.dart';
import 'package:posthub/src/photos/domain/usecase/create_photo.dart';
import 'package:posthub/src/photos/domain/usecase/delete_photo.dart';
import 'package:posthub/src/photos/domain/usecase/get_album_photos.dart';
import 'package:posthub/src/photos/domain/usecase/get_photo.dart';
import 'package:posthub/src/photos/domain/usecase/get_photos.dart';
import 'package:posthub/src/photos/domain/usecase/update_photo.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final CreatePhoto _createPhoto;
  final UpdatePhoto _updatePhoto;
  final DeletePhoto _deletePhoto;
  final GetPhoto _getPhoto;
  final GetPhotos _getPhotos;
  final GetAlbumPhotos _getAlbumPhotos;

  PhotoBloc(
      {required CreatePhoto createPhoto,
      required UpdatePhoto updatePhoto,
      required DeletePhoto deletePhoto,
      required GetPhoto getPhoto,
      required GetPhotos getPhotos,
      required GetAlbumPhotos getAlbumPhotos})
      : _createPhoto = createPhoto,
        _updatePhoto = updatePhoto,
        _deletePhoto = deletePhoto,
        _getPhoto = getPhoto,
        _getPhotos = getPhotos,
        _getAlbumPhotos = getAlbumPhotos,
        super(PhotoInitial()) {
    on<GetPhotosEvent>(_getPhotosHandler);
    on<GetPhotoEvent>(_getPhotoHandler);
    on<CreatePhotoEvent>(_createPhotoHandler);
    on<UpdatePhotoEvent>(_updatePhotoHandler);
    on<DeletePhotoEvent>(_deletePhotoHandler);
    on<GetAlbumPhotosEvent>(_getAlbumPhotosHandler);
  }

  FutureOr<void> _getPhotosHandler(
      GetPhotosEvent event, Emitter<PhotoState> emit) async {
    emit(const GettingPhotosState());
    final result = await _getPhotos();
    result.fold((failure) => emit(PhotoErrorState(failure.message)),
        (photos) => emit(PhotosLoadedState(photos: photos)));
  }

  FutureOr<void> _getPhotoHandler(
      GetPhotoEvent event, Emitter<PhotoState> emit) async {
    emit(const GettingPhotoState());
    final result = await _getPhoto(event.id);
    result.fold((failure) => emit(PhotoErrorState(failure.message)),
        (photo) => emit(PhotoLoadedState(photo: photo)));
  }

  FutureOr<void> _createPhotoHandler(
      CreatePhotoEvent event, Emitter<PhotoState> emit) async {
    emit(const CreatingPhotoState());
    final result = await _createPhoto(CreatePhotoParams(
      albumId: event.albumId,
      title: event.title,
      url: event.url,
      thumbnailUrl: event.thumbnailUrl,
    ));
    result.fold((failure) => emit(PhotoErrorState(failure.message)),
        (_) => emit(const PhotoCreateState()));
  }

  FutureOr<void> _updatePhotoHandler(
      UpdatePhotoEvent event, Emitter<PhotoState> emit) async {
    emit(const UpdatingPhotoState());
    final result = await _updatePhoto(
        UpdatePhotoParams(photoId: event.photoId, photo: event.photo));

    result.fold((failure) => emit(PhotoErrorState(failure.message)),
        (_) => emit(const PhotoUpdatedState()));
  }

  FutureOr<void> _deletePhotoHandler(
      DeletePhotoEvent event, Emitter<PhotoState> emit) async {
    emit(const DeletingPhotoState());
    final result = await _deletePhoto(event.id);
    result.fold((failure) => emit(PhotoErrorState(failure.message)),
        (_) => const PhotoDeletedState());
  }

  FutureOr<void> _getAlbumPhotosHandler(
      GetAlbumPhotosEvent event, Emitter<PhotoState> emit) async {
    emit(const GettingAlbumPhotosState());
    final result = await _getAlbumPhotos(event.albumId);
    result.fold((failure) => emit(PhotoErrorState(failure.message)), (photos) {
      logger.e(photos.length);
      emit(AlbumPhotosLoadedState(photos: photos));
    });
  }
}
