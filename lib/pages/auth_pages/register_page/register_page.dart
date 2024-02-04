// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/localizations/language/locale_keys.g.dart';
import 'package:mylibrary/localizations/string_extensions.dart';
import 'package:mylibrary/pages/auth_pages/register_page/widgets/register_page_title.dart';
import 'package:mylibrary/pages/auth_pages/register_page/widgets/register_sign_in_account.dart';
import 'package:mylibrary/widgets/my_button.dart';
import 'package:mylibrary/providers/all_providers.dart';
import 'package:mylibrary/widgets/my_snack_bar.dart';
import 'package:mylibrary/widgets/my_text_field.dart';

class RegisterPage extends ConsumerWidget {
  final VoidCallback onPressed;
  RegisterPage(this.onPressed, {super.key});
  final TextEditingController userNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SizedBox(
          width: size.width * 0.85,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  RegisterPageTitle(),
                  const SizedBox(height: 45),
                  MyTextField(
                    textController: userNameController,
                    hintText: LocaleKeys.login_register_user_name.locale,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    validatorFunction: (value) {
                      if (value!.isEmpty) {
                        return LocaleKeys.validators_enterUserName.locale;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
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
                  const SizedBox(height: 5),
                  MyTextField(
                    textController: confirmPasswordController,
                    hintText: LocaleKeys.login_register_confirmPassword.locale,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    maxLength: 6,
                    obscureText: true,
                    validatorFunction: (value) {
                      if (value!.isEmpty) {
                        return LocaleKeys
                            .validators_enterConfirmPassword.locale;
                      }
                      return null;
                    },
                  ),
                  RegisterSignInAccount(onPressed: onPressed),
                  const SizedBox(height: 15),
                  MyButton(
                    mycolor: Theme.of(context).colorScheme.tertiary,
                    onTap: () async {
                      if (passwordController.text !=
                          confirmPasswordController.text) {
                        MySnackBar.snackBar(
                            context,
                            LocaleKeys.validators_passwordsDoNotMatch.locale,
                            2);
                      } else {
                        if (_formKey.currentState!.validate()) {
                          try {
                            ref
                                .watch(authenticationProvider.notifier)
                                .register(
                                    emailController.text,
                                    passwordController.text,
                                    userNameController.text)
                                .then((user) {
                              if (user != null) {
                                user.sendEmailVerification().then((value) {
                                  firebaseAuth.signOut();

                                  MySnackBar.snackBar(
                                    context,
                                    LocaleKeys
                                        .login_register_activationLinkHasBeenSent
                                        .locale,
                                    3,
                                  );
                                  ref
                                      .watch(showPageChangeProvider.notifier)
                                      .showPageChangeFunction();
                                });
                              }
                            });
                          } on FirebaseAuthException catch (error) {
                            if (error.code == 'email-already-in-use') {
                              MySnackBar.snackBar(
                                  context,
                                  LocaleKeys
                                      .validators_emailAlreadyExist.locale,
                                  2);
                            } else {
                              MySnackBar.snackBar(
                                  context,
                                  LocaleKeys
                                      .validators_registerPleaseTryAgain.locale,
                                  2);
                            }
                          }
                        }
                      }
                    },
                    text: LocaleKeys.login_register_signUp.locale,
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
