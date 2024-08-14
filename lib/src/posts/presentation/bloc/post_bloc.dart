import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:posthub/core/helper/logger_helper.dart';
import 'package:posthub/src/posts/domain/entities/post.dart';
import 'package:posthub/src/posts/domain/usecases/create_post.dart';
import 'package:posthub/src/posts/domain/usecases/delete_post.dart';
import 'package:posthub/src/posts/domain/usecases/get_post.dart';
import 'package:posthub/src/posts/domain/usecases/get_posts.dart';
import 'package:posthub/src/posts/domain/usecases/get_user_posts.dart';
import 'package:posthub/src/posts/domain/usecases/update_post.dart';
part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final CreatePost _createPost;
  final UpdatePost _updatePost;
  final DeletePost _deletePost;
  final GetPost _getPost;
  final GetPosts _getPosts;
  final GetUserPosts _getUserPosts;
  PostBloc(
      {required CreatePost createPost,
      required UpdatePost updatePost,
      required DeletePost deletePost,
      required GetPost getPost,
      required GetUserPosts getUserPosts,
      required GetPosts getPosts})
      : _createPost = createPost,
        _updatePost = updatePost,
        _deletePost = deletePost,
        _getPost = getPost,
        _getPosts = getPosts,
        _getUserPosts = getUserPosts,
        super(PostInitial()) {
    on<GetPostsEvent>(_getPostsHandler);
    on<GetPostEvent>(_getPostHandler);
    on<CreatePostEvent>(_createPostHandler);
    on<UpdatePostEvent>(_updatePostHandler);
    on<DeletePostEvent>(_deletePostHandler);
    on<GetUserPostsEvent>(_getUserPostsHandler);
  }

  FutureOr<void> _getPostsHandler(
      GetPostsEvent event, Emitter<PostState> emit) async {
    emit(const GettingPostState());
    final result = await _getPosts();
    result.fold((failure) => emit(PostErrorState(failure.message)), (posts) {
      logger.e(posts[70]);
      emit(PostsLoadedState(posts: posts));
    });
  }

  FutureOr<void> _getPostHandler(
      GetPostEvent event, Emitter<PostState> emit) async {
    emit(const GettingPostState());
    final result = await _getPost(event.id);
    result.fold((failure) => emit(PostErrorState(failure.message)), (post) {
      logger.e(post);
      emit(PostLoadedState(post: post));
    });
  }

  FutureOr<void> _createPostHandler(
      CreatePostEvent event, Emitter<PostState> emit) async {
    emit(const CreatingPostState());
    final result = await _createPost(
        PostParams(userId: event.userId, title: event.title, body: event.body));
    result.fold((failure) => emit(PostErrorState(failure.message)),
        (_) => emit(const PostCreateState()));
  }

  FutureOr<void> _updatePostHandler(
      UpdatePostEvent event, Emitter<PostState> emit) async {
    emit(const UpdatingPostState());
    final result = await _updatePost(event.post);
    result.fold((failure) => emit(PostErrorState(failure.message)),
        (_) => emit(const PostUpdatedState()));
  }

  FutureOr<void> _deletePostHandler(
      DeletePostEvent event, Emitter<PostState> emit) async {
    emit(const DeletingPostState());
    final result = await _deletePost(event.id);
    result.fold((failure) => emit(PostErrorState(failure.message)),
        (_) => emit(const PostDeletedState()));
  }

  FutureOr<void> _getUserPostsHandler(
      GetUserPostsEvent event, Emitter<PostState> emit) async {
    emit(const GettingUserPostsState());
    final result = await _getUserPosts(event.userId);
    result.fold((failure) => emit(PostErrorState(failure.message)),
        (posts) => emit(UserPostsLoadedState(posts: posts)));
  }
}
