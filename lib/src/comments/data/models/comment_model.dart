import 'dart:convert';

import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/src/comments/domain/entities/comment.dart';

class CommentModel extends Comment {
  const CommentModel(
      {required super.postId,
      required super.id,
      required super.name,
      required super.email,
      required super.body});

  CommentModel.fromMap(DataMap map)
      : this(
            id: map['id'],
            postId: map['postId'],
            name: map['name'],
            email: map['email'],
            body: map['body']);
  factory CommentModel.fromJson(String json) =>
      CommentModel.fromMap(jsonDecode(json) as DataMap);

  CommentModel copyWith(
      {int? id, int? postId, String? name, String? email, String? body}) {
    return CommentModel(
        postId: postId ?? this.postId,
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        body: body ?? this.body);
  }

  DataMap toMap() {
    return {
      'id': id,
      'postId': postId,
      'name': name,
      'email': email,
      'body': body
    };
  }

  String toJson() => jsonEncode(toMap());

  const CommentModel.empty()
      : this(
            postId: 70,
            name: 'Testing Name',
            email: 'testingemail@eample.com',
            body: 'example body for testing',
            id: 50);
}
