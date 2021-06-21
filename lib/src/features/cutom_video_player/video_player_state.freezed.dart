// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'video_player_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$VideoPlayerStateTearOff {
  const _$VideoPlayerStateTearOff();

  _VideoPlayerState call(
      {PlayingStatus playingStatus = PlayingStatus.preparing,
      bool isFullScreen = false,
      List<VideoEntity> videoList = const <VideoEntity>[],
      VideoPlayerController? videoPlayerController,
      int currentVideoIndex = 0}) {
    return _VideoPlayerState(
      playingStatus: playingStatus,
      isFullScreen: isFullScreen,
      videoList: videoList,
      videoPlayerController: videoPlayerController,
      currentVideoIndex: currentVideoIndex,
    );
  }
}

/// @nodoc
const $VideoPlayerState = _$VideoPlayerStateTearOff();

/// @nodoc
mixin _$VideoPlayerState {
  /// 動画プレイヤーの再生状態
  PlayingStatus get playingStatus => throw _privateConstructorUsedError;

  /// 全画面表示フラグ
  bool get isFullScreen => throw _privateConstructorUsedError;

  /// 動画リスト
  List<VideoEntity> get videoList => throw _privateConstructorUsedError;

  /// 動画プレイヤー（1動画 = 1プレイヤー）
  VideoPlayerController? get videoPlayerController =>
      throw _privateConstructorUsedError;

  /// 現在、選択されている動画番号
  int get currentVideoIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VideoPlayerStateCopyWith<VideoPlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoPlayerStateCopyWith<$Res> {
  factory $VideoPlayerStateCopyWith(
          VideoPlayerState value, $Res Function(VideoPlayerState) then) =
      _$VideoPlayerStateCopyWithImpl<$Res>;
  $Res call(
      {PlayingStatus playingStatus,
      bool isFullScreen,
      List<VideoEntity> videoList,
      VideoPlayerController? videoPlayerController,
      int currentVideoIndex});
}

/// @nodoc
class _$VideoPlayerStateCopyWithImpl<$Res>
    implements $VideoPlayerStateCopyWith<$Res> {
  _$VideoPlayerStateCopyWithImpl(this._value, this._then);

  final VideoPlayerState _value;
  // ignore: unused_field
  final $Res Function(VideoPlayerState) _then;

  @override
  $Res call({
    Object? playingStatus = freezed,
    Object? isFullScreen = freezed,
    Object? videoList = freezed,
    Object? videoPlayerController = freezed,
    Object? currentVideoIndex = freezed,
  }) {
    return _then(_value.copyWith(
      playingStatus: playingStatus == freezed
          ? _value.playingStatus
          : playingStatus // ignore: cast_nullable_to_non_nullable
              as PlayingStatus,
      isFullScreen: isFullScreen == freezed
          ? _value.isFullScreen
          : isFullScreen // ignore: cast_nullable_to_non_nullable
              as bool,
      videoList: videoList == freezed
          ? _value.videoList
          : videoList // ignore: cast_nullable_to_non_nullable
              as List<VideoEntity>,
      videoPlayerController: videoPlayerController == freezed
          ? _value.videoPlayerController
          : videoPlayerController // ignore: cast_nullable_to_non_nullable
              as VideoPlayerController?,
      currentVideoIndex: currentVideoIndex == freezed
          ? _value.currentVideoIndex
          : currentVideoIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$VideoPlayerStateCopyWith<$Res>
    implements $VideoPlayerStateCopyWith<$Res> {
  factory _$VideoPlayerStateCopyWith(
          _VideoPlayerState value, $Res Function(_VideoPlayerState) then) =
      __$VideoPlayerStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {PlayingStatus playingStatus,
      bool isFullScreen,
      List<VideoEntity> videoList,
      VideoPlayerController? videoPlayerController,
      int currentVideoIndex});
}

/// @nodoc
class __$VideoPlayerStateCopyWithImpl<$Res>
    extends _$VideoPlayerStateCopyWithImpl<$Res>
    implements _$VideoPlayerStateCopyWith<$Res> {
  __$VideoPlayerStateCopyWithImpl(
      _VideoPlayerState _value, $Res Function(_VideoPlayerState) _then)
      : super(_value, (v) => _then(v as _VideoPlayerState));

  @override
  _VideoPlayerState get _value => super._value as _VideoPlayerState;

  @override
  $Res call({
    Object? playingStatus = freezed,
    Object? isFullScreen = freezed,
    Object? videoList = freezed,
    Object? videoPlayerController = freezed,
    Object? currentVideoIndex = freezed,
  }) {
    return _then(_VideoPlayerState(
      playingStatus: playingStatus == freezed
          ? _value.playingStatus
          : playingStatus // ignore: cast_nullable_to_non_nullable
              as PlayingStatus,
      isFullScreen: isFullScreen == freezed
          ? _value.isFullScreen
          : isFullScreen // ignore: cast_nullable_to_non_nullable
              as bool,
      videoList: videoList == freezed
          ? _value.videoList
          : videoList // ignore: cast_nullable_to_non_nullable
              as List<VideoEntity>,
      videoPlayerController: videoPlayerController == freezed
          ? _value.videoPlayerController
          : videoPlayerController // ignore: cast_nullable_to_non_nullable
              as VideoPlayerController?,
      currentVideoIndex: currentVideoIndex == freezed
          ? _value.currentVideoIndex
          : currentVideoIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_VideoPlayerState
    with DiagnosticableTreeMixin
    implements _VideoPlayerState {
  const _$_VideoPlayerState(
      {this.playingStatus = PlayingStatus.preparing,
      this.isFullScreen = false,
      this.videoList = const <VideoEntity>[],
      this.videoPlayerController,
      this.currentVideoIndex = 0});

  @JsonKey(defaultValue: PlayingStatus.preparing)
  @override

  /// 動画プレイヤーの再生状態
  final PlayingStatus playingStatus;
  @JsonKey(defaultValue: false)
  @override

  /// 全画面表示フラグ
  final bool isFullScreen;
  @JsonKey(defaultValue: const <VideoEntity>[])
  @override

  /// 動画リスト
  final List<VideoEntity> videoList;
  @override

  /// 動画プレイヤー（1動画 = 1プレイヤー）
  final VideoPlayerController? videoPlayerController;
  @JsonKey(defaultValue: 0)
  @override

  /// 現在、選択されている動画番号
  final int currentVideoIndex;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VideoPlayerState(playingStatus: $playingStatus, isFullScreen: $isFullScreen, videoList: $videoList, videoPlayerController: $videoPlayerController, currentVideoIndex: $currentVideoIndex)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VideoPlayerState'))
      ..add(DiagnosticsProperty('playingStatus', playingStatus))
      ..add(DiagnosticsProperty('isFullScreen', isFullScreen))
      ..add(DiagnosticsProperty('videoList', videoList))
      ..add(DiagnosticsProperty('videoPlayerController', videoPlayerController))
      ..add(DiagnosticsProperty('currentVideoIndex', currentVideoIndex));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _VideoPlayerState &&
            (identical(other.playingStatus, playingStatus) ||
                const DeepCollectionEquality()
                    .equals(other.playingStatus, playingStatus)) &&
            (identical(other.isFullScreen, isFullScreen) ||
                const DeepCollectionEquality()
                    .equals(other.isFullScreen, isFullScreen)) &&
            (identical(other.videoList, videoList) ||
                const DeepCollectionEquality()
                    .equals(other.videoList, videoList)) &&
            (identical(other.videoPlayerController, videoPlayerController) ||
                const DeepCollectionEquality().equals(
                    other.videoPlayerController, videoPlayerController)) &&
            (identical(other.currentVideoIndex, currentVideoIndex) ||
                const DeepCollectionEquality()
                    .equals(other.currentVideoIndex, currentVideoIndex)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(playingStatus) ^
      const DeepCollectionEquality().hash(isFullScreen) ^
      const DeepCollectionEquality().hash(videoList) ^
      const DeepCollectionEquality().hash(videoPlayerController) ^
      const DeepCollectionEquality().hash(currentVideoIndex);

  @JsonKey(ignore: true)
  @override
  _$VideoPlayerStateCopyWith<_VideoPlayerState> get copyWith =>
      __$VideoPlayerStateCopyWithImpl<_VideoPlayerState>(this, _$identity);
}

abstract class _VideoPlayerState implements VideoPlayerState {
  const factory _VideoPlayerState(
      {PlayingStatus playingStatus,
      bool isFullScreen,
      List<VideoEntity> videoList,
      VideoPlayerController? videoPlayerController,
      int currentVideoIndex}) = _$_VideoPlayerState;

  @override

  /// 動画プレイヤーの再生状態
  PlayingStatus get playingStatus => throw _privateConstructorUsedError;
  @override

  /// 全画面表示フラグ
  bool get isFullScreen => throw _privateConstructorUsedError;
  @override

  /// 動画リスト
  List<VideoEntity> get videoList => throw _privateConstructorUsedError;
  @override

  /// 動画プレイヤー（1動画 = 1プレイヤー）
  VideoPlayerController? get videoPlayerController =>
      throw _privateConstructorUsedError;
  @override

  /// 現在、選択されている動画番号
  int get currentVideoIndex => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$VideoPlayerStateCopyWith<_VideoPlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}
