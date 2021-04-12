import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';

@freezed
class Message with _$Message {
  const factory Message({
    required String appName,
    required String homePageTitle,
    required String listAndFadeBar,
    required String customVideoPlayer,
    required String strechableHalfModal,
    required String awaitableButton,
    required String awaitableButtonDescription,
    required String listOrGridSwitcher,
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
        strechableHalfModal: 'Strechable Half-Modal',
        awaitableButton: 'Exclusive Button',
        awaitableButtonDescription:
            'When the button is tapped, the indicator will start spinning inside the button and it will become untappable. When the asynchronous function passed to [onPressed] finishes, the button will become tapable again.',
        listOrGridSwitcher: 'List or Grid Switcher',
      );

  factory Message.ja() => Message(
        appName: 'Flutter Playground',
        homePageTitle: 'ホーム',
        listAndFadeBar: 'FadeBarとListView',
        customVideoPlayer: 'カスタムVideoPlayer',
        strechableHalfModal: '伸縮可能ハーフモーダル',
        awaitableButton: '連打防止Button',
        awaitableButtonDescription:
            'ボタンをタップすると、ボタン内でインジケータが回り始めてタップできなくなる。[onPressed]に渡した非同期関数が終了すると、再度タップ可能になる。',
        listOrGridSwitcher: 'List/Grid表示切り替え',
      );
}
