import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posthub/src/albums/presentation/bloc/album_bloc.dart';
import 'package:posthub/src/albums/presentation/widgets/album_card.dart';
import 'package:posthub/src/users/domain/entities/user.dart';
import 'package:posthub/src/users/presentation/widgets/loading_column.dart';

class UserAlbumsScreen extends StatefulWidget {
  const UserAlbumsScreen({super.key, required this.user});
  final User user;

  @override
  State<UserAlbumsScreen> createState() => _UserAlbumsScreenState();
}

class _UserAlbumsScreenState extends State<UserAlbumsScreen> {
  void getUserAlbums() {
    context.read<AlbumBloc>().add(GetUserAlbumsEvent(userId: widget.user.id));
  }

  @override
  void initState() {
    getUserAlbums();
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
          if (state is GettingUserAlbumsState) {
            return const LoadingColumn(message: "Fetching albums");
          }
          if (state is UserAlbumsLoadedState) {
            final albums = state.albums;
            return ListView.builder(
              itemCount: albums.length,
              itemBuilder: (context, index) {
                final album = albums[index];
                return AlbumCard(
                  widget.user,
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
