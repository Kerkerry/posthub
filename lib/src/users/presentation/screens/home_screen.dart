import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:posthub/src/users/domain/entities/user.dart';
import 'package:posthub/src/users/presentation/bloc/user_bloc.dart';
import 'package:posthub/src/users/presentation/widgets/admin_drawer.dart';
import 'package:posthub/src/users/presentation/widgets/loading_column.dart';
import 'package:posthub/src/users/presentation/widgets/user_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void getUsers() {
    context.read<UserBloc>().add(const GetUsersEvent());
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
          drawer: AdminDrawer(user: User.empty()),
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: state is UserErrorState
              ? Center(
                  child: Text(state.message),
                )
              : state is LoadingUsersState
                  ? const LoadingColumn(message: "Fetching users...")
                  : state is UsersLoadedState
                      ? ListView.builder(
                          itemCount: state.users.length,
                          itemBuilder: (context, index) {
                            final user = state.users[index];
                            return UserCard(user: user);
                          },
                        )
                      : const SizedBox.shrink(),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {},
          //   tooltip: 'Test',
          //   child: const Icon(Icons.add),
          // ),
        );
      },
    );
  }
}
