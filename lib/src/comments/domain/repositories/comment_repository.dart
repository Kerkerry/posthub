import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/src/comments/domain/entities/comment.dart';

abstract class CommentRepository {
  const CommentRepository();

  ResultVoid createComment(
      {required int postId,
      required String name,
      required String email,
      required String body});

  ResultVoid updateComment({required int id, required Comment comment});

  ResultVoid deletComment({required int id});

  ResultFuture<List<Comment>> getComments();

  ResultFuture<Comment> getComment({required int id});

  ResultFuture<List<Comment>> getPostComments({required int postId});
}
