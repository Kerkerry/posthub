import 'package:equatable/equatable.dart';
import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/users/data/models/address_model.dart';
import 'package:posthub/src/users/data/models/company_model.dart';
import 'package:posthub/src/users/data/models/geo_location_model.dart';
import 'package:posthub/src/users/domain/repositories/user_repository.dart';

class CreateUser extends UsecaseWithParams<void, UserParams> {
  const CreateUser({required this.repository});
  final UserRepository repository;

  @override
  ResultFuture<void> call(UserParams params) async => repository.createUser(
      name: params.name,
      username: params.username,
      email: params.email,
      address: params.address,
      phone: params.phone,
      website: params.website,
      company: params.company);
}

class UserParams extends Equatable {
  final String name;
  final String username;
  final String email;
  final DataMap address;
  final String phone;
  final String website;
  final DataMap company;

  const UserParams(
      {required this.name,
      required this.username,
      required this.email,
      required this.address,
      required this.phone,
      required this.website,
      required this.company});
  @override
  List<Object?> get props => [name, username, email, phone, website];

  UserParams.empty()
      : this(
            name: 'name',
            username: 'username',
            email: 'email@example.com',
            address: AddressModel(
                    street: 'street',
                    city: 'city',
                    suite: 'suite',
                    zipcode: '0000',
                    geo: GeoLocationModel(lat: '0.00', lng: '0.00'))
                .toMap(),
            company: CompanyModel(
                    name: 'companyname', catchPhrase: 'catchPhrase', bs: 'bs')
                .toMap(),
            phone: '000-000-00-00',
            website: 'website.com');
}
