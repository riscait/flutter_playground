import 'package:flutter/material.dart';

/// 連打防止のボタン
/// [onPressed]に非同期な関数を設定すると、実行中はインジケータを表示し押せなくなる
@immutable
class AwaitableButton extends StatefulWidget {
  const AwaitableButton({
    Key? key,
    required this.onPressed,
    required this.textLabel,
    this.executingLabel,
    this.height = 44,
    this.buttonStyle,
  }) : super(key: key);

  /// 押した時の動作
  final VoidCallback? onPressed;

  /// ボタンに表示するラベル文字列
  final String textLabel;

  /// 実行中に表示する文字列。nullなら表示しない
  final String? executingLabel;

  /// ボタンのスタイル設定。任意設定
  final ButtonStyle? buttonStyle;

  /// ボタンの高さ。defaultでは[44]
  final double height;

  @override
  _AwaitableButtonState createState() => _AwaitableButtonState();
}

class _AwaitableButtonState extends State<AwaitableButton> {
  var _isExecuting = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPressed,
      child: ElevatedButton(
        onPressed: widget.onPressed == null || _isExecuting ? null : _onPressed,
        style: widget.buttonStyle ??
            ButtonStyle(
              foregroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.onPrimary),
              backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.primary),
              elevation: MaterialStateProperty.all(0),
              shape: MaterialStateProperty.all(const StadiumBorder()),
              minimumSize: MaterialStateProperty.all(Size(
                double.infinity,
                widget.height,
              )),
            ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: _isExecuting
              ? widget.executingLabel == null
                  ? _Indicator(size: widget.height / 2)
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _Indicator(size: widget.height / 2),
                        const SizedBox(width: 8),
                        Text(widget.executingLabel!),
                      ],
                    )
              : Text(widget.textLabel),
        ),
      ),
    );
  }

  Future<void> _onPressed() async {
    if (_isExecuting) {
      // do nothing.
      return;
    }
    setState(() => _isExecuting = true);
    await Future(() => widget.onPressed?.call());
    setState(() => _isExecuting = false);
  }
}

/// 実行中に表示するインジケータ
class _Indicator extends StatelessWidget {
  const _Indicator({
    Key? key,
    required this.size,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.white),
        strokeWidth: 2,
      ),
    );
  }
}
