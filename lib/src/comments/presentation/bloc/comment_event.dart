part of 'comment_bloc.dart';

sealed class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}

class CreateCommentEvent extends CommentEvent {
  final int postId;
  final String name;
  final String email;
  final String body;

  const CreateCommentEvent(
      {required this.email,
      required this.postId,
      required this.name,
      required this.body});

  @override
  List<Object> get props => [postId, name, email, body];
}

class UpdateCommentEvent extends CommentEvent {
  final Comment comment;

  const UpdateCommentEvent({required this.comment});
  @override
  List<Object> get props => [comment.id];
}

class DeleteCommentEvent extends CommentEvent {
  final int id;

  const DeleteCommentEvent({required this.id});
}

class GetCommentEvent extends CommentEvent {
  final int id;
  const GetCommentEvent({required this.id});
}

class GetPostCommentsEvent extends CommentEvent {
  final int postId;
  const GetPostCommentsEvent({required this.postId});
}

class GetCommentsEvent extends CommentEvent {
  const GetCommentsEvent();
}
