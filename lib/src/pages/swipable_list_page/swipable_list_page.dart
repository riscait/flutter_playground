import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../localizer/localizer.dart';
import 'swipable_list_page_controller.dart';
import 'swipable_list_page_state.dart';

class SwipableListPage extends ConsumerWidget {
  const SwipableListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final items = watch(swipableListPageControllerProvider).items;
    return Scaffold(
      appBar: AppBar(
        title: Text(Localized.of(context).swipableList),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _Cell(
            index: index,
            item: items[index],
          );
        },
      ),
    );
  }
}

class _Cell extends ConsumerWidget {
  const _Cell({
    Key? key,
    required this.index,
    required this.item,
  }) : super(key: key);

  final int index;
  final SwipableListItem item;

  Future<bool?> confirmDismiss(DismissDirection direction) async {
    print('confirmDismiss!!!');
    return true;
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final controller = watch(swipableListPageControllerProvider.notifier);
    return Dismissible(
      key: Key('${item.titleLabel}'),
      background: const DeletableBackground(),
      secondaryBackground: const DeletableBackground(),
      onDismissed: (direction) => controller.onDismissed(
        direction: direction,
        index: index,
        item: item,
      ),
      confirmDismiss: confirmDismiss,
      child: ListTile(
        title: Text('${item.titleLabel}'),
      ),
    );
  }
}

/// スワイプで削除できるアイテムのWidget
class DeletableBackground extends StatelessWidget {
  // Constructor
  const DeletableBackground({
    Key? key,
    this.label = 'Delete',
    this.margin = const EdgeInsets.all(0),
    this.alignment = Alignment.centerLeft,
    this.borderRadius,
  }) : super(key: key);

  /// 表示する文字列。デフォルトは `Delete`
  final String label;
  final EdgeInsetsGeometry margin;
  final Alignment alignment;
  // どの角にどのくらいの角丸を施すか
  final BorderRadius? borderRadius;

  // Methods
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      alignment: alignment,
      margin: margin,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: borderRadius ?? BorderRadius.circular(0),
      ),
      child: Text(
        label,
        style: theme.textTheme.bodyText1!.copyWith(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
