import 'dart:convert';

import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/src/posts/domain/entities/post.dart';

class PostModel extends Post {
  const PostModel(
      {required super.userId,
      required super.id,
      required super.title,
      required super.body});
  PostModel.fromMap(DataMap map)
      : this(
            id: map['id'],
            userId: map['userId'],
            title: map['title'],
            body: map['body']);
  factory PostModel.fromJson(String postJson) =>
      PostModel.fromMap(jsonDecode(postJson) as DataMap);

  PostModel copyWith({int? id, int? userId, String? title, String? body}) {
    return PostModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body);
  }

  DataMap toMap() {
    return {'id': id, 'userId': userId, 'title': title, 'body': body};
  }

  String toJson() => jsonEncode(toMap());
}
