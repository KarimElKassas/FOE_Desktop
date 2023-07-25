import 'package:egypt_future_chat_desktop/presentation/chatScreen/bloc/setting_cubit.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/bloc/setting_states.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/components/account_settings.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/components/chats_settings.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/components/general_settings.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/components/help_settings.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/components/notifactions_settings.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/components/personalization_settings.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/components/profile_settings.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/components/setting_side_bar.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/components/shortcuts_settings.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/components/storage_settings.dart';
import 'package:egypt_future_chat_desktop/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/service/service_locator.dart';

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SettingCubit>(),
      child: BlocConsumer<SettingCubit, SettingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SettingCubit.get(context);
          return Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * (2 / 3),
            margin: const EdgeInsets.only(
                bottom: AppSize.s8, left: AppSize.s8, right: 60),
            child: Material(
              type: MaterialType.card,
              borderRadius:
                  const BorderRadius.all(Radius.circular(AppSize.s12)),
              color: Theme.of(context).primaryColorLight,
              child: Row(
                children: [
                  const Expanded(child: SettingSideBar()),
                  Expanded(
                    child: PageView(
                      controller: cubit.chatListPageController,
                      children:  <Widget>[
                            GeneralSettings(),
                            AccountSettings(),
                            const NotificationSettings(),
                             personalizationSetting(), /// personalization screen
                            const ShortCutsSettings(),
                            const HelpSettings(), /// help screen
                            const ProfileSettings(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
/**/
