// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

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
      icon:
          Icon(Icons.more_vert, color: Theme.of(context).colorScheme.tertiary),
      onSelected: (value) {
        if (value == 3) {
          authProvider.signOut();
        }
        if (value == 1) {
          themeModeProvider.toggleThemeMode();
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
        ];
      },
    );
  }
}
