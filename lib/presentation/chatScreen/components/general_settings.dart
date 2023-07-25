import 'package:easy_localization/easy_localization.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/components/language_dropdown_menu.dart';
import 'package:egypt_future_chat_desktop/utils/components.dart';
import 'package:flutter/material.dart';
import 'package:language_picker/language_picker.dart';
import 'package:language_picker/languages.g.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';

class GeneralSettings extends StatelessWidget {
  GeneralSettings({Key? key}) : super(key: key);
  final supportedLanguages = [
    Languages.english,
    Languages.arabic,
  ];

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding:
                const EdgeInsets.only(top: AppSize.s40, bottom: AppSize.s10),
            child: Text(
              AppStrings.general.tr(),
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: AppSize.s24,
                fontFamily: FontConstants.family,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: AppSize.s20, bottom: AppSize.s10),
            child: Text(
              AppStrings.login.tr(),
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: AppSize.s16,
                fontFamily: FontConstants.family,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: AppSize.s20),
            child: Text(
              AppStrings.startFOEChat.tr(),
              style: TextStyle(
                color: Theme.of(context).disabledColor,
                fontSize: AppSize.s12,
                fontFamily: FontConstants.family,
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
                const EdgeInsets.only(top: AppSize.s20, bottom: AppSize.s10),
            child: Text(
              AppStrings.language.tr(),
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: AppSize.s16,
                fontFamily: FontConstants.family,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: LanguageDropdownMenu(),
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
                const EdgeInsets.only(top: AppSize.s20, bottom: AppSize.s10),
            child: Text(
              AppStrings.typing.tr(),
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: AppSize.s16,
                fontFamily: FontConstants.family,
              ),
            ),
          ),
          Text(
            AppStrings.typingText.tr(),
            style: TextStyle(
              color: Theme.of(context).disabledColor,
              fontSize: AppSize.s12,
              fontFamily: FontConstants.family,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: AppSize.s30),
            child: Divider(
              height: AppSize.s5,
              thickness: AppSize.s1,
              indent: AppSize.s10,
              endIndent: 0,
              color: Colors.grey,
            ),
          ),
          Center(
            child: ReusableComponents.defaultButton(
                text: AppStrings.logout.tr(),
                function: () {},
                height: AppSize.s50,
                width: AppSize.s100,
                background: Colors.black12),
          ),
        ]),
      ),
    );
  }
}
