// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mylibrary/companants/rate_star.dart';
import 'package:mylibrary/companants/text_style.dart';
import 'package:mylibrary/localizations/language/locale_keys.g.dart';
import 'package:mylibrary/localizations/string_extensions.dart';
import 'package:mylibrary/providers/all_providers.dart';
import 'package:mylibrary/widgets/my_button.dart';

// ignore: must_be_immutable
class SearchFilter extends ConsumerStatefulWidget {
  Size size;
  SearchFilter({
    super.key,
    required this.size,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchFilterState();
}

class _SearchFilterState extends ConsumerState<SearchFilter> {
  @override
  Widget build(BuildContext context) {
    List typeList = ref.watch(itemTypeListProvider.notifier).state;
    return Container(
      margin: EdgeInsets.only(
        bottom: widget.size.height * 0.35,
      ),
      child: AlertDialog(
        content: IntrinsicHeight(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            LocaleKeys.homePage_filter_type.locale,
                            style: filterTextStyle,
                          ),
                          SizedBox(height: widget.size.height * 0.02),
                          CheckboxListTile(
                            checkColor: Colors.grey.shade600,
                            contentPadding: EdgeInsets.zero,
                            value: typeList[0],
                            onChanged: (value) {
                              setState(() => typeList[0] = value!);
                            },
                            title: Text(
                              LocaleKeys.homePage_filter_filmName.locale,
                              style: const TextStyle(fontSize: 15),
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                          CheckboxListTile(
                            checkColor: Colors.grey.shade600,
                            contentPadding: EdgeInsets.zero,
                            value: typeList[1],
                            onChanged: (value) {
                              setState(() => typeList[1] = value!);
                            },
                            title: Text(
                              LocaleKeys.homePage_filter_seriesName.locale,
                              style: const TextStyle(fontSize: 15),
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                          CheckboxListTile(
                            checkColor: Colors.grey.shade600,
                            contentPadding: EdgeInsets.zero,
                            value: typeList[2],
                            onChanged: (value) {
                              setState(() => typeList[2] = value!);
                            },
                            title: Text(
                              LocaleKeys.homePage_filter_bookName.locale,
                              style: const TextStyle(fontSize: 15),
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      thickness: 2,
                      color: Colors.grey.shade300,
                      endIndent: 20,
                      indent: 20,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            LocaleKeys.homePage_filter_Rate.locale,
                            style: filterTextStyle,
                          ),
                          const SizedBox(height: 10),
                          CheckboxListTile(
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: -4),
                            contentPadding: EdgeInsets.zero,
                            checkColor: Colors.grey.shade600,
                            value: false,
                            onChanged: (value) {},
                            title: RateStar(starCount: 5),
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                          CheckboxListTile(
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: -4),
                            contentPadding: EdgeInsets.zero,
                            checkColor: Colors.grey.shade600,
                            value: false,
                            onChanged: (value) {},
                            title: RateStar(starCount: 4),
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                          CheckboxListTile(
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: -4),
                            contentPadding: EdgeInsets.zero,
                            checkColor: Colors.grey.shade600,
                            value: false,
                            onChanged: (value) {},
                            title: RateStar(starCount: 3),
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                          CheckboxListTile(
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: -4),
                            contentPadding: EdgeInsets.zero,
                            checkColor: Colors.grey.shade600,
                            value: false,
                            onChanged: (value) {},
                            title: RateStar(starCount: 2),
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                          CheckboxListTile(
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: -4),
                            contentPadding: EdgeInsets.zero,
                            checkColor: Colors.grey.shade600,
                            value: false,
                            onChanged: (value) {},
                            title: RateStar(starCount: 1),
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: widget.size.height * 0.03),
              Row(
                children: [
                  Expanded(
                    child: MyButton(
                      text: LocaleKeys.homePage_filter_clean.locale,
                      onTap: () {
                        ref
                            .watch(itemTypeListProvider)
                            .every((element) => false);
                        debugPrint(typeList.toString());
                      },
                      myheight: 0.05,
                      mycolor: Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: MyButton(
                      text: LocaleKeys.homePage_filter_filter.locale,
                      onTap: () {
                        var value = typeListController(typeList);
                        ref
                            .watch(fireStoreServiceProvider)
                            .filterCardList(value);
                        debugPrint(value);
                        Navigator.pop(context);
                      },
                      myheight: 0.05,
                      mycolor: Colors.greenAccent,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

String typeListController(List typeList) {
  if (typeList[0]) {
    return 'film';
  } else {
    if (typeList[1]) {
      return 'series';
    } else {
      return 'book';
    }
  }
}
