import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../localizer/localizer.dart';

final _githubApiProvider =
    Provider((_) => Dio(BaseOptions(baseUrl: 'https://api.github.com/')));

final _githubUserProvider = FutureProvider<Map<String, Object?>>((ref) async {
  final api = ref.watch(_githubApiProvider);
  final response = await api.get<Map<String, Object?>>('users/Riscait');
  print(response);
  return response.data!;
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

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return watch(_githubUserProvider).when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error, $stack')),
      data: (user) {
        return RefreshIndicator(
          onRefresh: () => context.refresh(_githubUserProvider),
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
