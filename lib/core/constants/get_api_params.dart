String getEndpoint(String endpoint, int id) => "$endpoint/$id";
String getUserPostsEndpoint({required int userId}) => "/users/$userId/posts";
String getPostCommentsEndpoint({required int postId}) =>
    "/posts/$postId/comments";
String getAlbumPhotosEndpoint({required int albumId}) =>
    "/albums/$albumId/photos";
String getUserTodosEndpoint(int userId) => '/todos/?userId=$userId';
String getUserByEmailEndpoint(String email) => '/users/?email=$email';
String getCompletedTodosEndpoint(bool complete) =>
    '/todos/?completed=$complete';
String getInCompletedTodosEndpoint(bool incomplete) =>
    '/todos/?completed=$incomplete';
