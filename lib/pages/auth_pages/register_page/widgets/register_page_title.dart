import 'package:flutter/material.dart';
import 'package:mylibrary/companants/text_style.dart';
import 'package:mylibrary/localizations/language/locale_keys.g.dart';
import 'package:mylibrary/localizations/string_extensions.dart';

class RegisterPageTitle extends StatelessWidget {
  const RegisterPageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      LocaleKeys.login_register_register.locale,
      style: loginPageTextStyle,
    );
  }
}
