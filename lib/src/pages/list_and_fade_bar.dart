import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 表示用ダミーリストデータ
final list = List.generate(20, (index) => ListTile(title: Text('$index')));

/// 上部に表示するBarの表示・非表示状態を提供する
final barVisibleProvider = StateProvider((ref) => true);

/// ListViewのスクロール具合によって上部のBarが消えたり現れたりする
class ListAndFadeBar extends HookWidget {
  const ListAndFadeBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // HooksによるScrollControllerの生成・破棄
    final scrollController = useScrollController();
    // スクロールの状態を購読する
    void scrollListner() {
      // 表示・非表示を切り替えるスクロール位置の割合閾値
      const threshold = 0.1;
      // offset: 現在位置、 maxScrollExtent: スクロール可能最大位置
      final current =
          scrollController.offset / scrollController.position.maxScrollExtent;
      // 現在表示中なら `true`
      final _barVisible = context.read(barVisibleProvider).state;

      if (_barVisible &&
          current > threshold + 0.1 &&
          scrollController.position.userScrollDirection ==
              ScrollDirection.reverse) {
        // 現在表示中かつ、スクロールを進めて閾値を越えたら非表示にする
        context.read(barVisibleProvider).state = false;
      }
      if (!_barVisible &&
          scrollController.position.userScrollDirection ==
              ScrollDirection.forward) {
        // 現在非表示かつ、上方向にスクロールしたら再表示する
        context.read(barVisibleProvider).state = true;
      }
    }

    // 初回ビルド時にScrollControllerのリスナーを追加
    useEffect(() {
      scrollController.addListener(scrollListner);
      return () => scrollController.removeListener(scrollListner);
    }, [scrollController]);

    // Barの表示状態
    final barVisible = useProvider(barVisibleProvider).state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('List And Fade Bar'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // ListViewが下になるように先に配置
            ListView.separated(
              controller: scrollController,
              // 初期表示でListとBarが重ならないように余白を考慮
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 16),
              itemBuilder: (context, index) => list[index],
              separatorBuilder: (context, index) => const Divider(),
              itemCount: list.length,
            ),
            // 徐々に透明/不透明になるように AnimatedOpacity を使用
            AnimatedOpacity(
              opacity: barVisible ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: const _Bar(),
            ),
          ],
        ),
      ),
    );
  }
}

/// 検索中の文字列状態を提供する
final searchTextProvider = StateProvider((ref) => '');

/// Fade in / Fade out させたい Bar
class _Bar extends HookWidget {
  const _Bar({
    Key? key,
  }) : super(key: key);

  static const barSize = 44.0;

  @override
  Widget build(BuildContext context) {
    // 検索文字列の入力状態
    final searchText = useProvider(searchTextProvider).state;
    // TextField用のControllerをHooksで生成・破棄管理
    final controller = useTextEditingController(text: searchText);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        height: barSize,
        child: TextField(
          controller: controller,
          textInputAction: TextInputAction.done,
          onChanged: (text) => context.read(searchTextProvider).state = text,
          decoration: InputDecoration(
            hintText: '検索',
            filled: true,
            contentPadding: EdgeInsets.zero,
            prefixIcon: const Icon(Icons.search),
            suffixIcon: searchText.isEmpty
                ? null
                : IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      context.read(searchTextProvider).state = '';
                      controller.clear();
                    },
                  ),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(barSize / 2)),
            ),
          ),
        ),
      ),
    );
  }
}
