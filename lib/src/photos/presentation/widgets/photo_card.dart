import 'package:flutter/material.dart';
import 'package:posthub/src/photos/domain/entities/photo.dart';

class PhotoCard extends StatelessWidget {
  const PhotoCard({super.key, required this.photo});
  final Photo photo;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Card(
        margin: const EdgeInsets.all(15),
        child: ListTile(
          leading: Container(
            width: s.width * 0.2,
            height: s.width * 0.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(photo.thumbnailUrl),
                    fit: BoxFit.cover)),
          ),
          title: Text(
            photo.title,
            style:
                TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.7)),
          ),
        ));
  }
}
