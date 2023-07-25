import 'package:easy_localization/easy_localization.dart';
import 'package:egypt_future_chat_desktop/resources/color_manager.dart';
import 'package:flutter/material.dart';

import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';

class NotificationSwitch extends StatefulWidget {
  const NotificationSwitch({
    super.key,
  });

  @override
  State<NotificationSwitch> createState() => _NotificationSwitchState();
}

class _NotificationSwitchState extends State<NotificationSwitch> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runAlignment: WrapAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.notificationText.tr(),
          style: TextStyle(
            fontSize: AppSize.s14,
            color: Theme.of(context).disabledColor,
            fontFamily: FontConstants.family,
          ),
        ),
        Switch(
          activeColor: ColorManager.darkGoldColor,
          value: switchValue,
          onChanged: (bool value) {
            setState(() {
              switchValue = value;
            });
          },
        )
      ],
    );
  }
}
