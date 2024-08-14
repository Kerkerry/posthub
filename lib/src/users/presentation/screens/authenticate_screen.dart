import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posthub/core/router/routing_constants.dart';
import 'package:posthub/src/users/presentation/bloc/user_bloc.dart';
import 'package:posthub/src/users/presentation/widgets/authentication_text_input.dart';
import 'package:posthub/src/users/presentation/widgets/loading_column.dart';

class AuthenticateScreen extends StatefulWidget {
  const AuthenticateScreen({super.key});

  @override
  State<AuthenticateScreen> createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    final email = TextEditingController();
    final username = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Sign in with details from \n{jsonplaceholder.typicode.com/users}"),
      ),
      body: BlocConsumer<UserBloc, UserState>(builder: (context, state) {
        if (state is UserInitial) {
          return Center(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.all(s.width * 0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AuthenticationTextInput(
                      textEditingController: email,
                      textLabel: 'Email',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AuthenticationTextInput(
                      textEditingController: username,
                      textLabel: 'Username',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: s.width * 0.4,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue[200]),
                            shape: const WidgetStatePropertyAll(
                                BeveledRectangleBorder())),
                        onPressed: () {
                          if (email.text.isEmpty || username.text.isEmpty) {
                            return;
                          }
                          context.read<UserBloc>().add(AuthenticateUserEvent(
                              email: email.text.trim(),
                              username: username.text.trim()));
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Signin",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.arrow_forward)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
        if (state is AuthenticatingUser) {
          return const LoadingColumn(message: 'Authenticating...');
        }
        if (state is UserErrorState) {
          return Center(
            child: Text(state.message),
          );
        }
        return const SizedBox.shrink();
      }, listener: (context, state) {
        if (state is UserAuthenticated) {
          Navigator.pushNamed(context, homeScreen);
        }
        if (state is UserErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      }),
    );
  }
}
