import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/comments/domain/repositories/comment_repository.dart';

class DeleteComment extends UsecaseWithParams<void, int> {
  final CommentRepository repository;

  DeleteComment({required this.repository});

  @override
  ResultFuture<void> call(int params) async =>
      repository.deletComment(id: params);
}
