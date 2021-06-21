// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'swipable_list_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SwipableListPageStateTearOff {
  const _$SwipableListPageStateTearOff();

  _SwipableListPageState call(
      {List<SwipableListItem> items = const <SwipableListItem>[]}) {
    return _SwipableListPageState(
      items: items,
    );
  }
}

/// @nodoc
const $SwipableListPageState = _$SwipableListPageStateTearOff();

/// @nodoc
mixin _$SwipableListPageState {
  /// 読み込み中かどうか
  List<SwipableListItem> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SwipableListPageStateCopyWith<SwipableListPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwipableListPageStateCopyWith<$Res> {
  factory $SwipableListPageStateCopyWith(SwipableListPageState value,
          $Res Function(SwipableListPageState) then) =
      _$SwipableListPageStateCopyWithImpl<$Res>;
  $Res call({List<SwipableListItem> items});
}

/// @nodoc
class _$SwipableListPageStateCopyWithImpl<$Res>
    implements $SwipableListPageStateCopyWith<$Res> {
  _$SwipableListPageStateCopyWithImpl(this._value, this._then);

  final SwipableListPageState _value;
  // ignore: unused_field
  final $Res Function(SwipableListPageState) _then;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SwipableListItem>,
    ));
  }
}

/// @nodoc
abstract class _$SwipableListPageStateCopyWith<$Res>
    implements $SwipableListPageStateCopyWith<$Res> {
  factory _$SwipableListPageStateCopyWith(_SwipableListPageState value,
          $Res Function(_SwipableListPageState) then) =
      __$SwipableListPageStateCopyWithImpl<$Res>;
  @override
  $Res call({List<SwipableListItem> items});
}

/// @nodoc
class __$SwipableListPageStateCopyWithImpl<$Res>
    extends _$SwipableListPageStateCopyWithImpl<$Res>
    implements _$SwipableListPageStateCopyWith<$Res> {
  __$SwipableListPageStateCopyWithImpl(_SwipableListPageState _value,
      $Res Function(_SwipableListPageState) _then)
      : super(_value, (v) => _then(v as _SwipableListPageState));

  @override
  _SwipableListPageState get _value => super._value as _SwipableListPageState;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_SwipableListPageState(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SwipableListItem>,
    ));
  }
}

/// @nodoc

class _$_SwipableListPageState
    with DiagnosticableTreeMixin
    implements _SwipableListPageState {
  const _$_SwipableListPageState({this.items = const <SwipableListItem>[]});

  @JsonKey(defaultValue: const <SwipableListItem>[])
  @override

  /// 読み込み中かどうか
  final List<SwipableListItem> items;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SwipableListPageState(items: $items)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SwipableListPageState'))
      ..add(DiagnosticsProperty('items', items));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SwipableListPageState &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(items);

  @JsonKey(ignore: true)
  @override
  _$SwipableListPageStateCopyWith<_SwipableListPageState> get copyWith =>
      __$SwipableListPageStateCopyWithImpl<_SwipableListPageState>(
          this, _$identity);
}

abstract class _SwipableListPageState implements SwipableListPageState {
  const factory _SwipableListPageState({List<SwipableListItem> items}) =
      _$_SwipableListPageState;

  @override

  /// 読み込み中かどうか
  List<SwipableListItem> get items => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SwipableListPageStateCopyWith<_SwipableListPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SwipableListItemTearOff {
  const _$SwipableListItemTearOff();

  _SwipableListItem call({String titleLabel = ''}) {
    return _SwipableListItem(
      titleLabel: titleLabel,
    );
  }
}

/// @nodoc
const $SwipableListItem = _$SwipableListItemTearOff();

/// @nodoc
mixin _$SwipableListItem {
  String get titleLabel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SwipableListItemCopyWith<SwipableListItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwipableListItemCopyWith<$Res> {
  factory $SwipableListItemCopyWith(
          SwipableListItem value, $Res Function(SwipableListItem) then) =
      _$SwipableListItemCopyWithImpl<$Res>;
  $Res call({String titleLabel});
}

/// @nodoc
class _$SwipableListItemCopyWithImpl<$Res>
    implements $SwipableListItemCopyWith<$Res> {
  _$SwipableListItemCopyWithImpl(this._value, this._then);

  final SwipableListItem _value;
  // ignore: unused_field
  final $Res Function(SwipableListItem) _then;

  @override
  $Res call({
    Object? titleLabel = freezed,
  }) {
    return _then(_value.copyWith(
      titleLabel: titleLabel == freezed
          ? _value.titleLabel
          : titleLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SwipableListItemCopyWith<$Res>
    implements $SwipableListItemCopyWith<$Res> {
  factory _$SwipableListItemCopyWith(
          _SwipableListItem value, $Res Function(_SwipableListItem) then) =
      __$SwipableListItemCopyWithImpl<$Res>;
  @override
  $Res call({String titleLabel});
}

/// @nodoc
class __$SwipableListItemCopyWithImpl<$Res>
    extends _$SwipableListItemCopyWithImpl<$Res>
    implements _$SwipableListItemCopyWith<$Res> {
  __$SwipableListItemCopyWithImpl(
      _SwipableListItem _value, $Res Function(_SwipableListItem) _then)
      : super(_value, (v) => _then(v as _SwipableListItem));

  @override
  _SwipableListItem get _value => super._value as _SwipableListItem;

  @override
  $Res call({
    Object? titleLabel = freezed,
  }) {
    return _then(_SwipableListItem(
      titleLabel: titleLabel == freezed
          ? _value.titleLabel
          : titleLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SwipableListItem
    with DiagnosticableTreeMixin
    implements _SwipableListItem {
  const _$_SwipableListItem({this.titleLabel = ''});

  @JsonKey(defaultValue: '')
  @override
  final String titleLabel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SwipableListItem(titleLabel: $titleLabel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SwipableListItem'))
      ..add(DiagnosticsProperty('titleLabel', titleLabel));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SwipableListItem &&
            (identical(other.titleLabel, titleLabel) ||
                const DeepCollectionEquality()
                    .equals(other.titleLabel, titleLabel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(titleLabel);

  @JsonKey(ignore: true)
  @override
  _$SwipableListItemCopyWith<_SwipableListItem> get copyWith =>
      __$SwipableListItemCopyWithImpl<_SwipableListItem>(this, _$identity);
}

abstract class _SwipableListItem implements SwipableListItem {
  const factory _SwipableListItem({String titleLabel}) = _$_SwipableListItem;

  @override
  String get titleLabel => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SwipableListItemCopyWith<_SwipableListItem> get copyWith =>
      throw _privateConstructorUsedError;
}
