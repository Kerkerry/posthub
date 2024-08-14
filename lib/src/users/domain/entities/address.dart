import 'package:posthub/src/users/data/models/geo_location_model.dart';

class Address {
  final String street;
  final String city;
  final String suite;
  final String zipcode;
  final GeoLocationModel geo;

  Address(
      {required this.street,
      required this.city,
      required this.suite,
      required this.zipcode,
      required this.geo});
}
