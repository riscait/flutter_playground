import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'swipable_list_page_state.freezed.dart';

@freezed
class SwipableListPageState with _$SwipableListPageState {
  const factory SwipableListPageState({
    /// 読み込み中かどうか
    @Default(<SwipableListItem>[]) List<SwipableListItem> items,
  }) = _SwipableListPageState;
}

@freezed
class SwipableListItem with _$SwipableListItem {
  const factory SwipableListItem({
    @Default('') String titleLabel,
  }) = _SwipableListItem;
}
