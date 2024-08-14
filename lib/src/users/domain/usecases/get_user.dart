import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/users/domain/entities/user.dart';
import 'package:posthub/src/users/domain/repositories/user_repository.dart';

class GetUser extends UsecaseWithParams<User, int> {
  final UserRepository repository;

  GetUser({required this.repository});
  @override
  ResultFuture<User> call(int params) async => repository.getUser(id: params);
}
