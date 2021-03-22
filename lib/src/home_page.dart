import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'cutom_video_player/video_player_page.dart';
import 'list_and_fade_bar/list_and_fade_bar.dart';

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
        title: const Text('SliverAppBar'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            floating: true,
            pinned: true,
            snap: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Demo'),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 64,
            delegate: SliverChildListDelegate.fixed(
              [
                ListTile(
                  title: Text('List And Fade Bar'),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ListAndFadeBar()),
                  ),
                ),
                ListTile(
                  title: Text('Custom Video Player'),
                  onTap: () => navigateToPage(const VideoPlayerPage()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
