// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'video_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$VideoEntityTearOff {
  const _$VideoEntityTearOff();

  _VideoEntity call(
      {required String videoUrl,
      required String title,
      required String description}) {
    return _VideoEntity(
      videoUrl: videoUrl,
      title: title,
      description: description,
    );
  }
}

/// @nodoc
const $VideoEntity = _$VideoEntityTearOff();

/// @nodoc
mixin _$VideoEntity {
  String get videoUrl => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VideoEntityCopyWith<VideoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoEntityCopyWith<$Res> {
  factory $VideoEntityCopyWith(
          VideoEntity value, $Res Function(VideoEntity) then) =
      _$VideoEntityCopyWithImpl<$Res>;
  $Res call({String videoUrl, String title, String description});
}

/// @nodoc
class _$VideoEntityCopyWithImpl<$Res> implements $VideoEntityCopyWith<$Res> {
  _$VideoEntityCopyWithImpl(this._value, this._then);

  final VideoEntity _value;
  // ignore: unused_field
  final $Res Function(VideoEntity) _then;

  @override
  $Res call({
    Object? videoUrl = freezed,
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      videoUrl: videoUrl == freezed
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$VideoEntityCopyWith<$Res>
    implements $VideoEntityCopyWith<$Res> {
  factory _$VideoEntityCopyWith(
          _VideoEntity value, $Res Function(_VideoEntity) then) =
      __$VideoEntityCopyWithImpl<$Res>;
  @override
  $Res call({String videoUrl, String title, String description});
}

/// @nodoc
class __$VideoEntityCopyWithImpl<$Res> extends _$VideoEntityCopyWithImpl<$Res>
    implements _$VideoEntityCopyWith<$Res> {
  __$VideoEntityCopyWithImpl(
      _VideoEntity _value, $Res Function(_VideoEntity) _then)
      : super(_value, (v) => _then(v as _VideoEntity));

  @override
  _VideoEntity get _value => super._value as _VideoEntity;

  @override
  $Res call({
    Object? videoUrl = freezed,
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_VideoEntity(
      videoUrl: videoUrl == freezed
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_VideoEntity implements _VideoEntity {
  const _$_VideoEntity(
      {required this.videoUrl, required this.title, required this.description});

  @override
  final String videoUrl;
  @override
  final String title;
  @override
  final String description;

  @override
  String toString() {
    return 'VideoEntity(videoUrl: $videoUrl, title: $title, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _VideoEntity &&
            (identical(other.videoUrl, videoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.videoUrl, videoUrl)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(videoUrl) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description);

  @JsonKey(ignore: true)
  @override
  _$VideoEntityCopyWith<_VideoEntity> get copyWith =>
      __$VideoEntityCopyWithImpl<_VideoEntity>(this, _$identity);
}

abstract class _VideoEntity implements VideoEntity {
  const factory _VideoEntity(
      {required String videoUrl,
      required String title,
      required String description}) = _$_VideoEntity;

  @override
  String get videoUrl => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$VideoEntityCopyWith<_VideoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
