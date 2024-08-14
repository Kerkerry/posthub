import 'package:flutter/material.dart';

class DrawerListItem extends StatelessWidget {
  const DrawerListItem(
      {super.key,
      required this.listTileOntap,
      required this.listTitle,
      required this.listTileIcon});
  final VoidCallback listTileOntap;
  final String listTitle;
  final IconData listTileIcon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: listTileOntap,
      leading: Icon(listTileIcon),
      title: Text(
        listTitle,
        style: const TextStyle(
            fontSize: 18, letterSpacing: 2, fontWeight: FontWeight.w500),
      ),
    );
  }
}
