import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/comments/domain/entities/comment.dart';
import 'package:posthub/src/comments/domain/repositories/comment_repository.dart';

class GetComment extends UsecaseWithParams<Comment, int> {
  final CommentRepository repository;

  GetComment({required this.repository});

  @override
  ResultFuture<Comment> call(int params) => repository.getComment(id: params);
}
