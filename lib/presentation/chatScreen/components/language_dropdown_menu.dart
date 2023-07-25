import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';

class LanguageDropdownMenu extends StatefulWidget {
  const LanguageDropdownMenu({Key? key}) : super(key: key);

  @override
  State<LanguageDropdownMenu> createState() => _LanguageDropdownMenuState();
}

class _LanguageDropdownMenuState extends State<LanguageDropdownMenu> {
  final List<String> languageOptions = [AppStrings.english.tr(), AppStrings.arabic.tr()];
  String chosenOption = AppStrings.english.tr();

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: chosenOption,
      items: languageOptions.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          alignment: AlignmentDirectional.center,
          child: Text(
            value,
            style: TextStyle(
                color: Theme.of(context).primaryColorDark
            ),
          ),
        );
      }).toList(),
      onChanged: (object) {
        setState(() {
          chosenOption = object.toString();
        });
      },
      dropdownColor: Theme.of(context).primaryColor,
      isExpanded: true,
      borderRadius: BorderRadius.circular(AppSize.s32),
      underline: Container(),
    );
  }
}
