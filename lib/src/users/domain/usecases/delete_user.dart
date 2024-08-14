import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/users/domain/repositories/user_repository.dart';

class DeleteUser extends UsecaseWithParams<void, int> {
  final UserRepository repository;

  const DeleteUser({required this.repository});

  @override
  ResultFuture<void> call(int params) async =>
      repository.deleteUser(id: params);
}
