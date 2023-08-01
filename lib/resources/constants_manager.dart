import 'dart:io';

import 'package:egypt_future_chat_desktop/resources/endpoints.dart';
import 'package:egypt_future_chat_desktop/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:signalr_core/signalr_core.dart';

import '../utils/prefs_helper.dart';
import 'language_manager.dart';

class AppConstants {
  static const int toastTimeIOS = 3; //in seconds
  static const String prefsKeyLang = "PREFS_KEY_LANG";
  static const String prefsKeyTheme = "PREFS_KEY_THEME";
  static ValueNotifier<bool> boxKeyNotifier = ValueNotifier(false);

  /// The default borderRadius
  static const double borderRadius = 8.0;

  /// The default unit of spacing
  static const double spaceUnit = 16;

  /// sm spacing value (8pt)
  static const double sm = 0.5 * spaceUnit;

  /// md spacing value (12pt)
  static const double md = 0.75 * spaceUnit;

  /// lg spacing value (16pt)
  static const double lg = spaceUnit;
  /// xlg spacing value (24pt)
  static const double xlg = 1.5 * spaceUnit;

  static void finish(BuildContext context, route) {
    Navigator.pushReplacementNamed(context, route);
  }

  static void finishWithArguments(
      BuildContext context, route, Object? arguments) {
    Navigator.pushReplacementNamed(context, route, arguments: arguments);
  }

  static void navigate(BuildContext context, route, Object? arguments) {
    Navigator.pushNamed(context, route, arguments: arguments);
  }


  static Future<String> getAppLanguage() async {
    var key = Preference.prefs.getString(prefsKeyLang);
    if(Preference.prefs.containsKey(prefsKeyLang)){
      if(key!.isNotEmpty){
        return key == "English" ? LanguageType.ENGLISH.getValue() : LanguageType.ARABIC.getValue();
      }else{
        return LanguageType.ARABIC.getValue();
      }
    }else{
      return LanguageType.ARABIC.getValue();
    }
  }
  static HubConnection? connection;
  static void initHub()async{
    print("HELLO INIT HUB");
    const url = EndPoints.hubUrl2;
    if(AppConstants.connection?.state == HubConnectionState.disconnected || AppConstants.connection?.connectionId == null) {
      AppConstants.connection = HubConnectionBuilder().withUrl(url,
          HttpConnectionOptions(
            accessTokenFactory: getMyToken,
            client: IOClient(HttpClient()..badCertificateCallback = (x, y, z) => true),
            logging: (level, message) => print(message),
          )).withAutomaticReconnect().build();

      connection?.onclose((exception) {
        print("ON CLOSE : $exception\n");
        initHub();
      });
      print("INIT ID : ${connection?.connectionId}\n");
      connection?.on("ReceiveMessage", (message) {
        print("Receive ID : ${connection?.connectionId}\n");
        print("MESSAGE HUB : $message\n");
        print("OKAY\n");
        /* print("RETURN TYPE : ${message.runtimeType}\n");
      print("RETURN TYPE First: ${message?[0].runtimeType}\n");*/
        /* Map<String, dynamic> map = HashMap.from(message?[0]);
      print("MAPPPP : $map\n");
      MessageFullModel model = MessageFullModel.fromHubJson(map);
      addToCache(model.chatId, map);*/
      });
      await connection?.start();
    }
  }

  static Future<String> getMyToken()async{
    if(Preference.prefs.containsKey('sessionToken')){
      var token = Preference.prefs.getString('sessionToken').toString();
      return token;
    }
    return "Empty";
  }

  static ThemeMode getAppTheme() {
    String? theme = "";
      theme = Preference.prefs.getString(prefsKeyTheme);
    if(Preference.prefs.containsKey(prefsKeyTheme)){
      if(theme!.isNotEmpty){
        return theme == "Dark" ? ThemeMode.dark : ThemeMode.light;
      }else{
        return ThemeMode.light;
      }
    }else{
      return ThemeMode.light;
    }
  }

  static Future<void> changeAppTheme() async {
    ThemeMode currentTheme = getAppTheme();

    if (currentTheme == ThemeMode.dark) {
      // set light
      Preference.prefs.setString(prefsKeyTheme, "Light");
    } else {
      // set dark
      Preference.prefs.setString(prefsKeyTheme, "Dark");
    }
  }

  static Future<void> changeAppLanguage() async {
    String currentLang = await getAppLanguage();

    if (currentLang == LanguageType.ARABIC.getValue()) {
      // set english
      Preference.prefs.setString(prefsKeyLang, "English");
      Constants.currentLocale = LanguageType.ENGLISH.getValue();
    } else {
      // set arabic
      Preference.prefs.setString(prefsKeyLang, "Arabic");
      Constants.currentLocale = LanguageType.ARABIC.getValue();
    }
  }

  static Future<Locale> getLocal() async {
    String currentLang = await getAppLanguage();

    if (currentLang == LanguageType.ARABIC.getValue()) {
      return ARABIC_LOCAL;
    } else {
      return ENGLISH_LOCAL;
    }
  }

  static bool isArabic() {
    return Preference.prefs.getString(AppConstants.prefsKeyLang) == "Arabic";
  }

  static bool isDark() {
      return Preference.prefs.getString(AppConstants.prefsKeyTheme) == "Dark";
  }
}