import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/posts/domain/entities/post.dart';
import 'package:posthub/src/posts/domain/repositories/posts_repository.dart';

class GetPosts extends UsecaseWithoutParams<List<Post>> {
  const GetPosts({required this.repository});
  final PostsRepository repository;

  @override
  ResultFuture<List<Post>> call() async => repository.getPosts();
}
