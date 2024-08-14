import 'package:posthub/src/comments/domain/entities/comment.dart';

abstract class CommentRemoteDatasource {
  const CommentRemoteDatasource();

  Future createComment(
      {required int postId,
      required String name,
      required String email,
      required String body});

  Future updateComment({required int id, required Comment comment});

  Future deletComment({required int id});

  Future<List<Comment>> getComments();

  Future<Comment> getComment({required int id});

  Future<List<Comment>> getPostComments({required int postId});
}
