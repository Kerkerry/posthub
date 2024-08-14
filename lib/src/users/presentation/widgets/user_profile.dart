import 'package:flutter/material.dart';
import 'package:posthub/core/router/routing_constants.dart';
import 'package:posthub/src/users/domain/entities/user.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key, required this.user, required this.size});

  final User user;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Row(children: [
            SizedBox(
              width: size.width * 0.6,
              height: size.width * 0.5,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
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
                  ],
                ),
              ),
            ),
          ]),
        ),
        const SizedBox(
          height: 10,
        ),
        Card(
          child: Row(
            children: [
              SizedBox(
                width: size.width * 0.7,
                height: size.width * 0.5,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Company Details",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Name: ${user.company.name}",
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Catch Phrase: ${user.company.catchPhrase}",
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Business: ${user.company.bs}",
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.4,
                    height: size.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Address Details",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                          const SizedBox(
                            height: 7,
                          ),
                          Text("Street: ${user.address.street}",
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)),
                          const SizedBox(
                            height: 7,
                          ),
                          Text("Suite: ${user.address.suite}",
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)),
                          const SizedBox(
                            height: 7,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: size.width * 0.4,
                    height: size.width * 0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("City: ${user.address.city}",
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)),
                        const SizedBox(
                          height: 7,
                        ),
                        Text("Zipcode: ${user.address.zipcode}",
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)),
                        const SizedBox(
                          height: 7,
                        ),
                        const Text("Geolocation Details",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                        const SizedBox(
                          height: 7,
                        ),
                        Text("Longtude: ${user.address.geo.lng}",
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)),
                        Text("Latitude: ${user.address.geo.lat}",
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: size.width * 0.8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          style: const ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                  BeveledRectangleBorder()),
                              backgroundColor: WidgetStatePropertyAll(
                                  Color.fromARGB(255, 5, 223, 223))),
                          onPressed: () {
                            Navigator.pushNamed(context, userAlbumsScreen,
                                arguments: user);
                          },
                          child: const Text(
                            "View Album",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )),
                      ElevatedButton(
                          style: const ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                  ContinuousRectangleBorder()),
                              backgroundColor: WidgetStatePropertyAll(
                                  Color.fromARGB(255, 5, 223, 223))),
                          onPressed: () {
// Navigating to all posts screen
                            Navigator.pushNamed(context, userPostsScreen,
                                arguments: user);
                          },
                          child: const Text("View Posts",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)))
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
