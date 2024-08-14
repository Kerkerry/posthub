import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posthub/core/helper/logger_helper.dart';
import 'package:posthub/core/router/routing_constants.dart';
import 'package:posthub/src/comments/presentation/bloc/comment_bloc.dart';
import 'package:posthub/src/posts/domain/entities/post.dart';
import 'package:posthub/src/posts/presentation/bloc/post_bloc.dart';
import 'package:posthub/src/users/presentation/bloc/user_bloc.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key, required this.post});
  final Post post;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  void getUser() {
    context.read<UserBloc>().add(GetUserEvent(id: widget.post.userId));
  }

  void getPostComments() {
    context
        .read<CommentBloc>()
        .add(GetPostCommentsEvent(postId: widget.post.id));
  }

  @override
  void initState() {
    getUser();
    getPostComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Card(
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.post.title,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.post.body,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.6)),
                ),
                const SizedBox(
                  height: 10,
                ),
                state is GettingUserPostsState
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Fetching user...",
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          ),
                        ],
                      )
                    : state is UserLoadedState
                        ? Row(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                state.user.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              BlocBuilder<CommentBloc, CommentState>(
                                builder: (context, state) {
                                  logger.e(state.runtimeType);
                                  if (state is GettingPostCommentsState) {
                                    return const Text("Fetching comments");
                                  }
                                  if (state is PostCommentsLoadedState) {
                                    return TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, postCommentsScreen,
                                              arguments: widget.post);
                                        },
                                        child: Text(
                                          "${state.comments.length} comments",
                                          style: const TextStyle(
                                              color: Colors.blue),
                                        ));
                                  }

                                  return const SizedBox.shrink();
                                },
                              ),
                            ],
                          )
                        : state is UserErrorState
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    state.message,
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 16),
                                  ),
                                ],
                              )
                            : const SizedBox.shrink()
              ],
            ),
          ),
        );
      },
    );
  }
}
