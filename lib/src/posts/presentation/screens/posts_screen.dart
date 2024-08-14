import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posthub/core/router/routing_constants.dart';
import 'package:posthub/src/posts/presentation/bloc/post_bloc.dart';
import 'package:posthub/src/posts/presentation/widgets/post_card.dart';
import 'package:posthub/src/users/presentation/widgets/loading_column.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  void getPosts() {
    context.read<PostBloc>().add(const GetPostsEvent());
  }

  @override
  void initState() {
    getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Posts screen"),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, homeScreen);
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
            body: state is PostErrorState
                ? Center(
                    child: Text(state.message),
                  )
                : state is GettingPostsState
                    ? const LoadingColumn(message: "Fetching posts")
                    : state is PostsLoadedState
                        ? ListView.builder(
                            itemCount: state.posts.length,
                            itemBuilder: (context, index) {
                              final post = state.posts[index];
                              return PostCard(post: post);
                            },
                          )
                        : const SizedBox.shrink());
      },
    );
  }
}
