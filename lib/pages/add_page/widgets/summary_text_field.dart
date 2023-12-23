// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mylibrary/localizations/language/locale_keys.g.dart';
import 'package:mylibrary/localizations/string_extensions.dart';

// ignore: must_be_immutable
class SummaryTextField extends StatelessWidget {
  TextEditingController summaryTextController;
  double height;
  SummaryTextField({
    Key? key,
    required this.summaryTextController,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.26,
      child: TextFormField(
        cursorColor: Theme.of(context).primaryColor,
        minLines: 8,
        maxLines: 8,
        controller: summaryTextController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.primary,
          hintText: LocaleKeys.addPage_mentionAboutTheContent.locale,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.tertiary),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.tertiary),
              borderRadius: BorderRadius.circular(15)),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Zorunlu!';
          }
          return null;
        },
      ),
    );
  }
}
