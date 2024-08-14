import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/src/users/data/models/user_model.dart';
import 'package:posthub/src/users/domain/entities/user.dart';

abstract class UserRepository {
  const UserRepository();

  ResultVoid createUser(
      {required String name,
      required String username,
      required String email,
      required DataMap address,
      required String phone,
      required String website,
      required DataMap company});
  ResultVoid updateUser({required int id, required UserModel user});
  ResultVoid deleteUser({required int id});
  ResultFuture<List<User>> getUsers();
  ResultFuture<User> getUser({required int id});
  ResultFuture<User> getUserByEmail({required String email});
}
