import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/cutom_video_player/custom_video_player.dart';
import 'video_player_page_controller.dart';

/// 動画プレイヤーと動画の関連情報を表示する画面
class VideoPlayerPage extends ConsumerWidget {
  const VideoPlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 全画面表示状態
    final isFullScreen = ref.watch(
        videoPlayerControllerProvider.select((state) => state.isFullScreen));
    // 全画面表示ならステータスバーを非表示にする
    isFullScreen
        ? SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom])
        : SystemChrome.setEnabledSystemUIOverlays([
            SystemUiOverlay.top,
            SystemUiOverlay.bottom,
          ]);
    return WillPopScope(
      onWillPop: () async {
        try {
          await ref.read(videoPlayerControllerProvider.notifier).pause();
          // ignore: avoid_catches_without_on_clauses
        } catch (_) {}
        return true;
      },
      child: Scaffold(
        appBar: isFullScreen ? null : AppBar(),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: isFullScreen ? 1 : 0,
                child: const VideoPlayerArea(),
              ),
              const DebugArea(),
            ],
          ),
        ),
      ),
    );
  }
}

class DebugArea extends ConsumerWidget {
  const DebugArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = ref.watch(videoPositionSecondsProvider).state;
    return Row(
      children: [
        Text(current.toString()),
      ],
    );
  }
}
