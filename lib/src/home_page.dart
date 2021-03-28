import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'awaitable_button/awaitable_button.dart';
import 'cutom_video_player/video_player_page.dart';
import 'list_and_fade_bar/list_and_fade_bar.dart';
import 'localization/localization.dart';
import 'stretchable_half_modal/stretchable_half_modal.dart';

class HomePage extends HookWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void navigateToPage(Widget page) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(Localized.of(context).homePageTitle),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: true,
            expandedHeight: 100.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(Localized.of(context).appName),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 64,
            delegate: SliverChildListDelegate.fixed(
              [
                ListTile(
                  title: Text(Localized.of(context).listAndFadeBar),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ListAndFadeBar()),
                  ),
                ),
                ListTile(
                  title: Text(Localized.of(context).customVideoPlayer),
                  onTap: () => navigateToPage(const VideoPlayerPage()),
                ),
                ListTile(
                  title: Text(Localized.of(context).strechableHalfModal),
                  onTap: () => navigateToPage(const StretchableHalfModal()),
                ),
                ListTile(
                  title: Text(Localized.of(context).awaitableButton),
                  onTap: () => navigateToPage(const AwaitableButtonPage()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
