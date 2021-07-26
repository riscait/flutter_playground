import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:collection/collection.dart';
import 'src/app.dart';
import 'src/top_level_providers/flavor.dart';
import 'src/top_level_providers/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ビルド時に指定したFlavorを取得（未指定の場合は development とする）
  const flavorString = String.fromEnvironment('FLAVOR');
  final flavor = Flavor.values.firstWhereOrNull((e) => e.key == flavorString) ??
      Flavor.development;

  runApp(
    ProviderScope(
      overrides: [
        flavorProvider.overrideWithValue(flavor),
        sharedPreferencesProvider.overrideWithValue(
          await SharedPreferences.getInstance(),
        ),
      ],
      child: App(),
    ),
  );
}
