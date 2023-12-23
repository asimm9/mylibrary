// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mylibrary/companants/app_constans.dart';

import 'package:mylibrary/localizations/language/locale_keys.g.dart';
import 'package:mylibrary/localizations/string_extensions.dart';
import 'package:mylibrary/providers/theme_provider.dart';
import 'package:mylibrary/services/firebase_auth_service.dart';

// ignore: must_be_immutable
class PopUpMenuButtonWidget extends StatelessWidget {
  FirebaseAuthService authProvider;
  ThemeProvider themeModeProvider;
  PopUpMenuButtonWidget({
    Key? key,
    required this.authProvider,
    required this.themeModeProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      position: PopupMenuPosition.under,
      icon:
          Icon(Icons.more_vert, color: Theme.of(context).colorScheme.tertiary),
      onSelected: (value) {
        if (value == 3) {
          authProvider.signOut();
        }
        if (value == 1) {
          themeModeProvider.toggleThemeMode();
        }
        if (value == 4) {
          int selectedIndex =
              Random().nextInt(AppConstant.SUPPORTED_LANG.length);
          context.setLocale(AppConstant.SUPPORTED_LANG[selectedIndex]);
        }
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem(
              value: 1,
              child: Row(
                children: [
                  Icon(Icons.dark_mode,
                      color: Theme.of(context).colorScheme.tertiary),
                  const SizedBox(width: 10),
                  Text(
                    LocaleKeys.homePage_popUpMenu_darkMode.locale,
                  )
                ],
              )),
          PopupMenuItem(
              value: 2,
              child: Row(
                children: [
                  Icon(Icons.info,
                      color: Theme.of(context).colorScheme.tertiary),
                  const SizedBox(width: 10),
                  Text(LocaleKeys.homePage_popUpMenu_about.locale)
                ],
              )),
          PopupMenuItem(
            value: 3,
            child: Row(
              children: [
                Icon(Icons.logout,
                    color: Theme.of(context).colorScheme.tertiary),
                const SizedBox(width: 10),
                Text(
                  LocaleKeys.homePage_popUpMenu_logOut.locale,
                )
              ],
            ),
          ),
          PopupMenuItem(
            value: 4,
            child: Row(
              children: [
                Icon(Icons.language,
                    color: Theme.of(context).colorScheme.tertiary),
                const SizedBox(width: 10),
                Text(
                  context.locale.languageCode,
                )
              ],
            ),
          ),
        ];
      },
    );
  }
}
