import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posthub/core/router/routing_constants.dart';
import 'package:posthub/src/comments/presentation/bloc/comment_bloc.dart';
import 'package:posthub/src/comments/presentation/widgets/comment_card.dart';
import 'package:posthub/src/posts/domain/entities/post.dart';
import 'package:posthub/src/posts/presentation/widgets/post_card.dart';
import 'package:posthub/src/users/presentation/widgets/loading_column.dart';

class PostCommentDetailsScree extends StatefulWidget {
  const PostCommentDetailsScree({super.key, required this.post});
  final Post post;
  @override
  State<PostCommentDetailsScree> createState() =>
      _PostCommentDetailsScreeState();
}

class _PostCommentDetailsScreeState extends State<PostCommentDetailsScree> {
  void getComments() {
    context
        .read<CommentBloc>()
        .add(GetPostCommentsEvent(postId: widget.post.id));
  }

  @override
  void initState() {
    getComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, postsScreen);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostCard(post: widget.post),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Comments",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<CommentBloc, CommentState>(
              builder: (context, state) {
                return SizedBox(
                  width: size.width,
                  height: size.height * 0.5,
                  child: state is GettingPostCommentsState
                      ? const LoadingColumn(message: "Fetching comments...")
                      : state is PostCommentsLoadedState
                          ? ListView.builder(
                              itemCount: state.comments.length,
                              itemBuilder: (context, index) {
                                final comment = state.comments[index];
                                return CommentCard(comment: comment);
                              },
                            )
                          : state is CommentErrorState
                              ? Center(
                                  child: Text(state.message),
                                )
                              : const SizedBox.shrink(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
