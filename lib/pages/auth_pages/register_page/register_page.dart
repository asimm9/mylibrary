// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/localizations/language/locale_keys.g.dart';
import 'package:mylibrary/localizations/string_extensions.dart';
import 'package:mylibrary/pages/auth_pages/register_page/widgets/register_confirm_password_form_field.dart';
import 'package:mylibrary/pages/auth_pages/register_page/widgets/register_email_form_field.dart';
import 'package:mylibrary/pages/auth_pages/register_page/widgets/register_page_title.dart';
import 'package:mylibrary/pages/auth_pages/register_page/widgets/register_password_form_field.dart';
import 'package:mylibrary/pages/auth_pages/register_page/widgets/register_sign_in_account.dart';
import 'package:mylibrary/pages/auth_pages/register_page/widgets/register_user_name_form_field.dart';
import 'package:mylibrary/widgets/my_button.dart';
import 'package:mylibrary/providers/all_providers.dart';

class RegisterPage extends ConsumerWidget {
  final VoidCallback onPressed;
  RegisterPage(this.onPressed, {super.key});
  final TextEditingController userNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SizedBox(
          width: size.width * 0.85,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RegisterPageTitle(),
                const SizedBox(height: 45),
                RegisterUserNameFormField(
                    size: size, userNameController: userNameController),
                const SizedBox(height: 15),
                RegisterEmailFormField(
                    size: size, emailController: emailController),
                const SizedBox(height: 15),
                RegisterPasswordFormField(
                    size: size, passwordController: passwordController),
                RegisterConfirmPasswordFormField(
                    size: size,
                    confirmPasswordController: confirmPasswordController),
                RegisterSignInAccount(onPressed: onPressed),
                const SizedBox(height: 15),
                MyButton(
                  mycolor: Theme.of(context).colorScheme.tertiary,
                  onTap: () {
                    if (passwordController.text !=
                        confirmPasswordController.text) {
                      showDialogError(context);
                    } else {
                      ref.watch(authenticationProvider.notifier).register(
                          emailController.text,
                          passwordController.text,
                          userNameController.text);
                    }
                  },
                  text: LocaleKeys.login_register_signUp.locale,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> showDialogError(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        alignment: Alignment.center,
        title: Text('Şifreler eşleşmiyor !!!'),
      ),
    );
  }
}
