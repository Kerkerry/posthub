import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:posthub/core/helper/logger_helper.dart';
import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/src/users/data/models/user_model.dart';
import 'package:posthub/src/users/domain/entities/user.dart';
import 'package:posthub/src/users/domain/usecases/create_user.dart';
import 'package:posthub/src/users/domain/usecases/delete_user.dart';
import 'package:posthub/src/users/domain/usecases/get_user.dart';
import 'package:posthub/src/users/domain/usecases/get_user_by_email.dart';
import 'package:posthub/src/users/domain/usecases/get_users.dart';
import 'package:posthub/src/users/domain/usecases/update_user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsers _getUsers;
  final GetUser _getUser;
  final GetUserByEmail _getUserByEmail;
  final CreateUser _createUser;
  final DeleteUser _deleteUser;
  final UpdateUser _updateUser;
  UserBloc(
      {required GetUsers getUsers,
      required GetUser getUser,
      required CreateUser createUser,
      required DeleteUser deleteUser,
      required UpdateUser updateUser,
      required GetUserByEmail getUserByEmail})
      : _getUsers = getUsers,
        _getUser = getUser,
        _createUser = createUser,
        _deleteUser = deleteUser,
        _updateUser = updateUser,
        _getUserByEmail = getUserByEmail,
        super(UserInitial()) {
    on<GetUsersEvent>(_getUsersHandler);
    on<GetUserEvent>(getUserHandler);
    on<CreateUserEvent>(_createUserHandler);
    on<DeleteUserEvent>(_deleteUserHandler);
    on<UpdateUserEvent>(_updateUserHandler);
    on<AuthenticateUserEvent>(_authenticateUserHandler);
  }

  FutureOr<void> _authenticateUserHandler(
      AuthenticateUserEvent event, Emitter<UserState> emit) async {
    emit(const AuthenticatingUser());
    final result = await _getUserByEmail(event.email);
    result.fold((failure) => emit(UserErrorState(failure.message)), (user) {
      if (user.username != event.username) {
        emit(const UserErrorState('Wrong username'));
        return;
      }
      emit(const UserAuthenticated());
    });
  }

  FutureOr<void> _getUsersHandler(
      GetUsersEvent event, Emitter<UserState> emit) async {
    emit(const LoadingUsersState());
    final result = await _getUsers();
    result.fold((failure) => emit(UserErrorState(failure.message)),
        (users) => emit(UsersLoadedState(users)));
  }

  FutureOr<void> getUserHandler(
      GetUserEvent event, Emitter<UserState> emit) async {
    emit(const LoadingUserState());
    final result = await _getUser(event.id);

    result.fold((failure) => emit(UserErrorState(failure.message)), (user) {
      logger.e(user.email);
      emit(UserLoadedState(user));
    });
  }

  FutureOr<void> _createUserHandler(
      CreateUserEvent event, Emitter<UserState> emit) async {
    emit(const CreatingUserState());
    final result = await _createUser(UserParams(
        name: event.name,
        username: event.username,
        email: event.email,
        address: event.address,
        phone: event.phone,
        website: event.website,
        company: event.company));

    result.fold((failure) => emit(UserErrorState(failure.message)),
        (_) => emit(const UserCreatedState()));
  }

  FutureOr<void> _deleteUserHandler(
      DeleteUserEvent event, Emitter<UserState> emit) async {
    emit(const DeletingUserState());
    final result = await _deleteUser(event.id);
    result.fold((failure) => emit(UserErrorState(failure.message)),
        (_) => emit(const UserDeletedState()));
  }

  FutureOr<void> _updateUserHandler(
      UpdateUserEvent event, Emitter<UserState> emit) async {
    emit(const UpdatingUserState());
    final result = await _updateUser(event.user);

    result.fold((failure) => emit(UserErrorState(failure.message)),
        (_) => emit(const UserUpdatedState()));
  }
}
