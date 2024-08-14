import 'package:posthub/src/posts/data/models/post_model.dart';
import 'package:posthub/src/posts/domain/entities/post.dart';

abstract class PostRemoteDatasource {
  const PostRemoteDatasource();
  Future createPost(
      {required int userId, required String title, required String body});

  Future updatePost({required int id, required Post post});

  Future deletPost({required int id});

  Future<List<PostModel>> getPosts();

  Future<PostModel> getPost({required int id});

  Future<List<Post>> getUserPost({required int userId});
}
