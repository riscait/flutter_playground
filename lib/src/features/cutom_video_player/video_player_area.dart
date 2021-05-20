import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_playground/src/common_widgets/common_widgets.dart';
import 'package:flutter_playground/src/pages/video_player_page_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

import 'video_player_state.dart';

/// 動画プレイヤーに表示するシークバーの値の位置を提供する
final videoPositionSecondsProvider = StateProvider((ref) => 0.0);

class VideoPlayerArea extends HookWidget {
  const VideoPlayerArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playerState = useProvider(videoPlayerControllerProvider);
    final isFullScreen = playerState.isFullScreen;
    final isReady = playerState.playingStatus.isReady;
    final isPlaying = playerState.playingStatus == PlayingStatus.playing;
    final isPausing = playerState.playingStatus == PlayingStatus.pausing;
    final isFinished = playerState.playingStatus == PlayingStatus.finished;
    if (playerState.playingStatus == PlayingStatus.preparing) {
      // 動画準備中の表示
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          color: Colors.black,
          child: const OverlayIndicator(),
        ),
      );
    }
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final aspectRatio =
        playerState.videoPlayerController?.value.aspectRatio ?? 0;
    // フルスクリーン表示への変化
    final transformation = _makeTransformation(aspectRatio: aspectRatio);
    return ColoredBox(
      color: Colors.black,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        transform: isFullScreen ? transformation : Matrix4.identity(),
        transformAlignment: Alignment.center,
        width: isFullScreen ? screenHeight : screenWidth,
        height: isFullScreen ? screenWidth : screenWidth / aspectRatio,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // プレイヤー部分全体のタップイベント
            GestureDetector(
              onTap: () => _onTapVideo(
                context,
                playerState.playingStatus,
              ),
              child: AspectRatio(
                aspectRatio: aspectRatio,
                child: Stack(
                  children: [
                    if (playerState.videoPlayerController != null)
                      VideoPlayer(playerState.videoPlayerController!),
                    // 黒オーバーレイ
                    if (!isPlaying)
                      IgnorePointer(
                        child: Container(
                          color: Colors.black26,
                        ),
                      ),
                    // 再生中・一時停止中のみダブルタップによる10秒送り・戻しが可能
                    if (isPlaying || isPausing)
                      const ReplayAndForwardTapDetector(),
                    // 再生準備完了時の表示
                    if (isReady) const PlayOverlayView(),
                    // 一時停止の時の表示
                    if (isPausing)
                      Positioned(
                        left: 0,
                        bottom: 0,
                        width: screenWidth,
                        child: const BottomControlView(),
                      ),
                    // 再生終了後の表示
                    if (isFinished) ...[
                      // リプレイボタン
                      Positioned(
                        left: 8,
                        bottom: 8,
                        child: TextButton.icon(
                          onPressed: context
                              .read(videoPlayerControllerProvider.notifier)
                              .replay,
                          icon: const Icon(
                            Icons.replay,
                            color: Colors.white,
                            size: 24,
                          ),
                          label: Text(
                            'もう一度再生する',
                            style: Theme.of(context).textTheme.button!.copyWith(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                          ),
                        ),
                      ),
                      const Positioned(
                        right: 0,
                        bottom: 16,
                        child: _NextVideoButton(),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// プレイヤー全体のタップイベント
  void _onTapVideo(
    BuildContext context,
    PlayingStatus playingStatus,
  ) {
    final controller = context.read(videoPlayerControllerProvider.notifier);
    switch (playingStatus) {
      case PlayingStatus.ready:
        controller.play();
        break;
      case PlayingStatus.preparing:
        break;
      case PlayingStatus.playing:
        controller.pause();
        break;
      case PlayingStatus.pausing:
        controller.play();
        break;
      case PlayingStatus.finished:
        // 個別のボタンに任せるため、画面タップ自体では何もしない
        break;
    }
  }

  /// フルスクリーンアニメーション用の変化を作成する
  Matrix4? _makeTransformation({double? aspectRatio}) {
    if (aspectRatio == null) {
      return null;
    }
    // 回転前の動画幅と回転後の動画高さを同じにする
    return Matrix4.diagonal3Values(
      aspectRatio,
      aspectRatio,
      1,
    )..rotateZ(0.5 * pi); // 90°回転
  }
}

/// タップジェスチャーを検知して送り・戻しを実行する
class ReplayAndForwardTapDetector extends HookWidget {
  const ReplayAndForwardTapDetector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SeekFeedbackTransition(
            isStartSide: true,
            execute: context
                .read(videoPlayerControllerProvider.notifier)
                .replay10Seconds,
          ),
        ),
        Expanded(
          child: SeekFeedbackTransition(
            isStartSide: false,
            execute: context
                .read(videoPlayerControllerProvider.notifier)
                .forward10Seconds,
          ),
        ),
      ],
    );
  }
}

/// 送り・戻しをアニメーションでフィードバックするための表示
class SeekFeedbackTransition extends HookWidget {
  const SeekFeedbackTransition({
    Key? key,
    this.isStartSide = true,
    required this.execute,
  }) : super(key: key);

  final bool isStartSide;
  final Function execute;

  static const radius = Radius.elliptical(270, 360);

  @override
  Widget build(BuildContext context) {
    final animationController =
        useAnimationController(duration: const Duration(milliseconds: 500));
    return GestureDetector(
      onDoubleTap: () async {
        execute();
        await animationController.forward();
        await animationController.reverse();
      },
      child: FadeTransition(
        opacity: animationController.drive(Tween(
          begin: 0,
          end: 1,
        )),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(150),
            borderRadius: BorderRadiusDirectional.horizontal(
              start: isStartSide ? Radius.zero : radius,
              end: isStartSide ? radius : Radius.zero,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isStartSide ? Icons.fast_rewind : Icons.fast_forward,
                color: Colors.white,
                size: 44,
              ),
              Text(
                '10秒',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 再生できることを示すView
class PlayOverlayView extends HookWidget {
  const PlayOverlayView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const IgnorePointer(
      child: Center(
        child: Icon(
          Icons.play_circle_fill_rounded,
          color: Colors.white,
          size: 64,
        ),
      ),
    );
  }
}

/// 再生ボタンや動画時間などのコントロールを担うエリア
class BottomControlView extends HookWidget {
  const BottomControlView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      verticalDirection: VerticalDirection.up,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
              onPressed:
                  context.read(videoPlayerControllerProvider.notifier).play,
            ),
            const _DurationText(),
            const Spacer(),
            TextButton.icon(
              onPressed: context
                  .read(videoPlayerControllerProvider.notifier)
                  .replay10Seconds,
              icon: const Icon(
                Icons.fast_rewind,
                color: Colors.white,
              ),
              label: Text(
                '10秒戻る',
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.white),
              ),
            ),
            TextButton.icon(
              onPressed: context
                  .read(videoPlayerControllerProvider.notifier)
                  .forward10Seconds,
              label: const Icon(
                Icons.fast_forward,
                color: Colors.white,
              ),
              icon: Text(
                '10秒進む',
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.white),
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.fullscreen),
              alignment: Alignment.centerRight,
              color: Colors.white,
              onPressed: context
                  .read(videoPlayerControllerProvider.notifier)
                  .toggleFullScreen,
            ),
          ],
        ),
        const SizedBox(
          height: 12,
          child: _SeekBar(),
        ),
      ],
    );
  }
}

