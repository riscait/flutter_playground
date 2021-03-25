import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';

@freezed
abstract class Message with _$Message {
  const factory Message({
    required String appName,
    required String homePageTitle,
    required String listAndFadeBar,
    required String customVideoPlayer,
  }) = _Message;

  factory Message.of(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return Message.en();
      case 'ja':
        return Message.ja();
    }
    throw AssertionError();
  }

  factory Message.en() => Message(
        appName: 'Flutter Playground',
        homePageTitle: 'Playground Home',
        listAndFadeBar: 'List And Fade Bar',
        customVideoPlayer: 'Custom Video Player',
      );

  factory Message.ja() => Message(
        appName: 'Flutter Playground',
        homePageTitle: 'ホーム',
        listAndFadeBar: 'FadeBarとListView',
        customVideoPlayer: 'カスタムVideoPlayer',
      );
}
