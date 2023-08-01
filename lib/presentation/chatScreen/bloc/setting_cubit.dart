import 'package:easy_localization/easy_localization.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/bloc/setting_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../../resources/constants_manager.dart';
import '../../../resources/language_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../utils/constant.dart';
import '../../../utils/prefs_helper.dart';
class SettingCubit extends Cubit<SettingStates>{
  SettingCubit() : super(SettingInitialState());

  static SettingCubit get(context) => BlocProvider.of(context);

  SidebarXController controller = SidebarXController(selectedIndex: 0, extended: true);

  PageController chatListPageController = PageController();

  void changeListPage(int index) {
    chatListPageController.jumpToPage(index);
  }

  void changeLanguage(String newLanguage, BuildContext context){
    if(newLanguage == AppStrings.english.tr()){
      Constants.currentLocale = LanguageType.ENGLISH.getValue();
      context.setLocale(const Locale('en','US'));
      Preference.setString(AppConstants.prefsKeyLang, "English");
    }else{
      Constants.currentLocale = LanguageType.ARABIC.getValue();
      context.setLocale(const Locale('ar','EG'));
      Preference.setString(AppConstants.prefsKeyLang, "Arabic");
    }
    emit(SettingChangeAppLanguageState());
  }
}