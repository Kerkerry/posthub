import 'package:flutter/cupertino.dart';

class LoadingColumn extends StatelessWidget {
  const LoadingColumn({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CupertinoActivityIndicator(),
          const SizedBox(
            height: 10,
          ),
          Text(message)
        ],
      ),
    );
  }
}
