import 'package:posthub/src/users/data/models/address_model.dart';
import 'package:posthub/src/users/data/models/company_model.dart';
import 'package:posthub/src/users/data/models/geo_location_model.dart';

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final AddressModel address;
  final String phone;
  final String website;
  final CompanyModel company;

  User(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.address,
      required this.phone,
      required this.website,
      required this.company});

  User.empty()
      : this(
            id: 12,
            name: 'Empty User',
            username: 'EmptyUsername',
            email: 'emptyemail@example.com',
            address: AddressModel(
                street: 'empty street',
                city: 'empty city',
                suite: 'empty suite',
                zipcode: 'empty zipcode',
                geo: GeoLocationModel(
                    lat: 'empty latitute', lng: 'empty logitute')),
            phone: 'no phone',
            website: 'emptyweb.org.ke',
            company: CompanyModel(
                name: 'empty name',
                catchPhrase: 'empty catchPhrase',
                bs: 'empty bs'));
}
