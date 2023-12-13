import 'package:flutter/material.dart';
import 'package:mylibrary/companants/text_style.dart';
import 'package:mylibrary/localizations/language/locale_keys.g.dart';
import 'package:mylibrary/localizations/string_extensions.dart';

class LoginPageTitle extends StatelessWidget {
  const LoginPageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      LocaleKeys.login_register_logIn.locale,
      style: loginPageTextStyle,
    );
  }
}
