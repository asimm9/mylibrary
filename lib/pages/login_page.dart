// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/companants/text_style.dart';
import 'package:mylibrary/localizations/language/locale_keys.g.dart';
import 'package:mylibrary/localizations/string_extensions.dart';
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
              _loginText(),
              const SizedBox(height: 45),
              _email_form_field(size, context),
              const SizedBox(height: 15),
              _passwordField(size, context),
              _createNewAccount(onPressed, context),
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

  _createNewAccount(VoidCallback onPressed, BuildContext context) {
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

  SizedBox _passwordField(Size size, BuildContext context) {
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
            color: Theme.of(context).colorScheme.scrim,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
        maxLength: 6,
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

  SizedBox _email_form_field(Size size, BuildContext context) {
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
            color: Theme.of(context).colorScheme.scrim,
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

  Text _loginText() {
    return Text(
      LocaleKeys.login_register_logIn.locale,
      style: loginPageTextStyle,
    );
  }
}
