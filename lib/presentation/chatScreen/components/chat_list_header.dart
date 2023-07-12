import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';

class ChatListHeader extends StatelessWidget {
  const ChatListHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
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
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.maps_ugc,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
        const SizedBox(
          width: AppSize.s16,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_horiz_rounded,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
      ],
    );
  }
}