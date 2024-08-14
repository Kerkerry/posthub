import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/comments/domain/entities/comment.dart';
import 'package:posthub/src/comments/domain/repositories/comment_repository.dart';

class GetComments extends UsecaseWithoutParams<List<Comment>> {
  final CommentRepository repository;

  GetComments({required this.repository});

  @override
  ResultFuture<List<Comment>> call() => repository.getComments();
}
