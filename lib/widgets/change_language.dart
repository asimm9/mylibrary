import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mylibrary/companants/app_constans.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        position: PopupMenuPosition.under,
        icon:
            Icon(Icons.language, color: Theme.of(context).colorScheme.tertiary),
        onSelected: (value) async {
          if (value == 1) {
            await context.setLocale(AppConstant.TR_LOCALE);
          } else {
            await context.setLocale(AppConstant.EN_LOCALE);
          }
        },
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              value: 1,
              child: Row(
                children: [
                  SizedBox(
                      width: 22,
                      height: 22,
                      child: Image.asset('assets/images/turkey.png')),
                  const SizedBox(width: 10),
                  const Text(
                    'Türkçe',
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
            ),
            PopupMenuItem(
              value: 2,
              child: Row(
                children: [
                  SizedBox(
                      width: 22,
                      height: 22,
                      child: Image.asset(
                          'assets/images/united-states-of-america.png')),
                  const SizedBox(width: 10),
                  const Text(
                    'English',
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
            ),
          ];
        });
    // return IconButton(
    //   onPressed: () {
    //     int selectedIndex = Random().nextInt(AppConstant.SUPPORTED_LANG.length);
    //     context.setLocale(AppConstant.SUPPORTED_LANG[selectedIndex]);
    //   },
    //   icon: CircleAvatar(
    //     backgroundColor: Colors.black,
    //     foregroundColor: Colors.white,
    //     radius: 12,
    //     child: Text(context.locale.languageCode),
    //   ),
    // );
  }
}
