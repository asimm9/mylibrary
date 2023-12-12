// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mylibrary/localizations/language/locale_keys.g.dart';
import 'package:mylibrary/localizations/string_extensions.dart';

// ignore: must_be_immutable
class RegisterSignInAccount extends StatelessWidget {
  VoidCallback onPressed;
  RegisterSignInAccount({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () => onPressed,
            child: Text(
              LocaleKeys.login_register_alreadyYouHaveAnAccount.locale,
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ),
          TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              padding: MaterialStateProperty.all(
                const EdgeInsets.only(right: 20),
              ),
            ),
            child: Text(
              LocaleKeys.login_register_signIn.locale,
              style: const TextStyle(color: Colors.blueAccent),
            ),
          )
        ],
      ),
    );
  }
}
