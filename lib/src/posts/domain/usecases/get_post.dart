import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/posts/domain/entities/post.dart';
import 'package:posthub/src/posts/domain/repositories/posts_repository.dart';

class GetPost extends UsecaseWithParams<Post, int> {
  const GetPost({required this.repository});
  final PostsRepository repository;

  @override
  ResultFuture<Post> call(int params) async => repository.getPost(id: params);
}
