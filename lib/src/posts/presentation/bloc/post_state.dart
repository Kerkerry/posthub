part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {}

class CreatingPostState extends PostState {
  const CreatingPostState();
}

class PostCreateState extends PostState {
  const PostCreateState();
}

class DeletingPostState extends PostState {
  const DeletingPostState();
}

class PostDeletedState extends PostState {
  const PostDeletedState();
}

class GettingPostState extends PostState {
  const GettingPostState();
}

class PostLoadedState extends PostState {
  final Post post;

  const PostLoadedState({required this.post});
  @override
  List<Object> get props => [post.id];
}

class GettingPostsState extends PostState {
  const GettingPostsState();
}

class PostsLoadedState extends PostState {
  final List<Post> posts;

  const PostsLoadedState({required this.posts});
  @override
  List<Object> get props => posts.map((post) => post.id).toList();
}

class UpdatingPostState extends PostState {
  const UpdatingPostState();
}

class PostUpdatedState extends PostState {
  const PostUpdatedState();
}

class GettingUserPostsState extends PostState {
  const GettingUserPostsState();
}

class UserPostsLoadedState extends PostState {
  final List<Post> posts;
  const UserPostsLoadedState({required this.posts});

  @override
  List<Object> get props => posts.map((post) => post.id).toList();
}

class PostErrorState extends PostState {
  final String message;
  const PostErrorState(this.message);
}
