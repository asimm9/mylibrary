// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/companants/app_constans.dart';
import 'package:mylibrary/localizations/language/locale_keys.g.dart';
import 'package:mylibrary/localizations/string_extensions.dart';
import 'package:mylibrary/providers/all_providers.dart';
import 'package:mylibrary/providers/theme_provider.dart';
import 'package:mylibrary/services/firebase_auth_service.dart';

// ignore: must_be_immutable
class PopUpMenuButtonWidget extends ConsumerWidget {
  FirebaseAuthService authProvider;
  ThemeProvider themeModeProvider;
  PopUpMenuButtonWidget({
    Key? key,
    required this.authProvider,
    required this.themeModeProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const List<Locale> supportedLocales = AppConstant.SUPPORTED_LANG;
    int count = ref.watch(languageCountProvider.notifier).count;
    return PopupMenuButton(
      position: PopupMenuPosition.under,
      icon:
          Icon(Icons.more_vert, color: Theme.of(context).colorScheme.tertiary),
      onSelected: (value) async {
        if (value == 1) {
          themeModeProvider.toggleThemeMode();
        } else if (value == 2) {
          try {
            context.setLocale(supportedLocales[count]);
            ref.watch(languageCountProvider.notifier).incrementCount();
          } catch (error) {
            debugPrint(error.toString());
          }

          // setState(() {
          //   int selectedIndex =
          //       Random().nextInt(AppConstant.SUPPORTED_LANG.length);
          //   context.setLocale(AppConstant.SUPPORTED_LANG[selectedIndex]);
          // });
        } else {
          authProvider.signOut();
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
                Icon(Icons.language,
                    color: Theme.of(context).colorScheme.tertiary),
                const SizedBox(width: 10),
                Text(
                  supportedLocales[count].languageCode,
                )
              ],
            ),
          ),
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
