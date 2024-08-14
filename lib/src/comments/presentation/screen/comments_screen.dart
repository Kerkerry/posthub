import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posthub/src/comments/presentation/bloc/comment_bloc.dart';
import 'package:posthub/src/comments/presentation/widgets/comment_card.dart';
import 'package:posthub/src/photos/presentation/widgets/error_card.dart';
import 'package:posthub/src/users/presentation/widgets/loading_column.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  void getComments() {
    context.read<CommentBloc>().add(const GetCommentsEvent());
  }

  @override
  void initState() {
    getComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentBloc, CommentState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              title: state is CommentsLoadedState
                  ? Text(
                      '${state.comments.length} comments',
                    )
                  : const SizedBox.shrink()),
          body: state is CommentErrorState
              ? ErrorCard(error: state.message)
              : state is GettingCommentsState
                  ? const LoadingColumn(message: 'Fetching comments')
                  : state is CommentsLoadedState
                      ? ListView.builder(
                          itemCount: state.comments.length,
                          itemBuilder: (context, index) {
                            final comment = state.comments[index];
                            return CommentCard(comment: comment);
                          },
                        )
                      : const SizedBox.shrink(),
        );
      },
    );
  }
}
