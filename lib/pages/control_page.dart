import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mylibrary/pages/add_page.dart';
import 'package:mylibrary/pages/favorites_page.dart';
import 'package:mylibrary/pages/home_page.dart';

class ControlPage extends StatefulWidget {
  ControlPage({super.key});

  @override
  State<ControlPage> createState() => _HomePageState();
}

class _HomePageState extends State<ControlPage> {
  List<Widget> pageList = [HomePage(), AddPage(), FavoritesPage()];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
          actions: [
            PopupMenuButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onSelected: (value) {},
              itemBuilder: (context) {
                return const [
                  PopupMenuItem(
                      child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.dark_mode, color: Colors.black),
                      Text('Karanlık mod')
                    ],
                  )),
                  PopupMenuItem(
                      child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.info, color: Colors.black),
                      Text('Hakkında')
                    ],
                  )),
                  PopupMenuItem(
                      child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.logout, color: Colors.black),
                      Text('Çıkış yap')
                    ],
                  ))
                ];
              },
            )
            /* IconButton(
              onPressed: () {
                
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ), */
          ],
        ),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: ConvexAppBar(
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
        ),
        body: pageList.elementAt(_selectedIndex));
  }
}
