import 'package:posthub/core/typedef/typedef.dart';
import 'package:posthub/core/usecase/usecase.dart';
import 'package:posthub/src/albums/domain/repositories/album_repository.dart';

class DeleteAlbum extends UsecaseWithParams<void, int> {
  final AlbumRepository repository;

  DeleteAlbum({required this.repository});

  @override
  ResultFuture<void> call(int params) async =>
      repository.deletAlbum(id: params);
}
