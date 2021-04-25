import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'pages/home_page.dart';
import 'localizer/localizer.dart';
import 'providers/navigator_key.dart';
import 'features/theme_selector/theme_provider.dart';

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final themeMode = useProvider(themeSelectorProvider);
    return MaterialApp(
      navigatorKey: useProvider(navigatorKeyProvider),
      title: 'Flutter Playground by Riscait',
      theme: themeMode == ThemeMode.dark ? ThemeData.dark() : ThemeData.light(),
      darkTheme: themeMode == ThemeMode.system ? ThemeData.dark() : null,
      home: HomePage(),
      localizationsDelegates: [
        const LocalizedDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('ja', ''),
      ],
    );
  }
}
