import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    final authProvider = ref.watch(authenticationProvider);

    return Scaffold(
        appBar: _appBar(authProvider),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: _navigationBar(),
        backgroundColor: const Color.fromRGBO(255, 250, 244, 1),
        body: pageList.elementAt(_selectedIndex));
  }

  ConvexAppBar _navigationBar() {
    return ConvexAppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      color: Colors.black,
      activeColor: Colors.black,
      items: const [
        TabItem(icon: Icons.home, title: 'Home'),
        TabItem(icon: Icons.add, title: 'Add'),
        TabItem(icon: Icons.favorite, title: 'Favorites')
      ],
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }

  AppBar _appBar(FirebaseAuthService authProvider) {
    return AppBar(
      centerTitle: true,
      title: const Text(
        'myLibrary',
        style: TextStyle(color: Colors.black),
      ),
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.question_mark,
          color: Colors.black,
        ),
      ),
      actions: [_popUpMenuButton(authProvider)],
    );
  }

  PopupMenuButton<dynamic> _popUpMenuButton(FirebaseAuthService authProvider) {
    return PopupMenuButton(
      icon: const Icon(Icons.menu, color: Colors.black),
      onSelected: (value) {
        if (value == 3) {
          authProvider.signOut();
        }
      },
      itemBuilder: (context) {
        return const [
          PopupMenuItem(
              value: 1,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.dark_mode, color: Colors.black),
                  Text('Karanlık mod')
                ],
              )),
          PopupMenuItem(
              value: 2,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.info, color: Colors.black),
                  Text('Hakkında')
                ],
              )),
          PopupMenuItem(
              value: 3,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.logout, color: Colors.black),
                  Text('Çıkış yap')
                ],
              ))
        ];
      },
    );
  }
}
