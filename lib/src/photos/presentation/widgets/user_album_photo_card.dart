import 'package:flutter/material.dart';
import 'package:posthub/src/albums/domain/entities/album.dart';
import 'package:posthub/src/photos/domain/entities/photo.dart';
import 'package:posthub/src/users/domain/entities/user.dart';

class UserAlbumPhotoCard extends StatelessWidget {
  const UserAlbumPhotoCard(
      {super.key,
      required this.photo,
      required this.album,
      required this.user});
  final Photo photo;
  final Album album;
  final User user;
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
              photo.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            title: Column(
              children: [
                const Text(
                  "Album",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  album.title,
                  style: TextStyle(
                      fontSize: 17, color: Colors.black.withOpacity(0.7)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            title: Column(
              children: [
                const Text(
                  "User",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  user.name,
                  style: TextStyle(
                      fontSize: 17, color: Colors.black.withOpacity(0.7)),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  user.email,
                  style: TextStyle(
                      fontSize: 17, color: Colors.black.withOpacity(0.7)),
                ),
                Text(
                  user.phone,
                  style: TextStyle(
                      fontSize: 17, color: Colors.black.withOpacity(0.7)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
