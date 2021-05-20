import 'package:flutter/material.dart';

import '../localizer/localizer.dart';

class StretchableHalfModal extends StatelessWidget {
  const StretchableHalfModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Localized.of(context).strechableHalfModal)),
      body: Stack(
        children: const [
          _HalfModal(),
        ],
      ),
    );
  }
}

class _HalfModal extends StatelessWidget {
  const _HalfModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.25,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
          ),
          child: ListView.separated(
            controller: scrollController,
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text('$index'),
            ),
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        );
      },
    );
  }
}
