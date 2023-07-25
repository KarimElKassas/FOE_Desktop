import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';

class ThemeDropdownMenu extends StatefulWidget {
  const ThemeDropdownMenu({Key? key}) : super(key: key);

  @override
  State<ThemeDropdownMenu> createState() => _ThemeDropdownMenuState();
}

class _ThemeDropdownMenuState extends State<ThemeDropdownMenu> {

  final List<String> themeOptions = [AppStrings.light.tr(), AppStrings.dark.tr()];
  String chosenOption = AppStrings.light.tr();

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: chosenOption,
      items: themeOptions.map((String value) {
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
