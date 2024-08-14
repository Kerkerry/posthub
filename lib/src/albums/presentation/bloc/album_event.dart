part of 'album_bloc.dart';

sealed class AlbumEvent extends Equatable {
  const AlbumEvent();

  @override
  List<Object> get props => [];
}

class CreateAlbumEvent extends AlbumEvent {
  final int userId;
  final String title;

  const CreateAlbumEvent({required this.userId, required this.title});

  @override
  List<Object> get props => [userId, title];
}

class UpdateAlbumEvent extends AlbumEvent {
  final Album album;

  const UpdateAlbumEvent({required this.album});
  @override
  List<Object> get props => [album.id];
}

class DeleteAlbumEvent extends AlbumEvent {
  final int id;

  const DeleteAlbumEvent({required this.id});
}

class GetAlbumEvent extends AlbumEvent {
  final int id;
  const GetAlbumEvent({required this.id});
}

class GetUserAlbumsEvent extends AlbumEvent {
  final int userId;
  const GetUserAlbumsEvent({required this.userId});
}

class GetAlbumsEvent extends AlbumEvent {
  const GetAlbumsEvent();
}
