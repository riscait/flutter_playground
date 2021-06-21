import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

import 'package:flutter/material.dart';

class AnimatedHeart extends StatefulWidget {
  const AnimatedHeart({
    Key? key,
    required this.initialIsOn,
    required this.toggleToOn,
    required this.toggleToOff,
  }) : super(key: key);

  /// 初期表示状態
  final bool initialIsOn;

  /// `true` に切り替えた時の処理
  final VoidCallback toggleToOn;

  /// `false` に切り替えた時の処理
  final VoidCallback toggleToOff;

  @override
  _AnimatedHeartState createState() => _AnimatedHeartState();
}

class _AnimatedHeartState extends State<AnimatedHeart> {
  final riveFileName = 'assets/animations/heart.riv';
  final animationLike = 'like';
  final animationUnlike = 'unlike';
  final animationlikeIdle = 'like_idle';
  final animationUnlikeIdle = 'unlike_idle';

  Artboard? _artboard;
  late RiveAnimationController _controller;

  bool favorited = false;

  @override
  void initState() {
    super.initState();

    _loadRiveFile();
  }

  Future<void> _loadRiveFile() async {
    // 初期表示アニメーション
    final initialAnimation = SimpleAnimation(
        widget.initialIsOn ? animationlikeIdle : animationUnlikeIdle);
    favorited = widget.initialIsOn;
    // アニメーションファイルをバイナリーデータとして読み込む
    final data = await rootBundle.load(riveFileName);
    // バイナリーデータからRiveFileを読み込む
    final file = RiveFile.import(data);
    // アートボードはアニメーションのルートであり、Rive Widgetに描かれます
    final artboad = file.mainArtboard
      ..addController(_controller = initialAnimation);
    setState(() => _artboard = artboad);
  }

  /// Play
  void toggleToOn() {
    _artboard?.removeController(_controller);
    _artboard?.addController(_controller = SimpleAnimation(animationLike));
    setState(() => favorited = true);
    widget.toggleToOn();
  }

  /// Playback
  void toggleToOff() {
    _artboard?.removeController(_controller);
    _artboard?.addController(_controller = SimpleAnimation(animationUnlike));
    setState(() => favorited = false);
    widget.toggleToOff();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      margin: const EdgeInsets.all(8),
      child: TextButton(
        onPressed: favorited ? toggleToOff : toggleToOn,
        child:
            _artboard == null ? const SizedBox() : Rive(artboard: _artboard!),
      ),
    );
  }
}
