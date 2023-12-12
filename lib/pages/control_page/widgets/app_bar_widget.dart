// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mylibrary/companants/text_style.dart';
import 'package:mylibrary/pages/control_page/widgets/change_language.dart';
import 'package:mylibrary/pages/control_page/widgets/helper_show_dialog.dart';
import 'package:mylibrary/pages/control_page/widgets/pop_up_menu_button.dart';
import 'package:mylibrary/providers/theme_provider.dart';
import 'package:mylibrary/services/firebase_auth_service.dart';

// ignore: must_be_immutable
class ControlPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  FirebaseAuthService authProvider;
  ThemeProvider themeModeState;
  Size size;
  ControlPageAppBar({
    Key? key,
    required this.authProvider,
    required this.themeModeState,
    required this.size,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'myLibrary',
        style: appBarTitleTextStyle,
      ),
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => HelperShowDialog(size: size),
          );
        },
        icon: Icon(
          Icons.question_mark,
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
      actions: [
        const ChangeLanguage(),
        PopUpMenuButtonWidget(
            authProvider: authProvider, themeModeProvider: themeModeState),
      ],
    );
  }
}
