import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posthub/src/posts/presentation/bloc/post_bloc.dart';
import 'package:posthub/src/posts/presentation/widgets/post_card.dart';
import 'package:posthub/src/users/domain/entities/user.dart';
import 'package:posthub/src/users/presentation/widgets/loading_column.dart';

class UserPostsScreen extends StatefulWidget {
  const UserPostsScreen({super.key, required this.user});
  final User user;

  @override
  State<UserPostsScreen> createState() => _UserPostsScreenState();
}

class _UserPostsScreenState extends State<UserPostsScreen> {
  void getUserPosts() {
    context.read<PostBloc>().add(GetUserPostsEvent(userId: widget.user.id));
  }

  @override
  void initState() {
    getUserPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: state is UserPostsLoadedState
                ? Text("${widget.user.name} ${state.posts.length} posts")
                : null,
          ),
          body: state is PostErrorState
              ? Center(
                  child: Text(state.message),
                )
              : state is GettingUserPostsState
                  ? LoadingColumn(
                      message: "Fetching ${widget.user.name} posts...")
                  : state is UserPostsLoadedState
                      ? ListView.builder(
                          itemCount: state.posts.length,
                          itemBuilder: (context, index) {
                            final userpost = state.posts[index];
                            return PostCard(post: userpost);
                          },
                        )
                      : const SizedBox.shrink(),
        );
      },
    );
  }
}
