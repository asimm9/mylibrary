import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/pages/add_page/add_page.dart';
import 'package:mylibrary/pages/control_page/widgets/app_bar_widget.dart';
import 'package:mylibrary/pages/control_page/widgets/navigation_bar.dart';
import 'package:mylibrary/pages/favorite_page/favorites_page.dart';
import 'package:mylibrary/pages/home_page/home_page.dart';
import 'package:mylibrary/providers/all_providers.dart';

class ControlPage extends ConsumerStatefulWidget {
  const ControlPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ControlPageState();
}

class _ControlPageState extends ConsumerState<ControlPage> {
  List<Widget> pageList = [HomePage(), const AddForm(), FavoritesPage()];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final authProvider = ref.watch(authenticationProvider);
    final themeModeState = ref.read(themeModeProvider);

    return Scaffold(
        appBar: ControlPageAppBar(
            authProvider: authProvider,
            themeModeState: themeModeState,
            size: size),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: const NavigatorBar(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: pageList.elementAt(ref.watch(selectedIndexNavigatorBarProvider)));
  }
}
