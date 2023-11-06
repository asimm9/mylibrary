import 'package:flutter/material.dart';
import 'package:mylibrary/companants/constans/text_style.dart';
import 'package:mylibrary/companants/my_button.dart';
import 'package:mylibrary/companants/my_divider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: size.width * 0.85,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _loginText(),
              const SizedBox(height: 45),
              _email_form_field(size),
              const SizedBox(height: 15),
              _passwordField(size),
              _forgotPasswordText(),
              const SizedBox(height: 15),
              MyButton(
                text: 'Sign In',
              ),
              const SizedBox(height: 15),
              const MyDivider(),
              const SizedBox(height: 15),
              MyButton(
                text: 'Continue with Google',
                icon: Icons.mail,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Align _forgotPasswordText() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          padding: MaterialStateProperty.all(
              const EdgeInsets.only(bottom: 20, right: 2)),
        ),
        onPressed: () {},
        child: const Text(
          'Forgot Password?',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  SizedBox _passwordField(Size size) {
    return SizedBox(
      height: size.height * 0.1,
      child: TextFormField(
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

  SizedBox _email_form_field(Size size) {
    return SizedBox(
      height: size.height * 0.07,
      child: TextFormField(
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

  Text _loginText() {
    return Text(
      'LogIn',
      style: loginPageTextStyle,
    );
  }
}
