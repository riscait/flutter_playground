import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_user_entity.freezed.dart';
part 'github_user_entity.g.dart';

@freezed
class GitHubUserEntity with _$GitHubUserEntity {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GitHubUserEntity({
    required String login,
    required int id,
    String? avatarUrl,
    required String htmlUrl,
    required String name,
    String? company,
    String? blog,
    String? email,
  }) = _GitHubUserEntity;

  factory GitHubUserEntity.fromJson(Map<String, Object?> json) =>
      _$GitHubUserEntityFromJson(json);
}
