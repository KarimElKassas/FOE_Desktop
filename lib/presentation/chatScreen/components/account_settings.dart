import 'package:easy_localization/easy_localization.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/components/privacy_dropdown_menu.dart';
import 'package:egypt_future_chat_desktop/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';

class AccountSettings extends StatelessWidget {
  AccountSettings({Key? key}) : super(key: key);

  final List<String> privacyOptions = ['No one', 'Everyone'];
  String chosenOption_profilePicture = '';
  String chosenOption_lastSeen = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: AppSize.s40, bottom: AppSize.s10),
            child: Text(
              AppStrings.account.tr(),
              style: TextStyle(
                fontSize: AppSize.s24,
                color: Theme.of(context).primaryColorDark,
                fontFamily: FontConstants.family,
              ),
            ),
          ),
          Text(
            AppStrings.privacyText.tr(),
            style: TextStyle(
              color: Theme.of(context).disabledColor,
              fontSize: FontSize.s14,
              fontFamily: FontConstants.family,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppSize.s30,bottom: AppSize.s10),
            child: Text(
              AppStrings.profilePicture.tr(),
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: FontSize.s18,
                fontFamily: FontConstants.family,
              ),
            ),
          ),
          PrivacyDropDownMenu(privacyOptions, chosenOption_profilePicture),
          const SizedBox(height: AppSize.s20),
          const Divider(
            height: AppSize.s5,
            thickness: AppSize.s1,
            indent: AppSize.s10,
            endIndent: 0,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppSize.s30,bottom: AppSize.s10),
            child: Text(
              AppStrings.lastSeen.tr(),
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: FontSize.s18,
                fontFamily: FontConstants.family,
              ),
            ),
          ),
          PrivacyDropDownMenu(privacyOptions, chosenOption_lastSeen),
        ],
      ),
    );
  }
}
