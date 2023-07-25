import 'package:easy_localization/easy_localization.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/components/editable_text_field.dart';
import 'package:egypt_future_chat_desktop/resources/font_manager.dart';
import 'package:egypt_future_chat_desktop/resources/strings_manager.dart';
import 'package:egypt_future_chat_desktop/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../resources/asset_manager.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSize.s20),
            child: Center(
              child: CircleAvatar(
                radius: AppSize.s100,
                child: ClipOval(
                  child: Image.asset(
                    ImageAsset.myImage,
                  ),
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
          Padding(
            padding:
                const EdgeInsets.only(top: AppSize.s30, bottom: AppSize.s18),
            child: TextSwitcherWidget(
              initialText: 'data',
            ),
          ),
          TextSwitcherWidget(
            initialText: 'bio',
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSize.s15),
            child: Center(
              child: Text(
                'ur bio',
                style: TextStyle(
                  fontSize: AppSize.s12,
                  color: Theme.of(context).primaryColorDark,
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
          const SizedBox(height: AppSize.s20),
          Center(
            child: Text(
              AppStrings.phoneNumber.tr(),
              style: TextStyle(
                fontSize: AppSize.s16,
                color: Theme.of(context).disabledColor,
                fontFamily: FontConstants.family,
              ),
            ),
          ),
          const SizedBox(height: AppSize.s5),
          Center(
            child: Text(
              '11111111',
              style: TextStyle(
                fontSize: AppSize.s14,
                color: Theme.of(context).primaryColorDark,
                fontFamily: FontConstants.family
              ),
            ),
          ),
        ],
      ),
    );
  }
}
