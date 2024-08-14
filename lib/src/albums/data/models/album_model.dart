import 'dart:convert';

import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/src/albums/domain/entities/album.dart';

class AlbumModel extends Album {
  const AlbumModel(
      {required super.id, required super.userId, required super.title});

  AlbumModel.fromMap(DataMap map)
      : this(id: map['id'], userId: map['userId'], title: map['title']);
  factory AlbumModel.fromJson(String source) =>
      AlbumModel.fromMap(jsonDecode(source) as DataMap);

  AlbumModel copyWith({int? id, int? userId, String? title}) {
    return AlbumModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        title: title ?? this.title);
  }

  DataMap toMap() {
    return {'id': id, 'userId': userId, 'title': title};
  }

  String toJson() => jsonEncode(toMap());
}
