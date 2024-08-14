import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/posts/domain/repositories/posts_repository.dart';

class DeletePost extends UsecaseWithParams<void, int> {
  const DeletePost({required this.repository});
  final PostsRepository repository;

  @override
  ResultFuture<void> call(int params) async => repository.deletPost(id: params);
}
