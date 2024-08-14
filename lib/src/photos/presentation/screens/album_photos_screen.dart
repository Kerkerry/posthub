import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posthub/src/albums/presentation/bloc/album_bloc.dart';
import 'package:posthub/src/photos/presentation/bloc/photo_bloc.dart';
import 'package:posthub/src/photos/presentation/widgets/album_photo_card.dart';
import 'package:posthub/src/photos/presentation/widgets/error_card.dart';
import 'package:posthub/src/users/presentation/widgets/loading_column.dart';

class AlbumPhotosScreen extends StatefulWidget {
  const AlbumPhotosScreen({super.key, required this.albumId});
  final int albumId;

  @override
  State<AlbumPhotosScreen> createState() => _AlbumPhotosScreenState();
}

class _AlbumPhotosScreenState extends State<AlbumPhotosScreen> {
  void getAlbumPhotos() {
    context.read<PhotoBloc>().add(GetAlbumPhotosEvent(albumId: widget.albumId));
  }

  void getAlbum() {
    context.read<AlbumBloc>().add(GetAlbumEvent(id: widget.albumId));
  }

  @override
  void initState() {
    getAlbum();
    getAlbumPhotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<PhotoBloc, PhotoState>(
        builder: (context, state) {
          if (state is PhotoErrorState) {
            return ErrorCard(error: state.message);
          }
          if (state is GettingAlbumPhotosState) {
            return const LoadingColumn(message: 'Fetching photos...');
          }
          if (state is AlbumPhotosLoadedState) {
            final photos = state.photos;
            return ListView.builder(
                itemCount: state.photos.length,
                itemBuilder: (context, index) {
                  return BlocBuilder<AlbumBloc, AlbumState>(
                      builder: (context, state) {
                    if (state is AlbumLoadedState) {
                      final album = state.album;
                      return AlbumPhotoCard(photo: photos[index], album: album);
                    }
                    return const SizedBox.shrink();
                  });
                });
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
