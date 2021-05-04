import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../features/cutom_video_player/custom_video_player.dart';

final videoPlayerControllerProvider = StateNotifierProvider.autoDispose<
    VideoPlayerPageController, VideoPlayerState>(
  (ref) => VideoPlayerPageController(ref.read),
);

/// 動画再生画面のController
class VideoPlayerPageController extends StateNotifier<VideoPlayerState> {
  VideoPlayerPageController(this._read) : super(const VideoPlayerState()) {
    Future<void>(() async {
      await _fetchVideoList();
      await _prepareVideoPlayer();
    });
  }

  // ignore: unused_field
  final Reader _read;

  Future<void> _fetchVideoList() async {
    state = state.copyWith(videoList: [stabVideoEntity, stabVideoEntity]);
  }

  /// 動画プレイヤーを準備し、最初の動画を再生状態にする
  Future<void> _prepareVideoPlayer() async {
    final videoUrl = state.videoList.first.videoUrl;
    // 最初の動画で初期化
    try {
      final controller = VideoPlayerController.network(videoUrl);
      await controller.initialize();
      // 再生状態を購読
      _addListener(controller);
      // 再生準備OK
      state = state.copyWith(
        videoPlayerController: controller,
        playingStatus: PlayingStatus.ready,
      );
    } on PlatformException catch (e) {
      _handleError(e);
    }
  }

  void _handleError(PlatformException e) {
    if (e.code == 'VideoError' && e.message != null) {
      // handle Video error.
    } else {
      // handle error.
    }
  }

  /// 動画の状態を購読する
  void _addListener(VideoPlayerController controller) {
    controller.addListener(() {
      if (!controller.value.isPlaying) {
        // 再生完了を購読
        if (controller.value.duration == controller.value.position) {
          state = state.copyWith(
            playingStatus: PlayingStatus.finished,
          );
        }
      }
    });
  }

  /// 動画を変更する（VideoPlayerController初期化）
  Future<void> selectVideo(int videoIndex) async {
    // 変更前の動画を破棄
    state = state.copyWith(
      playingStatus: PlayingStatus.preparing,
      currentVideoIndex: videoIndex,
    );
    // 変更前の `VideoPlayerController` を保持しておく
    final oldController = state.videoPlayerController;
    // 新しい `VideoPlayerController` を初期化
    final videoUrl = state.videoList[videoIndex].videoUrl;
    try {
      final newController = VideoPlayerController.network(videoUrl);
      await newController.initialize();
      // 購読追加
      _addListener(newController);
      // 新しい `VideoPlayerController`
      state = state.copyWith(
        videoPlayerController: newController,
        playingStatus: PlayingStatus.ready,
      );
    } on PlatformException catch (e) {
      _handleError(e);
    }
    // 変更前の `VideoPlayerController` を破棄する
    if (oldController != null) {
      return oldController.dispose();
    }
  }

  /// 次の動画を再生する
  Future<void> playNext() async {
    final nextIndex = state.currentVideoIndex + 1;
    // 変更前の動画を破棄
    state = state.copyWith(
      playingStatus: PlayingStatus.preparing,
      currentVideoIndex: nextIndex,
    );
    // 変更前の `VideoPlayerController` を保持しておく
    final oldController = state.videoPlayerController;
    // 選択された動画のURLを取得する(nextIndexを使う)
    final videoUrl = state.videoList[nextIndex].videoUrl;
    // 新しい `VideoPlayerController` を初期化
    try {
      final newController = VideoPlayerController.network(videoUrl);
      await newController.initialize();
      // 購読追加
      _addListener(newController);
      // 再生
      await newController.play();
      // 新しい `VideoPlayerController`
      state = state.copyWith(
        videoPlayerController: newController,
        playingStatus: PlayingStatus.playing,
      );
    } on PlatformException catch (e) {
      _handleError(e);
    }
    // 変更前の `VideoPlayerController` を破棄する
    if (oldController != null) {
      return oldController.dispose();
    }
  }

  /// 動画を再生する
  Future<void> play() async {
    await state.videoPlayerController?.play();
    state = state.copyWith(playingStatus: PlayingStatus.playing);
  }

  /// 動画を一時停止する
  Future<void> pause() async {
    if (state.videoPlayerController?.position == null) {
      return;
    }
    final position = await state.videoPlayerController!.position;
    await state.videoPlayerController?.pause();
    state = state.copyWith(playingStatus: PlayingStatus.pausing);
    _updateSeekBarPosition(position!.inSeconds.toDouble());
  }

  /// 動画の再生位置を指定の位置に変更する
  Future<void> seekTo(double position) async {
    final duration = Duration(seconds: position.floor());
    await state.videoPlayerController?.seekTo(duration);
  }

  /// 動画を10秒送りする
  Future<void> forward10Seconds() async {
    final currentPosition = await state.videoPlayerController?.position;
    if (currentPosition == null) {
      return;
    }
    final target = currentPosition + const Duration(seconds: 10);
    await state.videoPlayerController?.seekTo(target);
    // 現在の再生時間表示を更新させるために使用する
    _updateSeekBarPosition(target.inSeconds.toDouble());
  }

  /// 動画を10秒戻しする
  Future<void> replay10Seconds() async {
    final currentPosition = await state.videoPlayerController?.position;
    if (currentPosition == null) {
      return;
    }
    final target = currentPosition + const Duration(seconds: -10);
    await state.videoPlayerController?.seekTo(target);
    // 現在の再生時間表示を更新させるために使用する
    _updateSeekBarPosition(target.inSeconds.toDouble());
  }

  /// 動画を再度再生する
  Future<void> replay() async {
    // 頭出ししてから再生する
    await state.videoPlayerController?.seekTo(Duration.zero);
    state = state.copyWith(playingStatus: PlayingStatus.preparing);
    await state.videoPlayerController?.play();
    state = state.copyWith(playingStatus: PlayingStatus.playing);
  }

  /// 全画面表示を切り替える
  Future<void> toggleFullScreen() async {
    final isFullScreen = state.isFullScreen;
    state = state.copyWith(isFullScreen: !isFullScreen);
  }

  /// シークバーの位置を更新する
  /// マイナスの値が指定された場合は `Slider` が表示できなくなるので `0` とする
  void _updateSeekBarPosition(double value) {
    _read(videoPositionSecondsProvider).state = value.isNegative ? 0 : value;
  }

  /// Exeption発生のため未使用
  void disposePlayer() {
    final player = state.videoPlayerController;
    if (player != null) {
      player.dispose();
      state = state.copyWith(
        videoPlayerController: null,
      );
    }
  }
}
