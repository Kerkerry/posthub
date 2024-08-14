import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/posts/domain/entities/post.dart';
import 'package:posthub/src/posts/domain/repositories/posts_repository.dart';

class UpdatePost extends UsecaseWithParams<void, Post> {
  final PostsRepository repository;
  const UpdatePost({required this.repository});

  @override
  ResultFuture<void> call(Post params) async =>
      repository.updatePost(id: params.id, post: params);
}
