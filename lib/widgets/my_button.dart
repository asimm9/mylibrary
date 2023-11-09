import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/companants/constans/text_style.dart';

class MyButton extends ConsumerWidget {
  final String text;
  final void Function() onTap;
  final IconData? icon;
  const MyButton(
      {super.key, required this.text, required this.onTap, this.icon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: size.height * 0.07,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.black,
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
