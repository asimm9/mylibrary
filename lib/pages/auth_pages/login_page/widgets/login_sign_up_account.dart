// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mylibrary/localizations/language/locale_keys.g.dart';
import 'package:mylibrary/localizations/string_extensions.dart';

// ignore: must_be_immutable
class SignUpAccount extends StatelessWidget {
  VoidCallback onPressed;
  SignUpAccount({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Text(
              LocaleKeys.login_register_alreadyYouHaveAnAccount.locale,
              style: TextStyle(
                  fontSize: 11, color: Theme.of(context).colorScheme.tertiary),
            ),
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                padding:
                    MaterialStateProperty.all(const EdgeInsets.only(right: 15)),
              ),
              onPressed: onPressed,
              child: Text(
                LocaleKeys.login_register_signUp.locale,
                style: const TextStyle(fontSize: 12, color: Colors.blueAccent),
              ),
            ),
          ],
        ),
        Expanded(
          child: TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () {},
            child: Text(
              LocaleKeys.login_register_forgotPassword.locale,
              style: TextStyle(
                  fontSize: 11, color: Theme.of(context).colorScheme.tertiary),
            ),
          ),
        ),
      ],
    );
  }
}
