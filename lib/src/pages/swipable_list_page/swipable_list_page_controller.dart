import 'package:flutter/material.dart';
import 'package:flutter_playground/src/pages/swipable_list_page/swipable_list_page_state.dart';
import 'package:flutter_playground/src/top_level_providers/navigator_key.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Provider
final swipableListPageControllerProvider = StateNotifierProvider.autoDispose<
    SwipableListPageController,
    SwipableListPageState>((ref) => SwipableListPageController(ref.read));

/// Controller
class SwipableListPageController extends StateNotifier<SwipableListPageState> {
  SwipableListPageController(this._read)
      : super(const SwipableListPageState()) {
    _fetchItems();
  }

  /// 他のProviderを読み込む
  final Reader _read;
  late final GlobalKey<NavigatorState> _navigatorKey =
      _read(navigatorKeyProvider);

  // Functions
  // ---------------------------------------------------------------------------

  void _fetchItems() {
    state = state.copyWith(items: const [
      SwipableListItem(titleLabel: 'A'),
      SwipableListItem(titleLabel: 'B'),
      SwipableListItem(titleLabel: 'C'),
    ]);
  }

  void onDismissed({
    required DismissDirection direction,
    required int index,
    required SwipableListItem item,
  }) {
    print('onDismissed!!!');
    state = state.copyWith(items: state.items..removeAt(index));
    ScaffoldMessenger.of(_navigatorKey.currentState!.context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: const Text('action'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            state = state.copyWith(items: state.items..insert(index, item));
          },
        ),
      ));
  }
}
