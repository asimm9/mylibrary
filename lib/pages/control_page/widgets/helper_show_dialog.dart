// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mylibrary/localizations/language/locale_keys.g.dart';
import 'package:mylibrary/localizations/string_extensions.dart';

// ignore: must_be_immutable
class HelperShowDialog extends StatelessWidget {
  Size size;
  HelperShowDialog({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.tertiary),
            onPressed: () => Navigator.pop(context),
            child: Text(
              LocaleKeys.homePage_helpDialog_close.locale,
              textAlign: TextAlign.center,
            ),
          ),
        ],
        insetPadding: EdgeInsets.symmetric(
            vertical: size.height * 0.25, horizontal: size.width * 0.06),
        title: Text(
          LocaleKeys.homePage_helpDialog_help.locale,
        ),
        content:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(
            children: [
              const Icon(Icons.arrow_forward),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  LocaleKeys.homePage_helpDialog_toGetDetailedView.locale,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.arrow_forward),
              const SizedBox(width: 5),
              Flexible(
                child: Text(LocaleKeys
                    .homePage_helpDialog_contentYouWantToSearch.locale),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.arrow_forward),
              const SizedBox(width: 5),
              Flexible(
                  child: Text(LocaleKeys
                      .homePage_helpDialog_swipeToRemoveFromFavorites.locale)),
            ],
          ),
        ]),
      ),
    );
  }
}
