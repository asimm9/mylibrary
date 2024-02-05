// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mylibrary/companants/text_style.dart';
import 'package:mylibrary/model/card_model.dart';
import 'package:mylibrary/providers/all_providers.dart';

// ignore: must_be_immutable
class AppBarWidget extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  CardModel cardModel;
  AppBarWidget({
    super.key,
    required this.cardModel,
  });
  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends ConsumerState<AppBarWidget> {
  bool sonDeger = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ref.watch(fireStoreServiceProvider).getCurrentBoolValue(widget.cardModel);
    sonDeger = ref.watch(fireStoreServiceProvider).lastValue;
  }

  @override
  Widget build(BuildContext context) {
    bool sonDeger = ref.watch(fireStoreServiceProvider).lastValue;
    return AppBar(
      centerTitle: true,
      title: Text('myLibrary', style: appBarTitleTextStyle),
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios_outlined,
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            if (ref.watch(fireStoreServiceProvider).lastValue == false) {
              setState(() {
                sonDeger = true;
              });
              ref.watch(fireStoreServiceProvider.notifier).lastValue = true;
            } else {
              setState(() {
                sonDeger = false;
              });
              ref.watch(fireStoreServiceProvider.notifier).lastValue = false;
            }
            ref
                .watch(fireStoreServiceProvider)
                .controlFavorite(widget.cardModel.id!, sonDeger);
          },
          icon: ref.watch(fireStoreServiceProvider.notifier).lastValue
              ? const Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              : const Icon(Icons.favorite_border_rounded, size: 30),
          color: Theme.of(context).colorScheme.tertiary,
        )
      ],
    );
  }
}
