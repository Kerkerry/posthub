import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/comments/domain/entities/comment.dart';
import 'package:posthub/src/comments/domain/repositories/comment_repository.dart';

class GetPostComments extends UsecaseWithParams<List<Comment>, int> {
  final CommentRepository repository;

  GetPostComments({required this.repository});

  @override
  ResultFuture<List<Comment>> call(int params) =>
      repository.getPostComments(postId: params);
}
