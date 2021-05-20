import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_player/video_player.dart';

import 'video_entity.dart';

part 'video_player_state.freezed.dart';

/// 動画プレイヤーの再生状態
enum PlayingStatus {
  /// 準備中
  preparing,

  /// 準備OK
  ready,

  /// 再生中
  playing,

  /// 一時停止中
  pausing,

  /// 再生終了
  finished,
}

extension PlayingStatusExt on PlayingStatus {
  bool get isPreparing => this == PlayingStatus.preparing;
  bool get isReady => this == PlayingStatus.ready;
  bool get isPlaying => this == PlayingStatus.playing;
  bool get isPausing => this == PlayingStatus.pausing;
  bool get isFinished => this == PlayingStatus.finished;
}

/// 動画プレイヤーの状態
@freezed
class VideoPlayerState with _$VideoPlayerState {
  const factory VideoPlayerState({
    /// 動画プレイヤーの再生状態
    @Default(PlayingStatus.preparing) PlayingStatus playingStatus,

    /// 全画面表示フラグ
    @Default(false) bool isFullScreen,

    /// 動画リスト
    @Default(<VideoEntity>[]) List<VideoEntity> videoList,

    /// 動画プレイヤー（1動画 = 1プレイヤー）
    VideoPlayerController? videoPlayerController,

    /// 現在、選択されている動画番号
    @Default(0) int currentVideoIndex,

    /// シークした再生時間のターゲット
    // Duration? seekTarget,
  }) = _VideoPlayerState;
}
