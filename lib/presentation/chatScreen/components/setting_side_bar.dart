import 'package:easy_localization/easy_localization.dart';
import 'package:egypt_future_chat_desktop/resources/custom_sidebar/sidebar_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';
import '../bloc/setting_cubit.dart';
import '../bloc/setting_states.dart';

class SettingSideBar extends StatelessWidget {
  const SettingSideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit,SettingStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = SettingCubit.get(context);
        return MSideBar(
          theme: SidebarXTheme(
              //width: 200,
              hoverColor: Theme.of(context).splashColor,
              decoration: BoxDecoration(color: ColorManager.darkColor),
              padding: const EdgeInsets.all(AppSize.s4),
              itemTextPadding: const EdgeInsets.symmetric(horizontal: AppSize.s16, vertical: AppSize.s4),
              selectedItemTextPadding: const EdgeInsets.symmetric(horizontal: AppSize.s16, vertical: AppSize.s4),
              hoverTextStyle: TextStyle(color: Theme.of(context).primaryColorDark, fontSize: FontSize.s18, fontFamily: FontConstants.family, fontWeight: FontWeightManager.regular),
              textStyle: TextStyle(color: ColorManager.white, fontSize: FontSize.s18, fontFamily: FontConstants.family, fontWeight: FontWeightManager.regular),
              selectedTextStyle: TextStyle(color: Theme.of(context).primaryColorDark, fontSize: FontSize.s18, fontFamily: FontConstants.family, fontWeight: FontWeightManager.regular),
              selectedIconTheme: IconThemeData(color: Theme.of(context).primaryColorDark, size: AppSize.s12),
              selectedItemDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
                  color: Theme.of(context).splashColor.withOpacity(AppSize.s0_6)),
              iconTheme: IconThemeData(
                  color: Theme.of(context).primaryColorDark, size: AppSize.s18)),
          controller: cubit.controller,
          showToggleButton: false,
          items: [
            SidebarXItem(
                iconWidget: Tooltip(
                    message: AppStrings.general.tr(),
                    padding: const EdgeInsets.all(AppSize.s6),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(AppSize.s8))),
                    waitDuration: const Duration(milliseconds: 300),
                    child: Icon(
                      Icons.computer,
                      color: Theme.of(context).primaryColorDark,
                      size: AppSize.s18,
                    )),
                label: AppStrings.general.tr(),
                onTap: () {
                   cubit.changeListPage(0);
                }),
            SidebarXItem(
                iconWidget: Tooltip(
                    message: AppStrings.account.tr(),
                    padding: const EdgeInsets.all(AppSize.s6),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(AppSize.s8))),
                    waitDuration: const Duration(milliseconds: 300),
                    child: Icon(
                      Icons.key,
                      color: Theme.of(context).primaryColorDark,
                      size: AppSize.s18,
                    )),
                label: AppStrings.account.tr(),
                onTap: () {
                   cubit.changeListPage(1);
                }),
            SidebarXItem(
                iconWidget: Tooltip(
                    message: AppStrings.notifications.tr(),
                    padding: const EdgeInsets.all(AppSize.s6),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(AppSize.s8))),
                    waitDuration: const Duration(milliseconds: 300),
                    child: Icon(
                      Icons.notifications_active_sharp,
                      color: Theme.of(context).primaryColorDark,
                      size: AppSize.s18,
                    )),
                label: AppStrings.notifications.tr(),
                onTap: () {
                   cubit.changeListPage(2);
                }),
            SidebarXItem(
                iconWidget: Tooltip(
                    message: AppStrings.personalization.tr(),
                    padding: const EdgeInsets.all(AppSize.s6),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(AppSize.s8))),
                    waitDuration: const Duration(milliseconds: 300),
                    child: Icon(
                      Icons.draw,
                      color: Theme.of(context).primaryColorDark,
                      size: AppSize.s18,
                    )),
                label: AppStrings.personalization.tr(),
                onTap: () {
                   cubit.changeListPage(3);
                }),
            SidebarXItem(
                iconWidget: Tooltip(
                    message: AppStrings.shortcuts.tr(),
                    padding: const EdgeInsets.all(AppSize.s6),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(AppSize.s8))),
                    waitDuration: const Duration(milliseconds: 300),
                    child: Icon(
                      Icons.keyboard_alt_outlined,
                      color: Theme.of(context).primaryColorDark,
                      size: AppSize.s18,
                    )),
                label: AppStrings.shortcuts.tr(),
                onTap: () {
                   cubit.changeListPage(4);
                }),
            SidebarXItem(
                iconWidget: Tooltip(
                    message: AppStrings.help.tr(),
                    padding: const EdgeInsets.all(AppSize.s6),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(AppSize.s8))),
                    waitDuration: const Duration(milliseconds: 300),
                    child: Icon(
                      Icons.help,
                      color: Theme.of(context).primaryColorDark,
                      size: AppSize.s18,
                    )),
                label: AppStrings.help.tr(),
                onTap: () {
                   cubit.changeListPage(5);
                }),
          ],
          footerItems: [
            SidebarXItem(
                iconWidget: Tooltip(
                    message: AppStrings.profile.tr(),
                    padding: const EdgeInsets.all(AppSize.s6),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(AppSize.s8))),
                    waitDuration: const Duration(milliseconds: 300),
                    child: Icon(
                      Icons.person,
                      color: Theme.of(context).primaryColorDark,
                      size: AppSize.s18,
                    )),
                label: AppStrings.profile.tr(),
                onTap: () {
                  cubit.changeListPage(6);
                })
          ],
        );
      },
    );
  }
}
