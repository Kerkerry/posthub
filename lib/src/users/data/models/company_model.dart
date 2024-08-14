import 'dart:convert';

import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/src/users/domain/entities/company.dart';

class CompanyModel extends Company {
  CompanyModel(
      {required super.name, required super.catchPhrase, required super.bs});

  CompanyModel.fromMap(DataMap map)
      : this(name: map['name'], catchPhrase: map['catchPhrase'], bs: map['bs']);

  factory CompanyModel.fromJson(String json) =>
      CompanyModel.fromMap(jsonDecode(json) as DataMap);

  CompanyModel copyWith({String? name, String? catchPhrase, String? bs}) {
    return CompanyModel(
        name: name ?? this.name,
        catchPhrase: catchPhrase ?? this.catchPhrase,
        bs: bs ?? this.bs);
  }

  DataMap toMap() {
    return {'name': name, 'catchPhrase': catchPhrase, 'bs': bs};
  }

  String toJson() => jsonEncode(toMap());
}
