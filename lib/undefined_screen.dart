import 'package:flutter/material.dart';

class UndefinedScreen extends StatelessWidget {
  const UndefinedScreen({super.key, required this.name});
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Route for $name is not defined'),
      ),
    );
  }
}
