import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'features/theme_selector/theme_provider.dart';
import 'localizer/localizer.dart';
import 'pages/home_page.dart';
import 'top_level_providers/navigator_key.dart';

class App extends HookWidget with WidgetsBindingObserver {
  Dispose effect() {
    WidgetsBinding.instance!.addObserver(this);
    return onDispose;
  }

  void onDispose() {
    WidgetsBinding.instance!.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        print('Resumed App');
        break;
      case AppLifecycleState.inactive:
        print('Inactive App');
        break;
      case AppLifecycleState.paused:
        print('Paused App');
        break;
      case AppLifecycleState.detached:
        print('Detached App');
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    useEffect(effect, const []);

    return MaterialApp(
      navigatorKey: useProvider(navigatorKeyProvider),
      title: 'Flutter Playground by Riscait',
      themeMode: useProvider(themeSelectorProvider),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
      localizationsDelegates: const [
        LocalizedDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ja', ''),
      ],
    );
  }
}
