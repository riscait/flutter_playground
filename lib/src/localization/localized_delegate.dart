import 'package:flutter/widgets.dart';

import 'localized.dart';

class LocalizedDelegate extends LocalizationsDelegate<Localized> {
  const LocalizedDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ja'].contains(locale.languageCode);

  @override
  Future<Localized> load(Locale locale) async => Localized(locale);

  @override
  bool shouldReload(covariant LocalizationsDelegate<Localized> old) => false;
}
