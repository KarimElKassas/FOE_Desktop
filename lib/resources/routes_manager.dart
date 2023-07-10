import 'package:easy_localization/easy_localization.dart';
import 'package:egypt_future_chat_desktop/presentation/linkedDevices/ui/link_device_screen.dart';
import 'package:egypt_future_chat_desktop/presentation/startScreen/ui/qr_screen.dart';
import 'package:egypt_future_chat_desktop/presentation/startScreen/ui/start_screen.dart';
import 'package:flutter/material.dart';

import 'strings_manager.dart';

class RoutesManager{
  static const String startRoute = "/start";
  static const String qrRoute = "/qr";
  static const String linkDeviceRoute = "/linkDevice";
  static const String loginRoute = "/login";
  static const String homeRoute = "/home";

}
class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings settings){
    final args = settings.arguments;
    switch (settings.name){
      case RoutesManager.startRoute :
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case RoutesManager.qrRoute :
        return MaterialPageRoute(builder: (_) => const QrScreen());
      case RoutesManager.linkDeviceRoute :
        return MaterialPageRoute(builder: (_) => LinkDeviceScreen());
      case RoutesManager.homeRoute :
        return unDefinedRoute();
      default:
        return unDefinedRoute();
    }
  }
  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text(AppStrings.noRouteFound.tr()),),
        body: Center(child: Text(AppStrings.noRouteFound.tr()),),
      );
    });
  }
}