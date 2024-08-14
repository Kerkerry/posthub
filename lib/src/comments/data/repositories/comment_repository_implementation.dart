import 'package:dartz/dartz.dart';
import 'package:posthub/core/errors/exception.dart';
import 'package:posthub/core/errors/failure.dart';
import 'package:posthub/core/helper/logger_helper.dart';
import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/src/comments/data/datasources/comment_remote_datasource.dart';
import 'package:posthub/src/comments/domain/entities/comment.dart';
import 'package:posthub/src/comments/domain/repositories/comment_repository.dart';

class CommentRepositoryImplementation implements CommentRepository {
  final CommentRemoteDatasource _datasource;

  CommentRepositoryImplementation({required CommentRemoteDatasource datasource})
      : _datasource = datasource;

  @override
  ResultVoid createComment(
      {required int postId,
      required String name,
      required String email,
      required String body}) async {
    try {
      await _datasource.createComment(
          postId: postId, name: name, email: email, body: body);
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultVoid deletComment({required int id}) async {
    try {
      await _datasource.deletComment(id: id);
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<Comment> getComment({required int id}) async {
    try {
      final result = await _datasource.getComment(id: id);
      logger.e(result);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Comment>> getComments() async {
    try {
      final result = await _datasource.getComments();
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Comment>> getPostComments({required int postId}) async {
    try {
      final result = await _datasource.getPostComments(postId: postId);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultVoid updateComment({required int id, required Comment comment}) async {
    try {
      await _datasource.updateComment(id: id, comment: comment);
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
}
