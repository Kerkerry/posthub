import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/comments/domain/entities/comment.dart';
import 'package:posthub/src/comments/domain/repositories/comment_repository.dart';

class UpdateComment extends UsecaseWithParams<void, Comment> {
  final CommentRepository repository;

  UpdateComment({required this.repository});

  @override
  ResultFuture<void> call(Comment params) async =>
      repository.updateComment(id: params.id, comment: params);
}
