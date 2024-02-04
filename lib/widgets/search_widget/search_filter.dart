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
  List itemRateList;
  List typeList;
  void Function() onTap;
  SearchFilter(
      {super.key,
      required this.size,
      required this.typeList,
      required this.itemRateList,
      required this.onTap});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchFilterState();
}

class _SearchFilterState extends ConsumerState<SearchFilter> {
  @override
  Widget build(BuildContext context) {
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
                            value: widget.typeList[0],
                            onChanged: (value) {
                              setState(() => widget.typeList[0] = value!);
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
                            value: widget.typeList[1],
                            onChanged: (value) {
                              setState(() => widget.typeList[1] = value!);
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
                            value: widget.typeList[2],
                            onChanged: (value) {
                              setState(() => widget.typeList[2] = value!);
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
                          MyCheckBoxListtile(
                            onChanged: (value) {
                              setState(() => widget.itemRateList[4] = value!);
                            },
                            value: widget.itemRateList[4],
                            rateStar: RateStar(starCount: 5),
                          ),
                          MyCheckBoxListtile(
                            onChanged: (value) {
                              setState(() => widget.itemRateList[3] = value!);
                            },
                            value: widget.itemRateList[3],
                            rateStar: RateStar(starCount: 4),
                          ),
                          MyCheckBoxListtile(
                            onChanged: (value) {
                              setState(() => widget.itemRateList[2] = value!);
                            },
                            value: widget.itemRateList[2],
                            rateStar: RateStar(starCount: 3),
                          ),
                          MyCheckBoxListtile(
                            onChanged: (value) {
                              setState(() => widget.itemRateList[1] = value!);
                            },
                            value: widget.itemRateList[1],
                            rateStar: RateStar(starCount: 2),
                          ),
                          MyCheckBoxListtile(
                            onChanged: (value) {
                              setState(() => widget.itemRateList[0] = value!);
                            },
                            value: widget.itemRateList[0],
                            rateStar: RateStar(starCount: 1),
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
                        ref.watch(itemTypeValueListProvider).updateListValue();
                        ref.watch(itemRateValueListProvider).updateListValue();
                        widget.typeList =
                            List.filled(widget.typeList.length, false);
                        widget.itemRateList =
                            List.filled(widget.itemRateList.length, false);
                      },
                      myheight: 0.05,
                      mycolor: Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: MyButton(
                      text: LocaleKeys.homePage_filter_filter.locale,
                      onTap: widget.onTap,
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

// ignore: must_be_immutable
class MyCheckBoxListtile extends StatelessWidget {
  void Function(bool?) onChanged;
  bool value;
  Widget rateStar;

  MyCheckBoxListtile({
    Key? key,
    required this.onChanged,
    required this.value,
    required this.rateStar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      contentPadding: EdgeInsets.zero,
      checkColor: Colors.grey.shade600,
      value: value,
      onChanged: onChanged,
      title: rateStar,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
