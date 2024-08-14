import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posthub/core/helper/logger_helper.dart';
import 'package:posthub/core/router/routing_constants.dart';
import 'package:posthub/src/users/presentation/bloc/user_bloc.dart';
import 'package:posthub/src/users/presentation/widgets/loading_column.dart';
import 'package:posthub/src/users/presentation/widgets/user_profile.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({super.key, required this.userId});
  final int userId;

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  void getUser() {
    context.read<UserBloc>().add(GetUserEvent(id: widget.userId));
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        logger.e(state.runtimeType);
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
                leading: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, homeScreen);
                    },
                    icon: const Icon(Icons.arrow_back)),
                title: state is UserLoadedState
                    ? Text(
                        state.user.name,
                        style: const TextStyle(fontSize: 19),
                      )
                    : const Text("")),
            body: state is LoadingUserState
                ? const LoadingColumn(message: "Fetching user...")
                : state is UserLoadedState
                    ? Center(
                        child: Builder(
                          builder: (context) {
                            final user = state.user;
                            return UserProfile(
                              size: size,
                              user: user,
                            );
                          },
                        ),
                      )
                    : state is UserErrorState
                        ? Text(state.message)
                        : const SizedBox.shrink());
      },
    );
  }
}