/// 次の動画を再生するボタン
class _NextVideoButton extends HookWidget {
  const _NextVideoButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentVideoIndex = useProvider(
        videoPlayerControllerProvider.select((s) => s.currentVideoIndex));
    final videoList =
        useProvider(videoPlayerControllerProvider.select((s) => s.videoList));
    final numberOfVideos = videoList.length;
    if (numberOfVideos <= currentVideoIndex) {
      // 次の動画がないならこのボタンは表示ししない
      return const SizedBox();
    }
    return GestureDetector(
      onTap: () =>
          context.read(videoPlayerControllerProvider.notifier).playNext(),
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 2, 8, 4),
        color: Colors.black87,
        child: Row(
          children: [
            Text(
              '次の動画を再生する',
              style: Theme.of(context).textTheme.button!.copyWith(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

/// Durationを以下の形式の文字列に変換して表示するためのWidget
/// 時間があるときは `1:05:30` (時間：分：秒)
/// 時間がないときは `5:30` （分：秒）
class _DurationText extends HookWidget {
  const _DurationText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videoPlayerController = useProvider(
        videoPlayerControllerProvider.select((s) => s.videoPlayerController));
    final currentSeek = useProvider(videoPositionSecondsProvider).state;
    final videoDuration =
        videoPlayerController?.value.duration ?? Duration.zero;
    return Text(
      '${_stringFromSeconds(currentSeek)}/${_stringFromDuration(videoDuration)}',
      style: Theme.of(context).textTheme.caption!.copyWith(
            color: Colors.white,
            fontSize: 10,
          ),
    );
  }

  String _stringFromSeconds(double seconds) {
    final duration = Duration(seconds: seconds.floor());
    return _stringFromDuration(duration);
  }

  /// 動画の時間を、0埋めした 分:秒 または 時:分:秒 の文字列に変換して返す
  String _stringFromDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = hours == 0
        ? duration.inMinutes
        : duration.inMinutes.toString().padLeft(2, '0');
    final seconds =
        (duration.inSeconds - duration.inMinutes * Duration.secondsPerMinute)
            .toString()
            .padLeft(2, '0');
    return hours == 0 ? '$minutes:$seconds' : '$hours:$minutes:$seconds';
  }
}

/// 動画の再生位置を示す線形インジケータ
class _SeekBar extends HookWidget {
  const _SeekBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final duration = useProvider(videoPlayerControllerProvider
            .select((state) => state.videoPlayerController?.value.duration)) ??
        Duration.zero;
    final max = duration.inSeconds.toDouble();
    final current = useProvider(videoPositionSecondsProvider).state;
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 2,
        trackShape: _CustomTrackShape(),
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
      ),
      child: Slider(
        min: 0,
        max: max,
        value: current,
        activeColor: const Color(0xFFFD4425),
        inactiveColor: const Color(0xFFC4C4C4),
        // value: positonInt / durationInt,
        onChangeStart: (positon) => print('Start Sliding'),
        // シークバーをドラッグして移動させたらStateProviderに反映させる
        onChanged: (position) =>
            context.read(videoPositionSecondsProvider).state = position,
        // Sliderで位置を変更し終わったら、再生位置を変更して
        onChangeEnd: (position) => context
            .read(videoPlayerControllerProvider.notifier)
            .seekTo(position),
        // divisions: 1,
      ),
    );
  }
}

/// デフォルトのSliderThemeでは両端に余白ができるためカスタムクラスを作成
class _CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final height = sliderTheme.trackHeight ?? 2;
    final left = offset.dx;
    final top = (parentBox.size.height - (sliderTheme.trackHeight ?? 2)) / 2;
    final width = parentBox.size.width;
    return Rect.fromLTWH(left, top, width, height);
  }
}
