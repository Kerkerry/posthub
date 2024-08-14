import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/src/users/data/models/user_model.dart';

abstract class UserRemoteDatasource {
  const UserRemoteDatasource();

  Future createuser(
      {required String name,
      required String username,
      required String email,
      required DataMap address,
      required String phone,
      required String website,
      required DataMap company});
  Future<List<UserModel>> getUsers();

  Future updateUser({required int id, required UserModel user});

  Future deleteUser({required int id});

  Future<UserModel> getUser({required id});
  Future getUserByEmail({required String email});
}
