import 'package:easy_localization/easy_localization.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/bloc/home_cubit.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/components/setting_dialog.dart';
import 'package:egypt_future_chat_desktop/resources/asset_manager.dart';
import 'package:egypt_future_chat_desktop/resources/color_manager.dart';
import 'package:egypt_future_chat_desktop/resources/font_manager.dart';
import 'package:egypt_future_chat_desktop/resources/language_manager.dart';
import 'package:egypt_future_chat_desktop/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidebarx/sidebarx.dart';
import 'dart:ui' as ui;
import '../../../resources/constants_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';
import '../bloc/home_states.dart';

class ChatSideBar extends StatelessWidget {
  const ChatSideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = HomeCubit.get(context);
        return SidebarX(
          theme: SidebarXTheme(
              width: 55,
              hoverColor: Theme.of(context).splashColor,
              decoration: BoxDecoration(color: ColorManager.darkColor),
              padding: const EdgeInsets.all(AppSize.s4),
              selectedIconTheme: IconThemeData(color: Theme
                  .of(context)
                  .primaryColorDark, size: AppSize.s12),
              selectedItemDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
                  color: Theme
                      .of(context)
                      .splashColor
                     ),
              iconTheme: IconThemeData(color: Theme
                  .of(context)
                  .primaryColorDark, size: AppSize.s18)),
          showToggleButton: false,
          controller: cubit.controller,
          items: [
            SidebarXItem(
                iconWidget: Tooltip(message: AppStrings.chats.tr(), padding: const EdgeInsets.all(AppSize.s6),decoration: BoxDecoration(color: Theme.of(context).primaryColorLight ,borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),waitDuration: const Duration(milliseconds: 300),textStyle: TextStyle(fontFamily: FontConstants.family, color: Theme.of(context).primaryColorDark, fontWeight: FontWeightManager.bold, fontSize: FontSize.s14), child: Icon(Icons.chat_bubble_outline_rounded, color: Theme.of(context).primaryColorDark, size: AppSize.s18,)),
                label: AppStrings.chats.tr(),
                onTap: () {
                  cubit.changeListPage(0);
                }),
            SidebarXItem(
                iconWidget: Tooltip(message: AppStrings.archive.tr(), padding: const EdgeInsets.all(AppSize.s6),decoration: BoxDecoration(color: Theme.of(context).primaryColorLight ,borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),waitDuration: const Duration(milliseconds: 300),textStyle: TextStyle(fontFamily: FontConstants.family, color: Theme.of(context).primaryColorDark, fontWeight: FontWeightManager.bold, fontSize: FontSize.s14), child: Icon(Icons.archive_outlined, color: Theme.of(context).primaryColorDark,size: AppSize.s18,)),
                label: AppStrings.archive.tr(),
                onTap: () {
                  cubit.changeListPage(1);
            }),
          ],
          footerItems: [
            SidebarXItem(
                iconWidget: Tooltip(message: AppStrings.settings.tr(), padding: const EdgeInsets.all(AppSize.s6),decoration: BoxDecoration(color: Theme.of(context).primaryColorLight ,borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),waitDuration: const Duration(milliseconds: 300),textStyle: TextStyle(fontFamily: FontConstants.family, color: Theme.of(context).primaryColorDark, fontWeight: FontWeightManager.bold, fontSize: FontSize.s14), child: Icon(Icons.settings_rounded, color: Theme.of(context).primaryColorDark, size: AppSize.s18,)),
                label: AppStrings.settings.tr(),
                onTap: () {
                  _scaleDialog(
                      context,
                      Align(alignment: Constants.currentLocale == LanguageType.ARABIC.getValue() ? Alignment.bottomRight : Alignment.bottomLeft, child: SettingsDialog()));
                }),
            SidebarXItem(
                iconWidget: Tooltip(message: AppStrings.profile.tr(), padding: const EdgeInsets.all(AppSize.s6),decoration: BoxDecoration(color: Theme.of(context).primaryColorLight ,borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),waitDuration: const Duration(milliseconds: 300),textStyle: TextStyle(fontFamily: FontConstants.family, color: Theme.of(context).primaryColorDark, fontWeight: FontWeightManager.bold, fontSize: FontSize.s14),
                    child: Container(width: AppSize.s22, height: AppSize.s22, decoration: BoxDecoration(image: const DecorationImage(image: AssetImage(ImageAsset.myImage),fit: BoxFit.fill),borderRadius: BorderRadius.circular(AppSize.s24)),)),
                label: AppStrings.profile.tr(),
                onTap: () {}),
          ],
        );
      },
    );
  }
  void _scaleDialog(BuildContext context, Widget content) {
    showGeneralDialog(
      barrierLabel: '',
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.2),
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

}
