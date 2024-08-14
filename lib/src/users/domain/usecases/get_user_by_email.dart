import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/users/domain/entities/user.dart';
import 'package:posthub/src/users/domain/repositories/user_repository.dart';

class GetUserByEmail extends UsecaseWithParams<User, String> {
  final UserRepository _repository;

  GetUserByEmail({required UserRepository repository})
      : _repository = repository;

  @override
  ResultFuture<User> call(String params) async =>
      _repository.getUserByEmail(email: params);
}
