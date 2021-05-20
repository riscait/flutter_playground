import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_entity.freezed.dart';

@freezed
class VideoEntity with _$VideoEntity {
  const factory VideoEntity({
    required String videoUrl,
    required String title,
    required String description,
  }) = _VideoEntity;
}

const stabVideoEntity = VideoEntity(
  videoUrl:
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
  title: 'Video title',
  description: 'Video description.',
);
