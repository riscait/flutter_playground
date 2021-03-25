// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MessageTearOff {
  const _$MessageTearOff();

  _Message call(
      {required String appName,
      required String homePageTitle,
      required String listAndFadeBar,
      required String customVideoPlayer}) {
    return _Message(
      appName: appName,
      homePageTitle: homePageTitle,
      listAndFadeBar: listAndFadeBar,
      customVideoPlayer: customVideoPlayer,
    );
  }
}

/// @nodoc
const $Message = _$MessageTearOff();

/// @nodoc
mixin _$Message {
  String get appName => throw _privateConstructorUsedError;
  String get homePageTitle => throw _privateConstructorUsedError;
  String get listAndFadeBar => throw _privateConstructorUsedError;
  String get customVideoPlayer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res>;
  $Res call(
      {String appName,
      String homePageTitle,
      String listAndFadeBar,
      String customVideoPlayer});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res> implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  final Message _value;
  // ignore: unused_field
  final $Res Function(Message) _then;

  @override
  $Res call({
    Object? appName = freezed,
    Object? homePageTitle = freezed,
    Object? listAndFadeBar = freezed,
    Object? customVideoPlayer = freezed,
  }) {
    return _then(_value.copyWith(
      appName: appName == freezed
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      homePageTitle: homePageTitle == freezed
          ? _value.homePageTitle
          : homePageTitle // ignore: cast_nullable_to_non_nullable
              as String,
      listAndFadeBar: listAndFadeBar == freezed
          ? _value.listAndFadeBar
          : listAndFadeBar // ignore: cast_nullable_to_non_nullable
              as String,
      customVideoPlayer: customVideoPlayer == freezed
          ? _value.customVideoPlayer
          : customVideoPlayer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$MessageCopyWith(_Message value, $Res Function(_Message) then) =
      __$MessageCopyWithImpl<$Res>;
  @override
  $Res call(
      {String appName,
      String homePageTitle,
      String listAndFadeBar,
      String customVideoPlayer});
}

/// @nodoc
class __$MessageCopyWithImpl<$Res> extends _$MessageCopyWithImpl<$Res>
    implements _$MessageCopyWith<$Res> {
  __$MessageCopyWithImpl(_Message _value, $Res Function(_Message) _then)
      : super(_value, (v) => _then(v as _Message));

  @override
  _Message get _value => super._value as _Message;

  @override
  $Res call({
    Object? appName = freezed,
    Object? homePageTitle = freezed,
    Object? listAndFadeBar = freezed,
    Object? customVideoPlayer = freezed,
  }) {
    return _then(_Message(
      appName: appName == freezed
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      homePageTitle: homePageTitle == freezed
          ? _value.homePageTitle
          : homePageTitle // ignore: cast_nullable_to_non_nullable
              as String,
      listAndFadeBar: listAndFadeBar == freezed
          ? _value.listAndFadeBar
          : listAndFadeBar // ignore: cast_nullable_to_non_nullable
              as String,
      customVideoPlayer: customVideoPlayer == freezed
          ? _value.customVideoPlayer
          : customVideoPlayer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$_Message implements _Message {
  const _$_Message(
      {required this.appName,
      required this.homePageTitle,
      required this.listAndFadeBar,
      required this.customVideoPlayer});

  @override
  final String appName;
  @override
  final String homePageTitle;
  @override
  final String listAndFadeBar;
  @override
  final String customVideoPlayer;

  @override
  String toString() {
    return 'Message(appName: $appName, homePageTitle: $homePageTitle, listAndFadeBar: $listAndFadeBar, customVideoPlayer: $customVideoPlayer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Message &&
            (identical(other.appName, appName) ||
                const DeepCollectionEquality()
                    .equals(other.appName, appName)) &&
            (identical(other.homePageTitle, homePageTitle) ||
                const DeepCollectionEquality()
                    .equals(other.homePageTitle, homePageTitle)) &&
            (identical(other.listAndFadeBar, listAndFadeBar) ||
                const DeepCollectionEquality()
                    .equals(other.listAndFadeBar, listAndFadeBar)) &&
            (identical(other.customVideoPlayer, customVideoPlayer) ||
                const DeepCollectionEquality()
                    .equals(other.customVideoPlayer, customVideoPlayer)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(appName) ^
      const DeepCollectionEquality().hash(homePageTitle) ^
      const DeepCollectionEquality().hash(listAndFadeBar) ^
      const DeepCollectionEquality().hash(customVideoPlayer);

  @JsonKey(ignore: true)
  @override
  _$MessageCopyWith<_Message> get copyWith =>
      __$MessageCopyWithImpl<_Message>(this, _$identity);
}

abstract class _Message implements Message {
  const factory _Message(
      {required String appName,
      required String homePageTitle,
      required String listAndFadeBar,
      required String customVideoPlayer}) = _$_Message;

  @override
  String get appName => throw _privateConstructorUsedError;
  @override
  String get homePageTitle => throw _privateConstructorUsedError;
  @override
  String get listAndFadeBar => throw _privateConstructorUsedError;
  @override
  String get customVideoPlayer => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MessageCopyWith<_Message> get copyWith =>
      throw _privateConstructorUsedError;
}
