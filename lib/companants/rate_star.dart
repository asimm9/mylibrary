// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RateStar extends StatelessWidget {
  int starCount = 0;

  RateStar({
    Key? key,
    required this.starCount,
  }) : super(key: key);
  List<Icon> starList = [];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [...starFunction(starCount)],
    );
  }

  starFunction(starCount) {
    for (int i = 1; i <= 5; i++) {
      if (i <= starCount) {
        starList.add(
          const Icon(
            Icons.star,
            size: 15,
            color: Colors.yellow,
          ),
        );
      } else {
        starList.add(Icon(Icons.star, size: 15));
      }
    }
    return starList;
  }
}
