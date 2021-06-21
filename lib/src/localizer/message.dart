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
    required String apiClientPage,
    required String themeSelector,
    required String pullToRefresh,
    required String swipableList,
    required String riveAnimation,
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

  factory Message.en() => const Message(
        appName: 'Flutter Playground',
        homePageTitle: 'Playground Home',
        listAndFadeBar: 'List And Fade Bar',
        customVideoPlayer: 'Custom Video Player',
        strechableHalfModal: 'Strechable Half-Modal',
        awaitableButton: 'Exclusive Button',
        awaitableButtonDescription:
            '''When the button is tapped, the indicator will start spinning inside the button and it will become untappable. When the asynchronous function passed to [onPressed] finishes, the button will become tapable again.''',
        listOrGridSwitcher: 'List or Grid Switcher',
        apiClientPage: 'API Client and Repository',
        themeSelector: 'Theme Selector',
        pullToRefresh: 'Pull-to-refresh',
        swipableList: 'Swipable List',
        riveAnimation: 'Rive Animations',
      );

  factory Message.ja() => const Message(
        appName: 'Flutter Playground',
        homePageTitle: 'ホーム',
        listAndFadeBar: 'FadeBarとListView',
        customVideoPlayer: 'カスタムVideoPlayer',
        strechableHalfModal: '伸縮可能ハーフモーダル',
        awaitableButton: '連打防止Button',
        awaitableButtonDescription:
            '''ボタンをタップすると、ボタン内でインジケータが回り始めてタップできなくなる。[onPressed]に渡した非同期関数が終了すると、再度タップ可能になる。''',
        listOrGridSwitcher: 'List/Grid表示切り替え',
        apiClientPage: 'APIのClientとRepository',
        themeSelector: 'Themeの切り替え',
        pullToRefresh: '引っ張って更新',
        swipableList: 'スワイプ可能リストアイテム',
        riveAnimation: 'Rive アニメ デモ',
      );
}
