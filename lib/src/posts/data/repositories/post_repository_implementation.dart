import 'package:dartz/dartz.dart';
import 'package:posthub/core/errors/exception.dart';
import 'package:posthub/core/errors/failure.dart';
import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/src/posts/data/datasources/post_remote_datasource.dart';
import 'package:posthub/src/posts/domain/entities/post.dart';
import 'package:posthub/src/posts/domain/repositories/posts_repository.dart';

class PostRepositoryImplementation implements PostsRepository {
  final PostRemoteDatasource remoteDatasource;

  PostRepositoryImplementation({required this.remoteDatasource});
  @override
  ResultVoid createPost(
      {required int userId,
      required String title,
      required String body}) async {
    try {
      await remoteDatasource.createPost(
          userId: userId, title: title, body: body);
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultVoid deletPost({required int id}) async {
    try {
      await remoteDatasource.deletPost(id: id);
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Post>> getPosts() async {
    try {
      final results = await remoteDatasource.getPosts();
      return Right(results);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultVoid updatePost({required int id, required Post post}) async {
    try {
      await remoteDatasource.updatePost(id: id, post: post);
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<Post> getPost({required int id}) async {
    try {
      final result = await remoteDatasource.getPost(id: id);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Post>> getUserPosts({required int userId}) async {
    try {
      final result = await remoteDatasource.getUserPost(userId: userId);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
}
