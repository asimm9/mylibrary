// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import 'package:mylibrary/companants/colors.dart';
import 'package:mylibrary/companants/text_style.dart';

class MyTextField extends StatelessWidget {
  TextEditingController textController;
  String hintText;
  String? Function(String?) validatorFunction;
  EdgeInsets? contentPadding;
  double? height;
  int? minLines;
  int maxLines;
  int? maxLength;
  bool obscureText;
  AutovalidateMode? autovalidateMode;
  MyTextField({
    Key? key,
    required this.textController,
    required this.hintText,
    required this.validatorFunction,
    this.contentPadding,
    this.height,
    this.minLines,
    this.maxLines = 1,
    this.maxLength,
    this.obscureText = false,
    this.autovalidateMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
          cursorColor: textFieldCursorColor(context),
          style: textFieldTextColor(context),
          minLines: minLines,
          maxLines: maxLines,
          maxLength: maxLength,
          controller: textController,
          obscureText: obscureText,
          autovalidateMode: autovalidateMode,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.primary,
            hintText: hintText,
            contentPadding: contentPadding,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.tertiary),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.tertiary),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          validator: validatorFunction),
    );
  }
}
