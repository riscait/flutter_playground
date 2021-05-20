import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'message.dart';

class Localized {
  Localized(Locale locale) : message = Message.of(locale);

  final Message message;

  static Message of(BuildContext context) =>
      Localizations.of<Localized>(context, Localized)!.message;
}
