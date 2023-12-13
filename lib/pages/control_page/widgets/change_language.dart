import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mylibrary/companants/app_constans.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        int selectedIndex = Random().nextInt(AppConstant.SUPPORTED_LANG.length);
        context.setLocale(AppConstant.SUPPORTED_LANG[selectedIndex]);
      },
      icon: CircleAvatar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        radius: 12,
        child: Text(context.locale.languageCode),
      ),
    );
  }
}
