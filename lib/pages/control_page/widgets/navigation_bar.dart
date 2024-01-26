import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/providers/all_providers.dart';

class NavigatorBar extends ConsumerStatefulWidget {
  const NavigatorBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NavigatorBarState();
}

class _NavigatorBarState extends ConsumerState<NavigatorBar> {
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      activeColor: Theme.of(context).colorScheme.tertiary,
      color: Theme.of(context).colorScheme.onBackground,
      style: TabStyle.custom,
      top: -20,
      curveSize: 70,
      elevation: 0,
      items: const [
        TabItem(icon: CupertinoIcons.home),
        TabItem(icon: CupertinoIcons.add),
        TabItem(icon: CupertinoIcons.heart_fill)
      ],
      onTap: (index) {
        ref.watch(selectedIndexNavigatorBarProvider.notifier).state = index;
      },
    );
  }
}
