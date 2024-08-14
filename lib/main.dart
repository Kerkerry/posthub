import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posthub/core/router/router_parts.dart' as router;
import 'package:posthub/core/router/routing_constants.dart';
import 'package:posthub/core/services/injection_container_imports.dart';
import 'package:posthub/src/albums/presentation/bloc/album_bloc.dart';
import 'package:posthub/src/comments/presentation/bloc/comment_bloc.dart';
import 'package:posthub/src/photos/presentation/bloc/photo_bloc.dart';
import 'package:posthub/src/posts/presentation/bloc/post_bloc.dart';
import 'package:posthub/src/todos/presentation/bloc/todo_bloc.dart';
import 'package:posthub/src/users/presentation/bloc/user_bloc.dart';
import 'package:posthub/undefined_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<UserBloc>()),
        BlocProvider(create: (context) => sl<PostBloc>()),
        BlocProvider(create: (context) => sl<CommentBloc>()),
        BlocProvider(create: (context) => sl<AlbumBloc>()),
        BlocProvider(create: (context) => sl<PhotoBloc>()),
        BlocProvider(create: (context) => sl<TodoBloc>())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Post Hub',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: router.generateRoute,
        onUnknownRoute: (settings) => MaterialPageRoute(
            builder: (context) => UndefinedScreen(
                  name: settings.name,
                )),
        initialRoute: authenticationScreen,
      ),
    );
  }
}
