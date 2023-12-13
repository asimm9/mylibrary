// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mylibrary/localizations/language/locale_keys.g.dart';
import 'package:mylibrary/localizations/string_extensions.dart';

// ignore: must_be_immutable
class RegisterPasswordFormField extends StatelessWidget {
  Size size;
  TextEditingController passwordController;
  RegisterPasswordFormField({
    Key? key,
    required this.size,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.1,
      child: TextFormField(
        controller: passwordController,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          labelText: LocaleKeys.login_register_password.locale,
          labelStyle: TextStyle(
            height: 1.5,
            color: Colors.grey.shade600,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
        obscureText: true,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Şifre zorunludur!';
          }
          return null;
        },
      ),
    );
  }
}
