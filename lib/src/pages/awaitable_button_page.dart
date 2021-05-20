import 'package:flutter/material.dart';

import '../common_widgets/common_widgets.dart';
import '../localizer/localized.dart';

class AwaitableButtonPage extends StatelessWidget {
  const AwaitableButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Localized.of(context).awaitableButton)),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(Localized.of(context).awaitableButtonDescription),
            AwaitableButton(
              onPressed: () async {
                print('Start');
                await Future<void>.delayed(const Duration(seconds: 3));
                print('end');
              },
              textLabel: 'START',
              executingLabel: 'Loading...',
            ),
          ],
        ),
      ),
    );
  }
}
