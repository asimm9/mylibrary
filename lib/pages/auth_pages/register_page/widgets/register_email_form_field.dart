// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mylibrary/localizations/language/locale_keys.g.dart';
import 'package:mylibrary/localizations/string_extensions.dart';

// ignore: must_be_immutable
class RegisterEmailFormField extends StatelessWidget {
  Size size;
  TextEditingController emailController;
  RegisterEmailFormField({
    Key? key,
    required this.size,
    required this.emailController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.07,
      child: TextFormField(
        controller: emailController,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          labelText: LocaleKeys.login_register_email.locale,
          labelStyle: TextStyle(
            height: 1.5,
            color: Colors.grey.shade600,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'E-posta zorunludur!';
          }
          return null;
        },
      ),
    );
  }
}
