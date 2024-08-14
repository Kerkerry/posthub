import 'package:flutter/material.dart';
import 'package:posthub/core/router/routing_constants.dart';
import 'package:posthub/src/users/domain/entities/user.dart';
import 'package:posthub/src/users/presentation/widgets/drawer_list_item.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      width: size.width * 0.7,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                size: size.width * 0.3,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    user.email,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.7)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    user.username,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.7)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Divider(
              height: size.width * 0.07,
            ),
            DrawerListItem(
              listTileOntap: () {
                Navigator.pushNamed(context, homeScreen);
              },
              listTitle: "Home",
              listTileIcon: Icons.home,
            ),
            const Divider(),
            DrawerListItem(
              listTileOntap: () {
                Navigator.pushNamed(context, postsScreen);
              },
              listTitle: "Posts",
              listTileIcon: Icons.file_upload,
            ),
            const Divider(),
            DrawerListItem(
              listTileOntap: () {
                Navigator.pushNamed(context, commentsScreen);
              },
              listTitle: "Comments",
              listTileIcon: Icons.comment,
            ),
            const Divider(),
            DrawerListItem(
              listTileOntap: () {
                Navigator.pushNamed(context, albumsScreen);
              },
              listTitle: "Albums",
              listTileIcon: Icons.album,
            ),
            const Divider(),
            DrawerListItem(
              listTileOntap: () {
                Navigator.pushNamed(context, photosScreen);
              },
              listTitle: "Photos",
              listTileIcon: Icons.photo,
            ),
            const Divider(),
            DrawerListItem(
              listTileOntap: () {
                Navigator.pushNamed(context, todosScreen);
              },
              listTitle: "Todos",
              listTileIcon: Icons.task,
            ),
            const Divider(),
            DrawerListItem(
              listTileOntap: () {
                Navigator.pushNamed(context, completedTodosScreen);
              },
              listTitle: "Complete Todos",
              listTileIcon: Icons.check,
            ),
            const Divider(),
            DrawerListItem(
              listTileOntap: () {
                Navigator.pushNamed(context, inCompletedTodosScreen);
              },
              listTitle: "Incomplete Todos",
              listTileIcon: Icons.incomplete_circle,
            ),
          ],
        ),
      ),
    );
  }
}
