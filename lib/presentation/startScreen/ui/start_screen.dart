import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:egypt_future_chat_desktop/resources/extentions.dart';
import 'package:egypt_future_chat_desktop/resources/font_manager.dart';
import 'package:egypt_future_chat_desktop/resources/routes_manager.dart';
import 'package:egypt_future_chat_desktop/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/asset_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/constants_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../utils/components.dart';
import '../../../utils/constant.dart';
import '../../../utils/prefs_helper.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppSize.s32),
                    child: SvgPicture.asset(
                      ImageAsset.startLogo,
                      alignment: Alignment.center,
                      width: AppSize.s65Width,
                      height: AppSize.s20Height,
                    ),
                  ),
                  Text(AppStrings.welcomeToApp.tr(), style: TextStyle(fontWeight: FontWeightManager.bold, fontFamily: FontConstants.family, fontSize: FontSize.s22, color: Theme.of(context).primaryColorDark),),
                  const SizedBox(height: AppSize.s12,),
                  Text(AppStrings.startQuote.tr(), style: TextStyle(fontWeight: FontWeightManager.light, fontFamily: FontConstants.family, fontSize: FontSize.s18, color: Theme.of(context).primaryColorDark.withOpacity(AppSize.s0_8)),),
                  const SizedBox(height: AppSize.s24,),
                  ReusableComponents.defaultButton(
                      width: AppSize.s25Width,
                      height: AppSize.s40,
                      function: () {},
                      text: AppStrings.getStarted.tr(),
                      borderColor: ColorManager.goldColor,
                      background: ColorManager.goldColor,
                      textColor: Colors.black,
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontFamily:
                          FontConstants.family,
                          fontSize: AppSize.s14))
                      .ripple(()async {
                      AppConstants.navigate(context, RoutesManager.chatRoute, null);
                    /*final savedThemeMode = await AdaptiveTheme.getThemeMode();
                    if(savedThemeMode == AdaptiveThemeMode.light){
                      AdaptiveTheme.of(context).setDark();
                      Preference.setString(AppConstants.prefsKeyTheme, "Dark");
                    }else if(savedThemeMode == AdaptiveThemeMode.dark){
                      AdaptiveTheme.of(context).setLight();
                      Preference.setString(AppConstants.prefsKeyTheme, "Light");
                    }*/
                  },
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
                      overlayColor: MaterialStateColor.resolveWith((states) => ColorManager.darkGoldColor.withOpacity(AppSize.s0_2))),
                ],
              ),
            ),
            Align(alignment: Alignment.bottomCenter,child: Padding(
              padding: const EdgeInsets.all(AppSize.s12),
              child: Text("${AppStrings.version.tr()} ${Constants.latestVersion}", style: TextStyle(fontWeight: FontWeightManager.light, fontFamily: FontConstants.family, fontSize: FontSize.s18, color: Theme.of(context).primaryColorDark.withOpacity(AppSize.s0_8)),),
            )),
          ],
        ),
      ),
    );
  }
}
