import 'dart:convert';
import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/src/users/data/models/geo_location_model.dart';
import 'package:posthub/src/users/domain/entities/address.dart';

class AddressModel extends Address {
  AddressModel(
      {required super.street,
      required super.city,
      required super.suite,
      required super.zipcode,
      required super.geo});
  AddressModel.fromMap(DataMap map)
      : this(
            geo: GeoLocationModel.fromMap(map['geo']),
            city: map['city'],
            street: map['street'],
            suite: map['suite'],
            zipcode: map['zipcode']);
  factory AddressModel.fromJson(String json) =>
      AddressModel.fromMap(jsonDecode(json) as DataMap);

  AddressModel copyWith(
      {String? street,
      String? city,
      String? suite,
      String? zipcode,
      GeoLocationModel? geo}) {
    return AddressModel(
        street: street ?? this.street,
        city: city ?? this.city,
        suite: suite ?? this.suite,
        zipcode: zipcode ?? this.zipcode,
        geo: geo ?? this.geo);
  }

  DataMap toMap() {
    return {
      'street': street,
      'city': city,
      'suite': suite,
      'zipcode': zipcode,
      'geo': geo.toMap()
    };
  }

  String toJson() => jsonEncode(toJson());
}
