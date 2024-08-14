import 'dart:convert';

import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/src/todos/domain/entities/todo.dart';

class TodoModel extends Todo {
  const TodoModel(
      {required super.id,
      required super.userId,
      required super.title,
      required super.completed});
  TodoModel.fromMap(DataMap map)
      : this(
            id: map['id'],
            userId: map['userId'],
            title: map['title'],
            completed: map['completed']);
  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(jsonDecode(source) as DataMap);

  TodoModel copyWith({int? id, int? userId, String? title, bool? compeleted}) {
    return TodoModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        completed: completed);
  }

  DataMap toMap() {
    return {'id': id, 'userId': userId, 'title': title, 'completed': completed};
  }

  String toJson() => jsonEncode(toMap());

  const TodoModel.empty()
      : this(
            id: 1000,
            userId: 5,
            title: 'Empty todo describing empty',
            completed: false);
}
