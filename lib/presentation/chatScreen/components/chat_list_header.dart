import 'package:easy_localization/easy_localization.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/bloc/home_cubit.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/bloc/home_states.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/components/tool_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';

import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';

class ChatListHeader extends StatelessWidget {
  const ChatListHeader({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = HomeCubit.get(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppStrings.chatsTitle.tr(),
              style: TextStyle(
                  fontWeight: FontWeightManager.bold,
                  fontFamily: FontConstants.family,
                  fontSize: FontSize.s22,
                  color: Theme.of(context).primaryColorDark),
            ),
            const Spacer(),
            ToolButton(
                LineIcons.edit,
                (){},
                    () => cubit.changeEditIconButtonBackground(Theme.of(context).splashColor),
                    () => cubit.changeEditIconButtonBackground(Colors.transparent),
                cubit.editIconButtonBackground),
            const SizedBox(
              width: AppSize.s8,
            ),
            ToolButton(
                Icons.more_horiz_outlined,
                    (){},
                    () => cubit.changeToolsIconButtonBackground(Theme.of(context).splashColor),
                    () => cubit.changeToolsIconButtonBackground(Colors.transparent),
                cubit.toolsIconButtonBackground),
          ],
        );
      },
    );
  }
}