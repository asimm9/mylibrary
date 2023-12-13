// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/localizations/language/locale_keys.g.dart';
import 'package:mylibrary/localizations/string_extensions.dart';
import 'package:mylibrary/pages/auth_pages/login_page/widgets/login_page_email_form_field.dart';
import 'package:mylibrary/pages/auth_pages/login_page/widgets/login_page_title.dart';
import 'package:mylibrary/pages/auth_pages/login_page/widgets/login_password_form_field.dart';
import 'package:mylibrary/pages/auth_pages/login_page/widgets/login_sign_up_account.dart';
import 'package:mylibrary/widgets/my_button.dart';
import 'package:mylibrary/widgets/my_divider.dart';
import 'package:mylibrary/providers/all_providers.dart';

class LoginPage extends ConsumerWidget {
  final VoidCallback onPressed;
  LoginPage(this.onPressed, {super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SizedBox(
          width: size.width * 0.85,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginPageTitle(),
              const SizedBox(height: 45),
              LoginPageEmailFormField(
                  size: size, emailController: emailController),
              const SizedBox(height: 15),
              LoginPasswordFormfield(
                  size: size, passwordController: passwordController),
              SignUpAccount(onPressed: onPressed),
              const SizedBox(height: 15),
              MyButton(
                mycolor: Theme.of(context).colorScheme.tertiary,
                onTap: () {
                  ref
                      .watch(authenticationProvider.notifier)
                      .signIn(emailController.text, passwordController.text);
                },
                text: LocaleKeys.login_register_signIn.locale,
              ),
              const SizedBox(height: 15),
              const MyDivider(),
              const SizedBox(height: 15),
              MyButton(
                mycolor: Theme.of(context).colorScheme.tertiary,
                onTap: () {},
                text: LocaleKeys.login_register_continueWithGoogle.locale,
                icon: Icons.mail,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
