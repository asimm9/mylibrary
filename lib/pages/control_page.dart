import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
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
