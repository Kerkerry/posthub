import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:posthub/core/helper/logger_helper.dart';
import 'package:posthub/src/albums/domain/entities/album.dart';
import 'package:posthub/src/albums/domain/usecases/create_album.dart';
import 'package:posthub/src/albums/domain/usecases/delete_album.dart';
import 'package:posthub/src/albums/domain/usecases/get_album.dart';
import 'package:posthub/src/albums/domain/usecases/get_albums.dart';
import 'package:posthub/src/albums/domain/usecases/get_user_albums.dart';
import 'package:posthub/src/albums/domain/usecases/update_album.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final CreateAlbum _createAlbum;
  final DeleteAlbum _deleteAlbum;
  final GetAlbum _getAlbum;
  final GetAlbums _getAlbums;
  final GetUserAlbums _getUserAlbums;
  final UpdateAlbum _updateAlbum;

  AlbumBloc(
      {required CreateAlbum createAlbum,
      required DeleteAlbum deleteAlbum,
      required GetAlbum getAlbum,
      required GetAlbums getAlbums,
      required GetUserAlbums getUserAlbums,
      required UpdateAlbum updateAlbum})
      : _createAlbum = createAlbum,
        _deleteAlbum = deleteAlbum,
        _getAlbum = getAlbum,
        _getAlbums = getAlbums,
        _getUserAlbums = getUserAlbums,
        _updateAlbum = updateAlbum,
        super(AlbumInitial()) {
    on<CreateAlbumEvent>(_createAlbumHandler);
    on<DeleteAlbumEvent>(_deleteAlbumHandler);
    on<GetAlbumEvent>(_getAlbumHandler);
    on<GetAlbumsEvent>(_getAlbumsHandler);
    on<GetUserAlbumsEvent>(_getUserAlbumsHandler);
    on<UpdateAlbumEvent>(_updateAlbumHandler);
  }

  FutureOr<void> _createAlbumHandler(
      CreateAlbumEvent event, Emitter<AlbumState> emit) async {
    emit(const CreatingAlbumState());
    final result = await _createAlbum(
        AlbumParams(userId: event.userId, title: event.title));
    result.fold((failure) => emit(AlbumErrorState(failure.message)),
        (_) => emit(const AlbumCreateState()));
  }

  FutureOr<void> _deleteAlbumHandler(
      DeleteAlbumEvent event, Emitter<AlbumState> emit) async {
    emit(const DeletingAlbumState());
    final result = await _deleteAlbum(event.id);
    result.fold((failure) => emit(AlbumErrorState(failure.message)),
        (_) => emit(const AlbumDeletedState()));
  }

  FutureOr<void> _getAlbumHandler(
      GetAlbumEvent event, Emitter<AlbumState> emit) async {
    emit(const GettingAlbumState());
    final result = await _getAlbum(event.id);
    result.fold((failure) => emit(AlbumErrorState(failure.message)), (album) {
      logger.e(album);
      emit(AlbumLoadedState(album: album));
    });
  }

  FutureOr<void> _getAlbumsHandler(
      GetAlbumsEvent event, Emitter<AlbumState> emit) async {
    emit(const GettingAlbumsState());
    final result = await _getAlbums();
    result.fold((failure) => emit(AlbumErrorState(failure.message)), (albums) {
      logger.e(albums);
      emit(AlbumsLoadedState(albums: albums));
    });
  }

  FutureOr<void> _getUserAlbumsHandler(
      GetUserAlbumsEvent event, Emitter<AlbumState> emit) async {
    emit(const GettingUserAlbumsState());
    final result = await _getUserAlbums(event.userId);
    result.fold((failure) => emit(AlbumErrorState(failure.message)), (albums) {
      logger.e(albums);
      emit(UserAlbumsLoadedState(albums: albums));
    });
  }

  FutureOr<void> _updateAlbumHandler(
      UpdateAlbumEvent event, Emitter<AlbumState> emit) async {
    emit(const CreatingAlbumState());
    final result = await _updateAlbum(UpdateAlbumParams(
        id: event.album.id,
        userId: event.album.userId,
        title: event.album.title));
    result.fold((failure) => emit(AlbumErrorState(failure.message)),
        (_) => emit(const AlbumUpdatedState()));
  }
}
