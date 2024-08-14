import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/posts/domain/entities/post.dart';
import 'package:posthub/src/posts/domain/repositories/posts_repository.dart';

class GetUserPosts extends UsecaseWithParams<List<Post>, int> {
  final PostsRepository repository;

  GetUserPosts({required this.repository});
  @override
  ResultFuture<List<Post>> call(int params) async =>
      repository.getUserPosts(userId: params);
}
