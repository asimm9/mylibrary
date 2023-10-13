import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
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
          ]),
      body: Container(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.question_mark, size: 30),
              ),
              const Text('myLibrary',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.exit_to_app, size: 30),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(21, 0, 21, 0),
            height: height * 0.061,
            child: TextField(
              textAlign: TextAlign.center,
              controller: searchController,
              decoration: InputDecoration(
                  hintText: 'içerik ismini arayınız',
                  suffixIconColor: Colors.black,
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
          Padding(padding: EdgeInsets.all(height * 0.018)),
          Container(
            margin: EdgeInsets.fromLTRB(21, 0, 21, 0),
            height: height * 0.70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black38),
            ),
          )
        ],
      )),
    );
  }
}
