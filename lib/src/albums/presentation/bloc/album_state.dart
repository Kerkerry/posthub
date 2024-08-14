part of 'album_bloc.dart';

sealed class AlbumState extends Equatable {
  const AlbumState();

  @override
  List<Object> get props => [];
}

final class AlbumInitial extends AlbumState {}

class CreatingAlbumState extends AlbumState {
  const CreatingAlbumState();
}

class AlbumCreateState extends AlbumState {
  const AlbumCreateState();
}

class DeletingAlbumState extends AlbumState {
  const DeletingAlbumState();
}

class AlbumDeletedState extends AlbumState {
  const AlbumDeletedState();
}

class GettingAlbumState extends AlbumState {
  const GettingAlbumState();
}

class AlbumLoadedState extends AlbumState {
  final Album album;

  const AlbumLoadedState({required this.album});
  @override
  List<Object> get props => [album.id];
}

class GettingAlbumsState extends AlbumState {
  const GettingAlbumsState();
}

class AlbumsLoadedState extends AlbumState {
  final List<Album> albums;

  const AlbumsLoadedState({required this.albums});
  @override
  List<Object> get props => albums.map((album) => album.id).toList();
}

class UpdatingAlbumState extends AlbumState {
  const UpdatingAlbumState();
}

class AlbumUpdatedState extends AlbumState {
  const AlbumUpdatedState();
}

class GettingUserAlbumsState extends AlbumState {
  const GettingUserAlbumsState();
}

class UserAlbumsLoadedState extends AlbumState {
  final List<Album> albums;
  const UserAlbumsLoadedState({required this.albums});

  @override
  List<Object> get props => albums.map((albums) => albums.id).toList();
}

class AlbumErrorState extends AlbumState {
  final String message;
  const AlbumErrorState(this.message);
}
