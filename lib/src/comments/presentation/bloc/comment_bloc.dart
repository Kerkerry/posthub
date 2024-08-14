import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:posthub/src/comments/domain/entities/comment.dart';
import 'package:posthub/src/comments/domain/usecases/create_comment.dart';
import 'package:posthub/src/comments/domain/usecases/delete_comment.dart';
import 'package:posthub/src/comments/domain/usecases/get_comment.dart';
import 'package:posthub/src/comments/domain/usecases/get_comments.dart';
import 'package:posthub/src/comments/domain/usecases/get_post_comments.dart';
import 'package:posthub/src/comments/domain/usecases/update_comment.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CreateComment _createComment;
  final UpdateComment _updateComment;
  final DeleteComment _deleteComment;
  final GetComment _getComment;
  final GetComments _getComments;
  final GetPostComments _getPostComments;
  CommentBloc(
      {required CreateComment createComment,
      required UpdateComment updateComment,
      required DeleteComment deleteComment,
      required GetComment getComment,
      required GetComments getComments,
      required GetPostComments getPostComments})
      : _createComment = createComment,
        _deleteComment = deleteComment,
        _updateComment = updateComment,
        _getComment = getComment,
        _getComments = getComments,
        _getPostComments = getPostComments,
        super(CommentInitial()) {
    on<GetCommentsEvent>(_getCommentsHandler);
    on<GetCommentEvent>(_getCommentHandler);
    on<CreateCommentEvent>(_createCommentHandler);
    on<UpdateCommentEvent>(_updateCommentHandler);
    on<DeleteCommentEvent>(_deleteCommentHandler);
    on<GetPostCommentsEvent>(_getPostCommentsHandler);
  }

  FutureOr<void> _getCommentsHandler(
      GetCommentsEvent event, Emitter<CommentState> emit) async {
    emit(const GettingCommentsState());
    final result = await _getComments();
    result.fold((failure) => emit(CommentErrorState(failure.message)),
        (comments) => emit(CommentsLoadedState(comments: comments)));
  }

  FutureOr<void> _getCommentHandler(
      GetCommentEvent event, Emitter<CommentState> emit) async {
    emit(const GettingCommentState());
    final result = await _getComment(event.id);
    result.fold((failure) => emit(CommentErrorState(failure.message)),
        (comment) => emit(CommentLoadedState(comment: comment)));
  }

  FutureOr<void> _createCommentHandler(
      CreateCommentEvent event, Emitter<CommentState> emit) async {
    emit(const CreatingCommentState());
    final result = await _createComment(CreateCommentParams(
        postId: event.postId,
        name: event.name,
        email: event.email,
        body: event.body));
    result.fold((failure) => emit(CommentErrorState(failure.message)),
        (_) => emit(const CommentCreateState()));
  }

  FutureOr<void> _updateCommentHandler(
      UpdateCommentEvent event, Emitter<CommentState> emit) async {
    emit(const UpdatingCommentState());
    final result = await _updateComment(event.comment);
    result.fold((failure) => emit(CommentErrorState(failure.message)),
        (_) => emit(const CommentUpdatedState()));
  }

  FutureOr<void> _deleteCommentHandler(
      DeleteCommentEvent event, Emitter<CommentState> emit) async {
    emit(const DeletingCommentState());
    final result = await _deleteComment(event.id);
    result.fold((failure) => emit(CommentErrorState(failure.message)),
        (_) => emit(const CommentDeletedState()));
  }

  FutureOr<void> _getPostCommentsHandler(
      GetPostCommentsEvent event, Emitter<CommentState> emit) async {
    emit(const GettingPostCommentsState());
    final result = await _getPostComments(event.postId);
    result.fold((failure) => emit(CommentErrorState(failure.message)),
        (comments) => emit(PostCommentsLoadedState(comments: comments)));
  }
}
