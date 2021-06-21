import 'package:flutter/material.dart';

import '../features/animator/rive_service.dart';
import '../localizer/localizer.dart';

class RivePage extends StatefulWidget {
  const RivePage({Key? key}) : super(key: key);

  @override
  _RivePageState createState() => _RivePageState();
}

class _RivePageState extends State<RivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Localized.of(context).riveAnimation),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                'assets/images/pakutaso/miagerukijineko171027_TP_V4.jpg',
                fit: BoxFit.fitHeight,
              ),
            ),
            AnimatedHeart(
              initialIsOn: false,
              toggleToOn: () => print,
              toggleToOff: () => print,
            ),
          ],
        ),
      ),
    );
  }
}
