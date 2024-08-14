import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/users/data/models/user_model.dart';
import 'package:posthub/src/users/domain/repositories/user_repository.dart';

class UpdateUser extends UsecaseWithParams<void, UserModel> {
  final UserRepository repository;

  UpdateUser({required this.repository});

  @override
  ResultFuture<void> call(UserModel params) async =>
      repository.updateUser(id: params.id, user: params);
}
