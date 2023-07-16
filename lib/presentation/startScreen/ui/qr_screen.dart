import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:egypt_future_chat_desktop/presentation/startScreen/bloc/login_cubit.dart';
import 'package:egypt_future_chat_desktop/presentation/startScreen/bloc/login_states.dart';
import 'package:egypt_future_chat_desktop/resources/color_manager.dart';
import 'package:egypt_future_chat_desktop/resources/constants_manager.dart';
import 'package:egypt_future_chat_desktop/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../core/service/service_locator.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../utils/components.dart';
import 'dart:ui' as ui;

import '../../../utils/constant.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<LoginCubit>()..initHub()..initCaching(),
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {
            if(state is LoginLoadingChatsState){
              _scaleDialog(context, loadingDialog(context));
            }
          },
          builder: (context, state) {
            var cubit = LoginCubit.get(context);
            return Scaffold(
              backgroundColor: Theme.of(context).primaryColorLight,
              body: Center(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: AppSize.s90Width,
                    maxHeight: AppSize.s75Height
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: AppSize.s16, vertical: AppSize.s64),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12)),
                    color: Constants.currentTheme == AdaptiveThemeMode.dark ? Colors.white : ColorManager.darkSecondColor
                  ),
                  padding: const EdgeInsets.all(AppSize.s16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(AppStrings.toSetup.tr(), style: TextStyle(fontWeight: FontWeightManager.bold, fontFamily: FontConstants.family, fontSize: FontSize.s22, color: Constants.currentTheme != AdaptiveThemeMode.dark ? Colors.white : ColorManager.darkSecondColor),),
                            const SizedBox(height: AppSize.s22,),
                            Text(AppStrings.step1.tr(), style: TextStyle(fontWeight: FontWeightManager.light, fontFamily: FontConstants.family, fontSize: FontSize.s18, color: Constants.currentTheme != AdaptiveThemeMode.dark ? Colors.white : ColorManager.darkSecondColor),),
                            const SizedBox(height: AppSize.s22,),
                            Text(AppStrings.step2.tr(), style: TextStyle(fontWeight: FontWeightManager.light, fontFamily: FontConstants.family, fontSize: FontSize.s18, color: Constants.currentTheme != AdaptiveThemeMode.dark ? Colors.white : ColorManager.darkSecondColor),),
                            const SizedBox(height: AppSize.s22,),
                            Text(AppStrings.step3.tr(), style: TextStyle(fontWeight: FontWeightManager.light, fontFamily: FontConstants.family, fontSize: FontSize.s18, color: Constants.currentTheme != AdaptiveThemeMode.dark ? Colors.white : ColorManager.darkSecondColor), overflow: TextOverflow.ellipsis, maxLines: 2,),
                            const SizedBox(height: AppSize.s22,),
                          ],
                        ),
                      ),
                      Expanded(
                        child: QrImageView(
                          data: 'This is Device Mac',
                          version: QrVersions.auto,
                          eyeStyle: QrEyeStyle(eyeShape: QrEyeShape.square  , color: ColorManager.black),
                          dataModuleStyle: QrDataModuleStyle(dataModuleShape: QrDataModuleShape.circle, color: ColorManager.black) ,
                          gapless: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
    );
  }
  void _scaleDialog(BuildContext context, Widget content,
      {bool dismissible = false}) {
    showGeneralDialog(
      barrierDismissible: dismissible,
      context: context,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: Directionality(
            textDirection: !AppConstants.isArabic()
                ? ui.TextDirection.rtl
                : ui.TextDirection.ltr,
            child: content,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
  Widget loadingDialog(BuildContext context) {
    return AlertDialog(
        backgroundColor: Theme.of(context).primaryColorLight,
        contentPadding: const EdgeInsets.all(AppSize.s12),
        content: Directionality(
          textDirection: AppConstants.isArabic() ? ui.TextDirection.rtl : ui.TextDirection.ltr,
          child: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSize.s32, horizontal: AppSize.s48),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(color: Theme.of(context).primaryColorDark, strokeWidth: AppSize.s0_8,),
                      const SizedBox(width: AppSize.s32,),
                      Text(
                        AppStrings.loadingChats.tr(),
                        style: TextStyle(
                            color: Theme.of(context).primaryColorDark,
                            fontSize: AppSize.s20,
                            fontWeight: FontWeightManager.bold,
                            fontFamily: FontConstants.family),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
