import 'package:flutter/material.dart';
import 'package:posthub/src/albums/domain/entities/album.dart';
import 'package:posthub/src/photos/domain/entities/photo.dart';

class AlbumPhotoCard extends StatelessWidget {
  const AlbumPhotoCard({super.key, required this.photo, required this.album});
  final Photo photo;
  final Album album;
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Card(
      margin: const EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            width: s.width,
            height: s.height * 0.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: NetworkImage(photo.url))),
            child: Text(
              'Photo title: ${photo.title}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Album: ${album.title}',
                  style: TextStyle(
                      fontSize: 17, color: Colors.black.withOpacity(0.7)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
