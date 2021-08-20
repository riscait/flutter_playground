import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'features/theme_selector/theme_provider.dart';
import 'localizer/localizer.dart';
import 'pages/home_page.dart';
import 'top_level_providers/navigator_key.dart';

class App extends HookConsumerWidget with WidgetsBindingObserver {
  const App({Key? key}) : super(key: key);

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
        debugPrint('Resumed App');
        break;
      case AppLifecycleState.inactive:
        debugPrint('Inactive App');
        break;
      case AppLifecycleState.paused:
        debugPrint('Paused App');
        break;
      case AppLifecycleState.detached:
        debugPrint('Detached App');
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(effect, const []);

    return MaterialApp(
      navigatorKey: ref.watch(navigatorKeyProvider),
      title: 'Flutter Playground by Riscait',
      themeMode: ref.watch(themeSelectorProvider),
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
