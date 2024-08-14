part of 'injection_container_imports.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl
    ..registerFactory(() => UserBloc(
        getUsers: sl(),
        getUser: sl(),
        createUser: sl(),
        deleteUser: sl(),
        updateUser: sl(),
        getUserByEmail: sl()))
    ..registerLazySingleton(() => GetUsers(repository: sl()))
    ..registerLazySingleton(() => GetUser(repository: sl()))
    ..registerLazySingleton(() => CreateUser(repository: sl()))
    ..registerLazySingleton(() => DeleteUser(repository: sl()))
    ..registerLazySingleton(() => UpdateUser(repository: sl()))
    ..registerLazySingleton(() => GetUserByEmail(repository: sl()))
    ..registerLazySingleton<UserRepository>(
        () => UserRepositoryImplementation(remoteDatasource: sl()))
    ..registerLazySingleton<UserRemoteDatasource>(
        () => UserRemoteDatasourceImplementation(sl()))
    ..registerFactory(() => AlbumBloc(
        createAlbum: sl(),
        deleteAlbum: sl(),
        getAlbum: sl(),
        getAlbums: sl(),
        getUserAlbums: sl(),
        updateAlbum: sl()))
    ..registerLazySingleton(() => CreateAlbum(repository: sl()))
    ..registerLazySingleton(() => DeleteAlbum(repository: sl()))
    ..registerLazySingleton(() => GetAlbum(repository: sl()))
    ..registerLazySingleton(() => GetAlbums(repository: sl()))
    ..registerLazySingleton(() => GetUserAlbums(repository: sl()))
    ..registerLazySingleton(() => UpdateAlbum(repository: sl()))
    ..registerLazySingleton<AlbumRepository>(
        () => AlbumRepositoryImplementation(remoteDatasource: sl()))
    ..registerLazySingleton<AlbumRemoteDatasource>(
        () => AlbumRemoteDatasourceImplementation(client: sl()))
    ..registerFactory(() => PhotoBloc(
        createPhoto: sl(),
        updatePhoto: sl(),
        deletePhoto: sl(),
        getPhoto: sl(),
        getPhotos: sl(),
        getAlbumPhotos: sl()))
    ..registerLazySingleton(() => CreatePhoto(repository: sl()))
    ..registerLazySingleton(() => UpdatePhoto(repository: sl()))
    ..registerLazySingleton(() => DeletePhoto(repository: sl()))
    ..registerLazySingleton(() => GetPhoto(repository: sl()))
    ..registerLazySingleton(() => GetPhotos(repository: sl()))
    ..registerLazySingleton(() => GetAlbumPhotos(repository: sl()))
    ..registerLazySingleton<PhotoRepository>(
        () => PhotoRepositoryImplementation(datasource: sl()))
    ..registerLazySingleton<PhotoRemoteDatasource>(
        () => PhotoRemoteDatasourceImplementation(client: sl()))
    ..registerFactory(() => PostBloc(
        createPost: sl(),
        updatePost: sl(),
        deletePost: sl(),
        getPost: sl(),
        getPosts: sl(),
        getUserPosts: sl()))
    ..registerLazySingleton(() => CreatePost(repository: sl()))
    ..registerLazySingleton(() => UpdatePost(repository: sl()))
    ..registerLazySingleton(() => DeletePost(repository: sl()))
    ..registerLazySingleton(() => GetPost(repository: sl()))
    ..registerLazySingleton(() => GetPosts(repository: sl()))
    ..registerLazySingleton(() => GetUserPosts(repository: sl()))
    ..registerLazySingleton<PostsRepository>(
        () => PostRepositoryImplementation(remoteDatasource: sl()))
    ..registerLazySingleton<PostRemoteDatasource>(
        () => PostRemoteDatasourceImplementation(client: sl()))
    ..registerFactory(() => CommentBloc(
        createComment: sl(),
        updateComment: sl(),
        deleteComment: sl(),
        getComment: sl(),
        getComments: sl(),
        getPostComments: sl()))
    ..registerLazySingleton(() => CreateComment(repository: sl()))
    ..registerLazySingleton(() => UpdateComment(repository: sl()))
    ..registerLazySingleton(() => DeleteComment(repository: sl()))
    ..registerLazySingleton(() => GetComment(repository: sl()))
    ..registerLazySingleton(() => GetComments(repository: sl()))
    ..registerLazySingleton(() => GetPostComments(repository: sl()))
    ..registerLazySingleton<CommentRepository>(
        () => CommentRepositoryImplementation(datasource: sl()))
    ..registerLazySingleton<CommentRemoteDatasource>(
        () => CommentRemoteDatasourceImplementation(client: sl()))
    ..registerFactory(() => TodoBloc(
        createTodo: sl(),
        deleteTodo: sl(),
        getTodo: sl(),
        getTodos: sl(),
        getUserTodos: sl(),
        updateTodo: sl(),
        completeTodos: sl()))
    ..registerLazySingleton(() => CreateTodo(repository: sl()))
    ..registerLazySingleton(() => DeleteTodo(repository: sl()))
    ..registerLazySingleton(() => GetTodo(repository: sl()))
    ..registerLazySingleton(() => GetTodos(repository: sl()))
    ..registerLazySingleton(() => GetUserTodos(repository: sl()))
    ..registerLazySingleton(() => UpdateTodo(repository: sl()))
    ..registerLazySingleton(() => GetCompletedTodos(repository: sl()))
    ..registerLazySingleton<TodoRepository>(
        () => TodoRepositoryImplementation(datasource: sl()))
    ..registerLazySingleton<TodoRemoteDatasource>(
        () => TodoRemoteDatasourceImplementation(client: sl()))
    ..registerLazySingleton(() => http.Client());
}
