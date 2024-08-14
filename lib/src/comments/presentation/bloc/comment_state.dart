part of 'comment_bloc.dart';

sealed class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

final class CommentInitial extends CommentState {}

class CreatingCommentState extends CommentState {
  const CreatingCommentState();
}

class CommentCreateState extends CommentState {
  const CommentCreateState();
}

class DeletingCommentState extends CommentState {
  const DeletingCommentState();
}

class CommentDeletedState extends CommentState {
  const CommentDeletedState();
}

class GettingCommentState extends CommentState {
  const GettingCommentState();
}

class CommentLoadedState extends CommentState {
  final Comment comment;

  const CommentLoadedState({required this.comment});
  @override
  List<Object> get props => [comment.id];
}

class GettingCommentsState extends CommentState {
  const GettingCommentsState();
}

class CommentsLoadedState extends CommentState {
  final List<Comment> comments;

  const CommentsLoadedState({required this.comments});
  @override
  List<Object> get props => comments.map((comment) => comment.id).toList();
}

class UpdatingCommentState extends CommentState {
  const UpdatingCommentState();
}

class CommentUpdatedState extends CommentState {
  const CommentUpdatedState();
}

class GettingPostCommentsState extends CommentState {
  const GettingPostCommentsState();
}

class PostCommentsLoadedState extends CommentState {
  final List<Comment> comments;
  const PostCommentsLoadedState({required this.comments});

  @override
  List<Object> get props => comments.map((comment) => comment.id).toList();
}

class CommentErrorState extends CommentState {
  final String message;
  const CommentErrorState(this.message);
}
