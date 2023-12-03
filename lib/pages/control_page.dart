import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/companants/text_style.dart';
import 'package:mylibrary/pages/add_page.dart';
import 'package:mylibrary/pages/favorites_page.dart';
import 'package:mylibrary/pages/home_page.dart';
import 'package:mylibrary/providers/all_providers.dart';
import '../services/firebase_auth_service.dart';

class ControlPage extends ConsumerStatefulWidget {
  const ControlPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ControlPageState();
}

class _ControlPageState extends ConsumerState<ControlPage> {
  List<Widget> pageList = [HomePage(), const AddPage(), FavoritesPage()];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final authProvider = ref.watch(authenticationProvider);
    final themeModeState = ref.read(themeModeProvider);

    return Scaffold(
        appBar: _appBar(authProvider, themeModeState, size),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: _navigationBar(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: pageList.elementAt(_selectedIndex));
  }

  ConvexAppBar _navigationBar() {
    return ConvexAppBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      activeColor: Theme.of(context).colorScheme.tertiary,
      color: Theme.of(context).colorScheme.primary,
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
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }

  AppBar _appBar(FirebaseAuthService authProvider, ThemeProvider themeModeState,
      Size size) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'myLibrary',
        style: appBarTitleTextStyle,
      ),
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          helperShowDialog(size);
        },
        icon: Icon(
          Icons.question_mark,
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
      actions: [_popUpMenuButton(authProvider, themeModeState)],
    );
  }

  Future<dynamic> helperShowDialog(Size size) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.tertiary),
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Kapat',
              textAlign: TextAlign.center,
            ),
          ),
        ],
        insetPadding: EdgeInsets.symmetric(
            vertical: size.height * 0.25, horizontal: size.width * 0.06),
        title: const Text('Yardım'),
        content: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Icon(Icons.arrow_forward),
                  SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      'Detaylı görünüm elde etmek için istediğiniz kartın üstüne basınız',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.arrow_forward),
                  SizedBox(width: 5),
                  Flexible(
                    child: Text(
                        'Aratmak istediğiniz içeriği arama kısmına yazınız'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.arrow_forward),
                  SizedBox(width: 5),
                  Flexible(child: Text('Favorilerden çıkarmak için kaydırın')),
                ],
              ),
            ]),
      ),
    );
  }

  PopupMenuButton<dynamic> _popUpMenuButton(
      FirebaseAuthService authProvider, ThemeProvider themeModeProvider) {
    return PopupMenuButton(
      icon: Icon(Icons.menu, color: Theme.of(context).colorScheme.tertiary),
      onSelected: (value) {
        if (value == 3) {
          authProvider.signOut();
        }
        if (value == 1) {
          themeModeProvider.toggleThemeMode();
        }
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem(
              value: 1,
              child: Row(
                children: [
                  Icon(Icons.dark_mode,
                      color: Theme.of(context).colorScheme.tertiary),
                  const SizedBox(width: 10),
                  const Text('Karanlık mod')
                ],
              )),
          PopupMenuItem(
              value: 2,
              child: Row(
                children: [
                  Icon(Icons.info,
                      color: Theme.of(context).colorScheme.tertiary),
                  const SizedBox(width: 10),
                  const Text('Hakkında')
                ],
              )),
          PopupMenuItem(
              value: 3,
              child: Row(
                children: [
                  Icon(Icons.logout,
                      color: Theme.of(context).colorScheme.tertiary),
                  const SizedBox(width: 10),
                  const Text('Çıkış yap')
                ],
              ))
        ];
      },
    );
  }
}
