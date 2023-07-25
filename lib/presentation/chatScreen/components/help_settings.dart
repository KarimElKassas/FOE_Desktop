import 'package:easy_localization/easy_localization.dart';
import 'package:egypt_future_chat_desktop/resources/font_manager.dart';
import 'package:egypt_future_chat_desktop/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import '../../../resources/values_manager.dart';

class HelpSettings extends StatelessWidget {
  const HelpSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: AppSize.s40, bottom: AppSize.s30),
            child: Text(
              AppStrings.help.tr(),
              style: TextStyle(
                fontSize: AppSize.s24,
                color: Theme.of(context).primaryColorDark,
                fontFamily: FontConstants.family,
              ),
            ),
          ),
          Center(
            child: Text(
              AppStrings.appName.tr(),
              style: TextStyle(
                fontSize: AppSize.s20,
                color: Theme.of(context).primaryColorDark,
                fontFamily: FontConstants.family,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSize.s10),
            child: Center(
              child: Text(
                'version 1.0.0.0',
                style: TextStyle(
                  fontSize: AppSize.s14,
                  color: Theme.of(context).disabledColor,
                  fontFamily: FontConstants.family,
                ),
              ),
            ),
          ),
          const Divider(
            height: AppSize.s5,
            thickness: AppSize.s1,
            indent: AppSize.s10,
            endIndent: 0,
            color: Colors.grey,
          ),
          const SizedBox(height: AppSize.s15),
          Text(
            AppStrings.contactUs.tr(),
            style: TextStyle(
              fontSize: AppSize.s20,
              color: Theme.of(context).primaryColorDark,
              fontFamily: FontConstants.family,
            ),
          ),
        ],
      ),
    );
  }
}
