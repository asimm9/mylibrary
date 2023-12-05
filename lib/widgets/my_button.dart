import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/companants/text_style.dart';

class MyButton extends ConsumerWidget {
  final String text;
  final void Function() onTap;
  final IconData? icon;
  final Color mycolor;
  final double myheight;
  const MyButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.icon,
      this.mycolor = Colors.black,
      this.myheight = 0.07});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: size.height * myheight,
        width: size.width,
        decoration: BoxDecoration(
          color: mycolor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 30,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    text,
                    style: myButtonTextStyle,
                  ),
                ],
              )
            : Text(
                text,
                style: myButtonTextStyle,
              ),
      ),
    );
  }
}
