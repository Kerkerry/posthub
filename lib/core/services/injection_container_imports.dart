import 'package:get_it/get_it.dart';
import 'package:posthub/src/albums/data/datasources/album_remote_datasource.dart';
import 'package:posthub/src/albums/data/datasources/album_remote_datasource_implementation.dart';
import 'package:posthub/src/albums/data/repostories/album_repository_implementation.dart';
import 'package:posthub/src/albums/domain/repositories/album_repository.dart';
import 'package:posthub/src/albums/domain/usecases/create_album.dart';
import 'package:posthub/src/albums/domain/usecases/delete_album.dart';
import 'package:posthub/src/albums/domain/usecases/get_album.dart';
import 'package:posthub/src/albums/domain/usecases/get_albums.dart';
import 'package:posthub/src/albums/domain/usecases/get_user_albums.dart';
import 'package:posthub/src/albums/domain/usecases/update_album.dart';
import 'package:posthub/src/albums/presentation/bloc/album_bloc.dart';
import 'package:posthub/src/comments/data/datasources/comment_remote_datasource.dart';
import 'package:posthub/src/comments/data/datasources/comment_remote_datasource_implementation.dart';
import 'package:posthub/src/comments/data/repositories/comment_repository_implementation.dart';
import 'package:posthub/src/comments/domain/repositories/comment_repository.dart';
import 'package:posthub/src/comments/domain/usecases/create_comment.dart';
import 'package:posthub/src/comments/domain/usecases/delete_comment.dart';
import 'package:posthub/src/comments/domain/usecases/get_comment.dart';
import 'package:posthub/src/comments/domain/usecases/get_comments.dart';
import 'package:posthub/src/comments/domain/usecases/get_post_comments.dart';
import 'package:posthub/src/comments/domain/usecases/update_comment.dart';
import 'package:posthub/src/comments/presentation/bloc/comment_bloc.dart';
import 'package:posthub/src/photos/data/datasource/photo_remote_datasource.dart';
import 'package:posthub/src/photos/data/datasource/photo_remote_datasource_implementation.dart';
import 'package:posthub/src/photos/data/repositories/photo_repository_implementation.dart';
import 'package:posthub/src/photos/domain/repositories/photo_repository.dart';
import 'package:posthub/src/photos/domain/usecase/create_photo.dart';
import 'package:posthub/src/photos/domain/usecase/delete_photo.dart';
import 'package:posthub/src/photos/domain/usecase/get_album_photos.dart';
import 'package:posthub/src/photos/domain/usecase/get_photo.dart';
import 'package:posthub/src/photos/domain/usecase/get_photos.dart';
import 'package:posthub/src/photos/domain/usecase/update_photo.dart';
import 'package:posthub/src/photos/presentation/bloc/photo_bloc.dart';
import 'package:posthub/src/posts/data/datasources/post_remote_datasource.dart';
import 'package:posthub/src/posts/data/datasources/post_remote_datasource_implementation.dart';
import 'package:posthub/src/posts/data/repositories/post_repository_implementation.dart';
import 'package:posthub/src/posts/domain/repositories/posts_repository.dart';
import 'package:posthub/src/posts/domain/usecases/create_post.dart';
import 'package:posthub/src/posts/domain/usecases/delete_post.dart';
import 'package:posthub/src/posts/domain/usecases/get_post.dart';
import 'package:posthub/src/posts/domain/usecases/get_posts.dart';
import 'package:posthub/src/posts/domain/usecases/get_user_posts.dart';
import 'package:posthub/src/posts/domain/usecases/update_post.dart';
import 'package:posthub/src/posts/presentation/bloc/post_bloc.dart';
import 'package:posthub/src/todos/data/datasources/todo_remote_datasource.dart';
import 'package:posthub/src/todos/data/datasources/todo_remote_datasource_implementation.dart';
import 'package:posthub/src/todos/data/repository/todo_repository_implementation.dart';
import 'package:posthub/src/todos/domain/repositories/todo_repository.dart';
import 'package:posthub/src/todos/domain/usecase/create_todo.dart';
import 'package:posthub/src/todos/domain/usecase/delete_todo.dart';
import 'package:posthub/src/todos/domain/usecase/get_completed_todos.dart';
import 'package:posthub/src/todos/domain/usecase/get_todo.dart';
import 'package:posthub/src/todos/domain/usecase/get_todos.dart';
import 'package:posthub/src/todos/domain/usecase/get_user_todos.dart';
import 'package:posthub/src/todos/domain/usecase/update_todo.dart';
import 'package:posthub/src/todos/presentation/bloc/todo_bloc.dart';
import 'package:posthub/src/users/data/datasource/user_remote_datasource.dart';
import 'package:posthub/src/users/data/datasource/user_remote_datasource_implementation.dart';
import 'package:posthub/src/users/data/repositories/user_repository_implementation.dart';
import 'package:posthub/src/users/domain/repositories/user_repository.dart';
import 'package:posthub/src/users/domain/usecases/create_user.dart';
import 'package:posthub/src/users/domain/usecases/delete_user.dart';
import 'package:posthub/src/users/domain/usecases/get_user.dart';
import 'package:posthub/src/users/domain/usecases/get_user_by_email.dart';
import 'package:posthub/src/users/domain/usecases/get_users.dart';
import 'package:posthub/src/users/domain/usecases/update_user.dart';
import 'package:posthub/src/users/presentation/bloc/user_bloc.dart';
import 'package:http/http.dart' as http;

part 'injection_container.dart';
