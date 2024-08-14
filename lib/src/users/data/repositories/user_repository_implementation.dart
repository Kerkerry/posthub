import 'package:dartz/dartz.dart';
import 'package:posthub/core/errors/exception.dart';
import 'package:posthub/core/errors/failure.dart';
import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/src/users/data/datasource/user_remote_datasource.dart';
import 'package:posthub/src/users/data/models/user_model.dart';
import 'package:posthub/src/users/domain/entities/user.dart';
import 'package:posthub/src/users/domain/repositories/user_repository.dart';

class UserRepositoryImplementation implements UserRepository {
  final UserRemoteDatasource remoteDatasource;
  UserRepositoryImplementation({required this.remoteDatasource});

  @override
  ResultVoid createUser(
      {required String name,
      required String username,
      required String email,
      required DataMap address,
      required String phone,
      required String website,
      required DataMap company}) async {
    try {
      await remoteDatasource.createuser(
          name: name,
          username: username,
          email: email,
          address: address,
          phone: phone,
          website: website,
          company: company);
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultVoid deleteUser({required int id}) async {
    try {
      await remoteDatasource.deleteUser(id: id);
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<User> getUser({required int id}) async {
    try {
      final result = await remoteDatasource.getUser(id: id);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<User>> getUsers() async {
    try {
      final result = await remoteDatasource.getUsers();
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultVoid updateUser({required int id, required UserModel user}) async {
    try {
      await remoteDatasource.updateUser(id: id, user: user);
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<User> getUserByEmail({required String email}) async {
    try {
      final result = await remoteDatasource.getUserByEmail(email: email);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
}
