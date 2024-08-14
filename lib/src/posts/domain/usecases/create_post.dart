import 'package:equatable/equatable.dart';
import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/posts/domain/repositories/posts_repository.dart';

class CreatePost extends UsecaseWithParams<void, PostParams> {
  final PostsRepository repository;
  const CreatePost({required this.repository});
  @override
  ResultFuture<void> call(PostParams params) async => repository.createPost(
      userId: params.userId, title: params.title, body: params.body);
}

class PostParams extends Equatable {
  final int userId;
  final String title;
  final String body;

  const PostParams(
      {required this.userId, required this.title, required this.body});

  @override
  List<Object?> get props => [userId, title, body];
}
