import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posthub/src/albums/presentation/bloc/album_bloc.dart';
import 'package:posthub/src/albums/presentation/widgets/album_card.dart';
import 'package:posthub/src/users/presentation/widgets/loading_column.dart';

class AlbumsScreens extends StatefulWidget {
  const AlbumsScreens({super.key});

  @override
  State<AlbumsScreens> createState() => _AlbumsScreensState();
}

class _AlbumsScreensState extends State<AlbumsScreens> {
  void getAlbums() {
    context.read<AlbumBloc>().add(const GetAlbumsEvent());
  }

  @override
  void initState() {
    getAlbums();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          if (state is AlbumErrorState) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is GettingAlbumsState) {
            return const LoadingColumn(message: "Fetching albums");
          }
          if (state is AlbumsLoadedState) {
            final albums = state.albums;
            return ListView.builder(
              itemCount: albums.length,
              itemBuilder: (context, index) {
                final album = albums[index];
                return AlbumCard(
                  null,
                  album: album,
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
