part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class AuthenticateUserEvent extends UserEvent {
  final String email;
  final String username;

  const AuthenticateUserEvent({required this.email, required this.username});

  @override
  List<Object> get props => [email, username];
}

class GetUsersEvent extends UserEvent {
  const GetUsersEvent();
}

class GetUserEvent extends UserEvent {
  final int id;
  const GetUserEvent({required this.id});
}

class DeleteUserEvent extends UserEvent {
  final int id;
  const DeleteUserEvent({required this.id});
}

class UpdateUserEvent extends UserEvent {
  final int id;
  final UserModel user;
  const UpdateUserEvent({required this.id, required this.user});
}

class CreateUserEvent extends UserEvent {
  final String name;
  final String username;
  final String email;
  final DataMap address;
  final String phone;
  final String website;
  final DataMap company;
  const CreateUserEvent(
      {required this.name,
      required this.username,
      required this.email,
      required this.address,
      required this.phone,
      required this.website,
      required this.company});
}
