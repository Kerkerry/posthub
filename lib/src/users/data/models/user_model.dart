import 'dart:convert';
import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/src/users/data/models/address_model.dart';
import 'package:posthub/src/users/data/models/company_model.dart';
import 'package:posthub/src/users/domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required super.id,
      required super.name,
      required super.username,
      required super.email,
      required super.address,
      required super.phone,
      required super.website,
      required super.company});

  UserModel.fromMap(DataMap map)
      : this(
            id: map['id'],
            name: map['name'],
            username: map['username'],
            email: map['email'],
            address: AddressModel.fromMap(map['address']),
            phone: map['phone'],
            website: map['website'],
            company: CompanyModel.fromMap(map['company']));

  factory UserModel.fromJson(String json) =>
      UserModel.fromMap(jsonDecode(json) as DataMap);

  UserModel copyWith(
      {int? id,
      String? name,
      String? username,
      String? email,
      AddressModel? address,
      String? phone,
      String? website,
      CompanyModel? company}) {
    return UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        username: username ?? this.username,
        email: email ?? this.email,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        website: website ?? this.website,
        company: company ?? this.company);
  }

  DataMap toMap() {
    return {
      'name': name,
      'username': username,
      'email': email,
      'address': address.toMap(),
      'phone': phone,
      'website': website,
      'company': company.toMap()
    };
  }

  String toJson() => jsonEncode(toMap());
}
