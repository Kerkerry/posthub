import 'package:flutter/material.dart';
import 'package:posthub/src/comments/domain/entities/comment.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({super.key, required this.comment});
  final Comment comment;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              comment.body,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    textAlign: TextAlign.end,
                    comment.name,
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
