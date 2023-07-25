import 'package:easy_localization/easy_localization.dart';
import 'package:egypt_future_chat_desktop/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../resources/strings_manager.dart';

class PrivacyDropDownMenu extends StatefulWidget {
  const PrivacyDropDownMenu(List<String> privacyOptions, String chosenOption, {Key? key}) : super(key: key);

  @override
  State<PrivacyDropDownMenu> createState() => _PrivacyDropDownMenuState();
}

class _PrivacyDropDownMenuState extends State<PrivacyDropDownMenu> {
  final List<String> privacyOptions = [AppStrings.noOne.tr(), AppStrings.everyone.tr()];
  String chosenOption = AppStrings.noOne.tr();

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: chosenOption,
      items: privacyOptions.map((String value) {
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
