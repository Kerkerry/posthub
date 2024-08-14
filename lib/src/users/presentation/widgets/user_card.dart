import 'package:flutter/material.dart';
import 'package:posthub/core/router/routing_constants.dart';
import 'package:posthub/src/users/domain/entities/user.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});

  final User user;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: InkWell(
        onTap: () {
          Navigator.popAndPushNamed(context, userDetailScreen,
              arguments: user.id);
        },
        child: Row(children: [
          SizedBox(
            width: size.width * 0.5,
            height: size.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name: ${user.name}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  "Username: ${user.username}",
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  "Email: ${user.email}",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  "Phone: ${user.phone}",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  "Website: ${user.website}",
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w200,
                      color: Color.fromARGB(255, 5, 8, 231)),
                ),
                const SizedBox(
                  height: 7,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
