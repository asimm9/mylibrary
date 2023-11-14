// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/companants/text_style.dart';
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
    final showPageProvider = ref.watch(showPageChangeProvider);

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
                _registerText(),
                const SizedBox(height: 45),
                _userNameField(size),
                const SizedBox(height: 15),
                _email_form_field(size),
                const SizedBox(height: 15),
                _passwordField(size),
                _confirmPasswordField(size),
                _signInAccount(showPageProvider, context, onPressed),
                const SizedBox(height: 15),
                MyButton(
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
                  text: 'Sign Up',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text _registerText() {
    return Text(
      'Register',
      style: loginPageTextStyle,
    );
  }

  SizedBox _userNameField(Size size) {
    return SizedBox(
      height: size.height * 0.07,
      child: TextFormField(
        controller: userNameController,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          labelText: 'User name',
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
      ),
    );
  }

  SizedBox _email_form_field(Size size) {
    return SizedBox(
      height: size.height * 0.07,
      child: TextFormField(
        controller: emailController,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          labelText: ' Email',
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
        validator: (value) {
          if (value!.isEmpty) {
            return 'E-posta zorunludur!';
          }
          return null;
        },
      ),
    );
  }

  SizedBox _passwordField(Size size) {
    return SizedBox(
      height: size.height * 0.1,
      child: TextFormField(
        controller: passwordController,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          labelText: ' Password',
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

  SizedBox _confirmPasswordField(Size size) {
    return SizedBox(
      height: size.height * 0.1,
      child: TextFormField(
        controller: confirmPasswordController,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          labelText: 'Confirm Password',
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

  Align _signInAccount(
      ShowPage showPageProvider, BuildContext context, VoidCallback onPressed) {
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
            child: const Text(
              'Already you have an account',
              style: TextStyle(
                color: Colors.black,
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
            child: const Text(
              'Sign In',
              style: TextStyle(color: Colors.blueAccent),
            ),
          )
        ],
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
