// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:mylibrary/localizations/string_extensions.dart';

class LocaleText extends StatefulWidget {
  TextStyle? textStyle;
  final String text;
  LocaleText({
    Key? key,
    this.textStyle,
    required this.text,
  }) : super(key: key);

  @override
  State<LocaleText> createState() => _LocaleTextState();
}

class _LocaleTextState extends State<LocaleText> {
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      widget.text.locale,
      style: widget.textStyle,
    );
  }
}
