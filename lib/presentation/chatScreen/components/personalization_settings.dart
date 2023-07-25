import 'package:easy_localization/easy_localization.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/components/theme_dropdown_menu.dart';
import 'package:egypt_future_chat_desktop/resources/font_manager.dart';
import 'package:egypt_future_chat_desktop/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../resources/strings_manager.dart';

class personalizationSetting extends StatelessWidget {
  personalizationSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: AppSize.s40, bottom: AppSize.s20),
            child: Text(
              AppStrings.personalization.tr(),
              style: TextStyle(
                fontSize: AppSize.s24,
                color: Theme.of(context).primaryColorDark,
                fontFamily: FontConstants.family
              ),
            ),
          ),
          Text(
            AppStrings.theme.tr(),
            style: TextStyle(
              color: Theme.of(context).primaryColorDark,
              fontSize: AppSize.s18,
              fontFamily: FontConstants.family,
            ),
          ),
          const SizedBox(height: AppSize.s10),
          const ThemeDropdownMenu(),
          const SizedBox(height: AppSize.s15,),
          const Divider(
            height: AppSize.s5,
            thickness: AppSize.s1,
            indent: AppSize.s10,
            endIndent: 0,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
