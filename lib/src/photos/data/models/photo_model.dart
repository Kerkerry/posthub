import 'dart:convert';

import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/src/photos/domain/entities/photo.dart';

class PhotoModel extends Photo {
  const PhotoModel(
      {required super.id,
      required super.albumId,
      required super.title,
      required super.url,
      required super.thumbnailUrl});
  PhotoModel.fromMap(DataMap map)
      : this(
            id: map['id'],
            albumId: map['albumId'],
            title: map['title'],
            url: map['url'],
            thumbnailUrl: map['thumbnailUrl']);
  factory PhotoModel.fromJson(String source) =>
      PhotoModel.fromMap(jsonDecode(source) as DataMap);

  PhotoModel copyWith(
      {int? id,
      int? albumId,
      String? title,
      String? url,
      String? thumbnailUrl}) {
    return PhotoModel(
        id: id ?? this.id,
        albumId: albumId ?? this.albumId,
        title: title ?? this.title,
        url: url ?? this.url,
        thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl);
  }

  DataMap toMap() {
    return {
      'id': id,
      'albumId': albumId,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl
    };
  }

  String toJson() => jsonEncode(toMap());
}
