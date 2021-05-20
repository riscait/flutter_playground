import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

import '../localizer/localizer.dart';

final _githubUserProvider =
    FutureProvider.family<Map<String, Object?>, String>((ref, username) async {
  final response = await http.get(Uri.https(
    'api.github.com',
    'users/$username',
  ));
  print(response.body);
  return json.decode(response.body) as Map<String, Object?>;
});

class PullToRefreshPage extends StatelessWidget {
  const PullToRefreshPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Localized.of(context).pullToRefresh)),
      body: const SafeArea(child: _Content()),
    );
  }
}

class _Content extends ConsumerWidget {
  const _Content({Key? key}) : super(key: key);

  static const username = 'Riscait';

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return watch(_githubUserProvider(username)).when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error, $stack')),
      data: (user) {
        return RefreshIndicator(
          onRefresh: () => context.refresh(_githubUserProvider(username)),
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            children: [
              ListTile(
                title: const Text('login'),
                subtitle: Text('${user['login'] ?? 'none'}'),
              ),
              ListTile(
                title: const Text('id'),
                subtitle: Text('${user['id'] ?? 'none'}'),
              ),
              ListTile(
                title: const Text('html_url'),
                subtitle: Text('${user['html_url'] ?? 'none'}'),
              ),
            ],
          ),
        );
      },
    );
  }
}
