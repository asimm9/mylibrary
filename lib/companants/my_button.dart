import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylibrary/companants/constans/text_style.dart';
import 'package:mylibrary/pages/control_page.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final IconData? icon;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  MyButton({super.key, required this.text, this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        if (_auth.currentUser == null) {
          null;
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ControlPage(),
            ),
          );
        }
      },
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
