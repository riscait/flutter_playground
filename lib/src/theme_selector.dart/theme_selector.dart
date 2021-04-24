import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

import '../providers/shared_preferences.dart';

final themeSelectorProvider = StateNotifierProvider(
  (ref) => ThemeSelector(ref.read),
);

class ThemeSelector extends StateNotifier<ThemeMode> {
  ThemeSelector(this._read) : super(ThemeMode.system) {
    Future(() async {
      state = await _current;
    });
  }

  /// SharedPreferences で使用するテーマ保存用のキー
  static const themePrefsKey = 'selectedThemeKey';

  final Reader _read;

  /// 選択したテーマを保存するためのローカル保存領域
  SharedPreferences get _prefs => _read(sharedPreferencesProvider);

  /// テーマの変更と保存  を行う
  Future<void> changeAndSave(ThemeMode theme) async {
    await _prefs.setInt(themePrefsKey, theme.index);
    state = theme;
  }

  /// 記憶しているテーマを取得
  ThemeMode get _current {
    final index = _prefs.getInt(themePrefsKey) ?? ThemeMode.system.index;
    return ThemeMode.values.firstWhere(
      (e) => e.index == index,
      orElse: () => ThemeMode.system,
    );
  }
}
