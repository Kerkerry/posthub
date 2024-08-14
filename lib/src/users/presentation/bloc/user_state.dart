part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

class AuthenticatingUser extends UserState {
  const AuthenticatingUser();
}

class UserAuthenticated extends UserState {
  const UserAuthenticated();
}

class CreatingUserState extends UserState {
  const CreatingUserState();
}

class UserCreatedState extends UserState {
  const UserCreatedState();
}

class LoadingUsersState extends UserState {
  const LoadingUsersState();
}

class UsersLoadedState extends UserState {
  final List<User> users;
  const UsersLoadedState(this.users);

  @override
  List<Object> get props => users.map((user) => user.id).toList();
}

class LoadingUserState extends UserState {
  const LoadingUserState();
}

class UserLoadedState extends UserState {
  final User user;
  const UserLoadedState(this.user);

  @override
  List<Object> get props => [user.address, user.email, user.id];
}

class DeletingUserState extends UserState {
  const DeletingUserState();
}

class UserDeletedState extends UserState {
  const UserDeletedState();
}

class UpdatingUserState extends UserState {
  const UpdatingUserState();
}

class UserUpdatedState extends UserState {
  const UserUpdatedState();
}

class UserErrorState extends UserState {
  final String message;
  const UserErrorState(this.message);
  @override
  List<Object> get props => [message];
}
