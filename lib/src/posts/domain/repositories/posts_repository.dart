import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/src/posts/domain/entities/post.dart';

abstract class PostsRepository {
  const PostsRepository();

  ResultVoid createPost(
      {required int userId, required String title, required String body});

  ResultVoid updatePost({required int id, required Post post});

  ResultVoid deletPost({required int id});

  ResultFuture<List<Post>> getPosts();

  ResultFuture<Post> getPost({required int id});

  ResultFuture<List<Post>> getUserPosts({required int userId});
}
