// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/localizations/language/locale_keys.g.dart';
import 'package:mylibrary/localizations/string_extensions.dart';
import 'package:mylibrary/pages/auth_pages/login_page/widgets/login_page_title.dart';
import 'package:mylibrary/pages/auth_pages/login_page/widgets/login_sign_up_account.dart';
import 'package:mylibrary/widgets/change_language.dart';
import 'package:mylibrary/widgets/my_button.dart';
import 'package:mylibrary/widgets/my_divider.dart';
import 'package:mylibrary/providers/all_providers.dart';
import 'package:mylibrary/widgets/my_snack_bar.dart';
import 'package:mylibrary/widgets/my_text_field.dart';

class LoginPage extends ConsumerWidget {
  final VoidCallback onPressed;
  LoginPage(this.onPressed, {super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [ChangeLanguage()],
      ),
      body: Center(
        child: SizedBox(
          width: size.width * 0.85,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LoginPageTitle(),
                  SizedBox(height: size.height * 0.1),
                  MyTextField(
                    textController: emailController,
                    hintText: LocaleKeys.login_register_email.locale,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    validatorFunction: (value) {
                      if (value != null) {
                        if (value.length > 5 &&
                            value.contains('@') &&
                            value.endsWith('.com')) {
                          return null;
                        }
                        return LocaleKeys
                            .validators_enterValidEmailAdress.locale;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  MyTextField(
                    textController: passwordController,
                    hintText: LocaleKeys.login_register_password.locale,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    maxLength: 6,
                    obscureText: true,
                    validatorFunction: (value) {
                      if (value!.isEmpty) {
                        return LocaleKeys.validators_enterPassword.locale;
                      }
                      return null;
                    },
                  ),
                  SignUpAccount(onPressed: onPressed),
                  const SizedBox(height: 15),
                  MyButton(
                    mycolor: Theme.of(context).colorScheme.tertiary,
                    onTap: () async {
                      try {
                        if (_formKey.currentState!.validate()) {
                          await ref
                              .watch(authenticationProvider.notifier)
                              .signIn(emailController.text,
                                  passwordController.text);
                        }
                      } on FirebaseException catch (error) {
                        if (error.code == 'invalid-credential') {
                          MySnackBar.snackBar(
                              context,
                              LocaleKeys.validators_wrongEmailOrPassword.locale,
                              2);
                        } else {
                          MySnackBar.snackBar(
                              context,
                              LocaleKeys.validators_loginPleaseTryAgain.locale,
                              2);
                        }
                      }
                    },
                    text: LocaleKeys.login_register_signIn.locale,
                  ),
                  const SizedBox(height: 15),
                  const MyDivider(),
                  const SizedBox(height: 15),
                  MyButton(
                    mycolor: Theme.of(context).colorScheme.tertiary,
                    onTap: () {
                      ref.watch(authenticationProvider).authWithGoogle();
                    },
                    text: LocaleKeys.login_register_continueWithGoogle.locale,
                    icon: Icons.mail,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
