import 'package:equatable/equatable.dart';

class Photo extends Equatable {
  final int id;
  final int albumId;
  final String title;
  final String url;
  final String thumbnailUrl;

  const Photo(
      {required this.id,
      required this.albumId,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

  @override
  List<Object?> get props => [id, albumId, title, url, thumbnailUrl];

  const Photo.empty()
      : this(
            id: 5050,
            albumId: 108,
            title: 'Stack Overflow, ...or simply to test things locally.',
            url:
                'https://media.istockphoto.com/id/1645602428/photo/perfect-light-purple-and-pink-dahlia-enlarged-isolated-on-white-background.webp?b=1&s=170667a&w=0&k=20&c=Ie5-mXtynEFv_jaxS3fAzry7ZdEo88FJOrhlxMXoiiw=',
            thumbnailUrl:
                'https://media.istockphoto.com/id/1464561797/photo/artificial-intelligence-processor-unit-powerful-quantum-ai-component-on-pcb-motherboard-with.webp?b=1&s=170667a&w=0&k=20&c=AeBEFdsaJZmhbPHGocUkCutsQuR2rt828Aa8bDHyiOo=');
}
