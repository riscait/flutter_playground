import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/theme_selector/theme_selector.dart';
import '../localizer/localizer.dart';

class ThemeSelectorPage extends StatelessWidget {
  const ThemeSelectorPage();

  static const String routeName = '/theme-selection';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Localized.of(context).themeSelector)),
      body: const SafeArea(
        child: ThemeListView(),
      ),
    );
  }
}

class ThemeListView extends ConsumerWidget {
  const ThemeListView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSelector = ref.watch(themeSelectorProvider.notifier);
    final currentThemeMode = ref.watch(themeSelectorProvider);
    return ListView.builder(
      itemCount: ThemeMode.values.length,
      itemBuilder: (_, index) {
        final themeMode = ThemeMode.values[index];
        return RadioListTile<ThemeMode>(
          value: themeMode,
          groupValue: currentThemeMode,
          onChanged: (newTheme) => themeSelector.changeAndSave(newTheme!),
          title: Text(themeMode.title),
          subtitle: Text(themeMode.subtitle),
          secondary: Icon(themeMode.iconData),
          controlAffinity: ListTileControlAffinity.platform,
        );
      },
    );
  }
}
