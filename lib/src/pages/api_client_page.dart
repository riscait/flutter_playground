import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/api_client/api_repositoy.dart';
import '../localizer/localizer.dart';

class ApiClientPage extends StatelessWidget {
  const ApiClientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Localized.of(context).apiClientPage)),
      body: const SafeArea(child: _Content()),
    );
  }
}

class _Content extends HookWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repository = useProvider(apiRepositoryProvider);
    final future = useMemoized(() => repository.fetchUser('riscait'));
    final snapshot = useFuture(future, initialData: null);
    if (snapshot.hasError) {
      return ErrorWidget(snapshot.error!);
    }
    if (!snapshot.hasData) {
      return const Center(child: CircularProgressIndicator());
    }
    final user = snapshot.data!;
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      children: [
        ListTile(
          title: const Text('login'),
          subtitle: Text('${user.login}'),
        ),
        ListTile(
          title: const Text('id'),
          subtitle: Text('${user.id}'),
        ),
        ListTile(
          title: const Text('html_url'),
          subtitle: Text('${user.htmlUrl}'),
        ),
      ],
    );
  }
}
