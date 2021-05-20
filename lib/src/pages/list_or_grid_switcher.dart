import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../localizer/localizer.dart';

class ListOrGridSwitcherPage extends HookWidget {
  const ListOrGridSwitcherPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Localized.of(context).listOrGridSwitcher),
      ),
      body: const SafeArea(child: ListOrGrid()),
    );
  }
}

enum _DisplayMode {
  list,
  grid,
}

final displayModeProvider = StateProvider((ref) => _DisplayMode.list);

class ListOrGrid extends HookWidget {
  const ListOrGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayMode = useProvider(displayModeProvider).state;
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        displayMode == _DisplayMode.list
            ? const _ListView()
            : const _GridView(),
        const _ModeSelector(),
      ],
    );
  }
}

class _ModeSelector extends HookWidget {
  const _ModeSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayMode = useProvider(displayModeProvider).state;
    return Container(
      padding: const EdgeInsets.only(right: 16, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ChoiceChip(
            label: const Icon(Icons.list_alt),
            selected: displayMode == _DisplayMode.list,
            onSelected: (isOn) => isOn
                ? context.read(displayModeProvider).state = _DisplayMode.list
                : null,
          ),
          const SizedBox(width: 8),
          ChoiceChip(
            label: const Icon(Icons.grid_on),
            selected: displayMode == _DisplayMode.grid,
            onSelected: (isOn) => isOn
                ? context.read(displayModeProvider).state = _DisplayMode.grid
                : null,
          ),
        ],
      ),
    );
  }
}

class _ListView extends StatelessWidget {
  const _ListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemList.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final item = itemList[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 16,
          ),
          leading: Image.asset(
            item.imageSrc,
            width: 80,
            fit: BoxFit.cover,
          ),
          title: Text(item.title),
        );
      },
    );
  }
}

class _GridView extends StatelessWidget {
  const _GridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const marginSpacing = 8.0;
    const paddingSpacing = 8.0;
    const imageAspect = 3 / 4;
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width ~/ 128;
    final imageHeight =
        (width / crossAxisCount - marginSpacing - paddingSpacing * 2) *
            imageAspect;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: marginSpacing,
        mainAxisSpacing: marginSpacing,
      ),
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        final item = itemList[index];
        return Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(paddingSpacing),
          color: Theme.of(context).colorScheme.surface,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                item.imageSrc,
                width: double.infinity,
                height: imageHeight,
                fit: BoxFit.cover,
              ),
              Center(child: Text(item.title)),
            ],
          ),
        );
      },
    );
  }
}

class Item {
  const Item({
    required this.title,
    required this.imageSrc,
  });

  final String title;
  final String imageSrc;
}

final itemList = List.generate(
  20,
  (index) => Item(title: 'No. $index', imageSrc: pakutasoImages[index]),
);

final pakutasoImages = [
  'assets/images/pakutaso/KAZUHIRO171013003_TP_V4.jpg',
  'assets/images/pakutaso/KAZUHIRO171013104_TP_V4.jpg',
  'assets/images/pakutaso/KAZUHIRO171013187_TP_V4.jpg',
  'assets/images/pakutaso/miagerukijineko171027_TP_V4.jpg',
  'assets/images/pakutaso/nyannko458A3673_TP_V4.jpg',
  'assets/images/pakutaso/nyannko458A3685_TP_V4.jpg',
  'assets/images/pakutaso/SSK_utoutosuruneko_TP_V4.jpg',
  'assets/images/pakutaso/tomneko1215A1325_TP_V4.jpg',
  // repeatig
  'assets/images/pakutaso/KAZUHIRO171013003_TP_V4.jpg',
  'assets/images/pakutaso/KAZUHIRO171013104_TP_V4.jpg',
  'assets/images/pakutaso/KAZUHIRO171013187_TP_V4.jpg',
  'assets/images/pakutaso/miagerukijineko171027_TP_V4.jpg',
  'assets/images/pakutaso/nyannko458A3673_TP_V4.jpg',
  'assets/images/pakutaso/nyannko458A3685_TP_V4.jpg',
  'assets/images/pakutaso/SSK_utoutosuruneko_TP_V4.jpg',
  'assets/images/pakutaso/tomneko1215A1325_TP_V4.jpg',
  // repeatig
  'assets/images/pakutaso/KAZUHIRO171013003_TP_V4.jpg',
  'assets/images/pakutaso/KAZUHIRO171013104_TP_V4.jpg',
  'assets/images/pakutaso/KAZUHIRO171013187_TP_V4.jpg',
  'assets/images/pakutaso/miagerukijineko171027_TP_V4.jpg',
  'assets/images/pakutaso/nyannko458A3673_TP_V4.jpg',
  'assets/images/pakutaso/nyannko458A3685_TP_V4.jpg',
  'assets/images/pakutaso/SSK_utoutosuruneko_TP_V4.jpg',
  'assets/images/pakutaso/tomneko1215A1325_TP_V4.jpg',
];
