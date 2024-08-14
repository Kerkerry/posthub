part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class CreatePostEvent extends PostEvent {
  final int userId;
  final String title;
  final String body;

  const CreatePostEvent(
      {required this.userId, required this.title, required this.body});

  @override
  List<Object> get props => [userId, title, body];
}

class UpdatePostEvent extends PostEvent {
  final Post post;

  const UpdatePostEvent({required this.post});
  @override
  List<Object> get props => [post.id];
}

class DeletePostEvent extends PostEvent {
  final int id;

  const DeletePostEvent({required this.id});
}

class GetPostEvent extends PostEvent {
  final int id;
  const GetPostEvent({required this.id});
}

class GetUserPostsEvent extends PostEvent {
  final int userId;
  const GetUserPostsEvent({required this.userId});
}

class GetPostsEvent extends PostEvent {
  const GetPostsEvent();
}
