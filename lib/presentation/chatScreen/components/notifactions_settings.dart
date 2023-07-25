import 'package:easy_localization/easy_localization.dart';
import 'package:egypt_future_chat_desktop/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:egypt_future_chat_desktop/resources/values_manager.dart';

import '../../../resources/font_manager.dart';
import 'notifications_switch.dart';

class NotificationSettings extends StatelessWidget {
  const NotificationSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: AppSize.s40, bottom: AppSize.s20),
            child: Text(
              AppStrings.notifications.tr(),
              style: TextStyle(
                fontSize: AppSize.s24,
                color: Theme.of(context).primaryColorDark,
                fontFamily: FontConstants.family,
              ),
            ),
          ),
          const NotificationSwitch(),
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


