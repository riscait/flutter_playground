import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../localizer/localizer.dart';
import 'api_client_page.dart';
import 'awaitable_button_page.dart';
import 'list_and_fade_bar.dart';
import 'list_or_grid_switcher.dart';
import 'pull_to_refresh_page.dart';
import 'rive_page.dart';
import 'stretchable_half_modal.dart';
import 'swipable_list_page/swipable_list_page.dart';
import 'theme_selector_page.dart';
import 'video_player_page.dart';

class HomePage extends HookWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void navigateToPage(Widget page) {
      Navigator.of(context).push<void>(MaterialPageRoute(builder: (_) => page));
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
            expandedHeight: 100,
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
                  onTap: () => Navigator.of(context).push<void>(
                    MaterialPageRoute(
                        builder: (context) => const ListAndFadeBar()),
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
                ListTile(
                  title: Text(Localized.of(context).listOrGridSwitcher),
                  onTap: () => navigateToPage(const ListOrGridSwitcherPage()),
                ),
                ListTile(
                  title: Text(Localized.of(context).apiClientPage),
                  onTap: () => navigateToPage(const ApiClientPage()),
                ),
                ListTile(
                  title: Text(Localized.of(context).themeSelector),
                  onTap: () => navigateToPage(const ThemeSelectorPage()),
                ),
                ListTile(
                  title: Text(Localized.of(context).pullToRefresh),
                  onTap: () => navigateToPage(const PullToRefreshPage()),
                ),
                ListTile(
                  title: Text(Localized.of(context).swipableList),
                  onTap: () => navigateToPage(const SwipableListPage()),
                ),
                ListTile(
                  title: Text(Localized.of(context).riveAnimation),
                  onTap: () => navigateToPage(const RivePage()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
