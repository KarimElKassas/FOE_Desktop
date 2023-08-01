import 'package:easy_localization/easy_localization.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/bloc/home_cubit.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/bloc/home_states.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/bloc/setting_cubit.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/bloc/setting_states.dart';
import 'package:egypt_future_chat_desktop/resources/language_manager.dart';
import 'package:egypt_future_chat_desktop/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';

class LanguageDropdownMenu extends StatelessWidget {
  const LanguageDropdownMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit, SettingStates>(
      listener: (context, state){},
      builder: (context, state){
        var cubit = SettingCubit.get(context);
        return DropdownButton<String>(
          value: Constants.currentLocale == LanguageType.ENGLISH.getValue() ? AppStrings.english.tr() : AppStrings.arabic.tr(),
          items: [AppStrings.english.tr(), AppStrings.arabic.tr()].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              alignment: AlignmentDirectional.center,
              child: Text(
                value,
                style: TextStyle(color: Theme.of(context).primaryColorDark),
              ),
            );
          }).toList(),
          onChanged: (object) {
            cubit.changeLanguage(object.toString(), context);
            Navigator.pop(context);
          },
          dropdownColor: Theme.of(context).primaryColor,
          isExpanded: true,
          borderRadius: BorderRadius.circular(AppSize.s12),
          underline: Container(),
        );
      },
    );
  }
}