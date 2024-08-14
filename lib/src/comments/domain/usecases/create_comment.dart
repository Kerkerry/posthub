import 'package:equatable/equatable.dart';
import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/comments/domain/repositories/comment_repository.dart';

class CreateComment extends UsecaseWithParams<void, CreateCommentParams> {
  final CommentRepository repository;

  CreateComment({required this.repository});

  @override
  ResultFuture<void> call(CreateCommentParams params) async =>
      repository.createComment(
          postId: params.postId,
          name: params.name,
          email: params.email,
          body: params.body);
}

class CreateCommentParams extends Equatable {
  final int postId;
  final String name;
  final String email;
  final String body;

  const CreateCommentParams(
      {required this.postId,
      required this.name,
      required this.email,
      required this.body});
  @override
  List<Object?> get props => [postId, name, email, body];
}
