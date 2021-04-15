// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GitHubUserEntity _$_$_GitHubUserEntityFromJson(Map json) {
  return _$_GitHubUserEntity(
    login: json['login'] as String,
    id: json['id'] as int,
    avatarUrl: json['avatar_url'] as String?,
    htmlUrl: json['html_url'] as String,
    name: json['name'] as String,
    company: json['company'] as String?,
    blog: json['blog'] as String?,
    email: json['email'] as String?,
  );
}

Map<String, dynamic> _$_$_GitHubUserEntityToJson(
        _$_GitHubUserEntity instance) =>
    <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'avatar_url': instance.avatarUrl,
      'html_url': instance.htmlUrl,
      'name': instance.name,
      'company': instance.company,
      'blog': instance.blog,
      'email': instance.email,
    };
