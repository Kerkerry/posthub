import 'dart:convert';
import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/src/users/domain/entities/geo_location.dart';

class GeoLocationModel extends GeoLocation {
  GeoLocationModel({required super.lat, required super.lng});

  GeoLocationModel.fromMap(DataMap map)
      : this(lat: map['lat'], lng: map['lng']);
  factory GeoLocationModel.fromJson(String json) =>
      GeoLocationModel.fromMap(jsonDecode(json) as DataMap);

  GeoLocationModel copyWith({String? lat, String? lng}) {
    return GeoLocationModel(lat: lat ?? this.lat, lng: lng ?? this.lng);
  }

  DataMap toMap() {
    return {'lat': lat, 'lng': lng};
  }

  String toJson() => jsonEncode(toJson());
}
