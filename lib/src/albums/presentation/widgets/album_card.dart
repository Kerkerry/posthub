import 'package:flutter/material.dart';
import 'package:posthub/core/router/routing_constants.dart';
import 'package:posthub/src/albums/domain/entities/album.dart';
import 'package:posthub/src/users/domain/entities/user.dart';

class AlbumCard extends StatelessWidget {
  const AlbumCard(this.user, {super.key, required this.album});
  final Album album;
  final User? user;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, albumPhotosScreen, arguments: album.id);
        },
        title: user == null ? const SizedBox.shrink() : Text(user!.name),
        subtitle: Text(album.title),
      ),
    );
  }
}

// https://seller.walmart.com/home
// https://advertising.walmart.com/sp/view/allcampaigns
// https://www.canva.com/design/DAGMDLUAiPQ/6gr_nnLSyZELM_Dn_1UG4A/edit?ui=eyJBIjp7IkIiOnsiQiI6dHJ1ZX19fQ
