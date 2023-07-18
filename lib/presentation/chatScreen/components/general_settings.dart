import 'package:egypt_future_chat_desktop/utils/components.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:language_picker/language_picker.dart';
import 'package:language_picker/languages.g.dart';
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
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 40,),
            child: Text(
              'General',
              style: TextStyle(color: Colors.white, fontSize: AppSize.s24),
            ),
          ),
          const Text(
            'Login',
            style: TextStyle(color: Colors.white, fontSize: AppSize.s16),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: AppSize.s50),
            child: Text(
              'start FOEChat at login',
              style: TextStyle(color: Colors.grey, fontSize: AppSize.s16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: LanguagePickerDropdown(
              
              languages: supportedLanguages,
              initialValue: Languages.english,
            ),
          ),
          const Text(
            'Typing',
            style: TextStyle(color: Colors.white, fontSize: AppSize.s16),
          ),
          const Text(
            'Change typing settings for auto correct and misspelled hilgight',
            style: TextStyle(color: Colors.grey, fontSize: AppSize.s16),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppSize.s30 ,bottom: AppSize.s30),
            child: RichText(
              text: TextSpan(
                text:
                    'Change typing settings for auto correct and misspelled hilgight',
                style: const TextStyle(color: Colors.grey, fontSize: AppSize.s12),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Windows Setting',
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      style: const TextStyle(
                        color: Colors.grey,
                      )),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(AppSize.s30),
            child: Divider(
              height: AppSize.s10,
              thickness: AppSize.s2,
              indent: AppSize.s10,
              endIndent: 0,
              color: Colors.grey,
            ),
          ),
          ReusableComponents.defaultButton(text: 'Logout', function: () {},height: AppSize.s50 , width: AppSize.s100, background: Colors.black12),
        ]),
      ),
    );
  }
}
