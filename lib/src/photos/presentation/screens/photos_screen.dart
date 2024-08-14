import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posthub/src/photos/presentation/bloc/photo_bloc.dart';
import 'package:posthub/src/photos/presentation/widgets/error_card.dart';
import 'package:posthub/src/photos/presentation/widgets/photo_card.dart';
import 'package:posthub/src/users/presentation/widgets/loading_column.dart';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({super.key});

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  void getPhotos() {
    context.read<PhotoBloc>().add(const GetPhotosEvent());
  }

  @override
  void initState() {
    getPhotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("All photos"),
        ),
        body: BlocBuilder<PhotoBloc, PhotoState>(
          builder: (context, state) {
            if (state is PhotoErrorState) {
              return ErrorCard(error: state.message);
            }
            if (state is GettingPhotosState) {
              return const LoadingColumn(message: "Fetching photos");
            }

            if (state is PhotosLoadedState) {
              final photos = state.photos;
              return ListView.builder(
                  itemCount: photos.length,
                  itemBuilder: (context, index) {
                    final photo = photos[index];
                    return PhotoCard(photo: photo);
                  });
            }

            return const SizedBox.shrink();
          },
        ));
  }
}
