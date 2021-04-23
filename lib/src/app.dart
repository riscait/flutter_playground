import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'home_page.dart';
import 'localization/localization.dart';
import 'providers/navigator_key.dart';

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: useProvider(navigatorKeyProvider),
      title: 'Flutter Playground by Riscait',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
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
