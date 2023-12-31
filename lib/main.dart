import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:egypt_future_chat_desktop/resources/constants_manager.dart';
import 'package:egypt_future_chat_desktop/resources/language_manager.dart';
import 'package:egypt_future_chat_desktop/utils/bloc_observer.dart';
import 'package:egypt_future_chat_desktop/utils/constant.dart';
import 'package:egypt_future_chat_desktop/utils/dio_helper.dart';
import 'package:egypt_future_chat_desktop/utils/prefs_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:window_manager/window_manager.dart';

import 'app/app.dart';
import 'core/service/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.currentTheme = await AdaptiveTheme.getThemeMode();
  await EasyLocalization.ensureInitialized();

  await Preference.load();
  DioHelper.init();
  await Hive.initFlutter();
  Constants.currentLocale = await AppConstants.getAppLanguage();

  /*if(Platform.isWindows){
    await WindowManager.instance.ensureInitialized();
    Future.delayed(const Duration(milliseconds: 200), () {
      WindowManager.instance.maximize();
    });
    final size = await WindowManager.instance.getSize();
    print("SIZE : $size\n");
    WindowManager.instance.setMinimumSize(const Size(1024, 800));
    //WindowManager.instance.center(animate: true);
    WindowManager.instance.setTitle(Constants.currentLocale == LanguageType.ARABIC.getValue() ? "جهاز مستقبل مصر" : "Egypt's Future Authority");
  }*/

  Bloc.observer = MyBlocObserver();
  ServiceLocator().setup();

  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  var currentVersion = "${packageInfo.version.replaceAll(".", "")}0";
  Constants.currentVersionNumber = int.parse(currentVersion);

  runApp(EasyLocalization(
      supportedLocales: const [ARABIC_LOCAL, ENGLISH_LOCAL],
      path: ASSET_PATH_LOCALISATIONS,
      fallbackLocale: ARABIC_LOCAL,
      child: MyApp(Constants.currentTheme)));
}