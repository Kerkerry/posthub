import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/users/domain/entities/user.dart';
import 'package:posthub/src/users/domain/repositories/user_repository.dart';

class GetUsers extends UsecaseWithoutParams<List<User>> {
  final UserRepository repository;

  GetUsers({required this.repository});

  @override
  ResultFuture<List<User>> call() async => repository.getUsers();
}
