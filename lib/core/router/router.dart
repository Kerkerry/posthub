part of 'router_parts.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case authenticationScreen:
      return MaterialPageRoute(
          builder: (context) => const AuthenticateScreen());
    case homeScreen:
      return MaterialPageRoute(
          builder: (context) => const HomePage(title: 'Post hub'));
    case userDetailScreen:
      final userId = settings.arguments as int;
      return MaterialPageRoute(
          builder: (context) => UserDetailScreen(userId: userId));
    case postsScreen:
      return MaterialPageRoute(builder: (context) => const PostsScreen());
    case userPostsScreen:
      final User user = settings.arguments as User;
      return MaterialPageRoute(
          builder: (context) => UserPostsScreen(user: user));
    case albumsScreen:
      return MaterialPageRoute(builder: (context) => const AlbumsScreens());
    case albumDetailScreen:
      final albumId = settings.arguments as int;
      return MaterialPageRoute(
          builder: (context) => AlbumDetailScreen(albumId: albumId));
    case userAlbumsScreen:
      final user = settings.arguments as User;
      return MaterialPageRoute(
          builder: (context) => UserAlbumsScreen(user: user));
    case photosScreen:
      return MaterialPageRoute(builder: (context) => const PhotosScreen());
    case photoDetailScreen:
      return MaterialPageRoute(builder: (context) => const PhotoDetailScreen());
    case albumPhotosScreen:
      final albumId = settings.arguments as int;
      return MaterialPageRoute(
          builder: (context) => AlbumPhotosScreen(albumId: albumId));
    case todosScreen:
      return MaterialPageRoute(builder: (context) => const TodosScreen());
    case userTodosScreen:
      final id = settings.arguments as int;
      return MaterialPageRoute(
          builder: (context) => UserTodoScreen(userId: id));
    case todoDetailScreen:
      final id = settings.arguments as int;
      return MaterialPageRoute(
          builder: (context) => TodoDetailScreen(todoId: id));
    case completedTodosScreen:
      return MaterialPageRoute(
          builder: (context) => const CompleteTodosScreen());
    case inCompletedTodosScreen:
      return MaterialPageRoute(
          builder: (context) => const InCompleteTodosScreen());
    case commentsScreen:
      return MaterialPageRoute(builder: (context) => const CommentsScreen());
    case postCommentsScreen:
      final post = settings.arguments as Post;
      return MaterialPageRoute(
          builder: (context) => PostCommentDetailsScree(post: post));
    case commentDetailScreen:
      return MaterialPageRoute(
          builder: (context) => const CommentsDetailScreen());
    default:
      return MaterialPageRoute(
          builder: (context) => UndefinedScreen(name: settings.name));
  }
}
