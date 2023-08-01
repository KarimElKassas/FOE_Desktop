import 'package:easy_localization/easy_localization.dart';
import 'package:egypt_future_chat_desktop/resources/font_manager.dart';
import 'package:egypt_future_chat_desktop/resources/strings_manager.dart';
import 'package:egypt_future_chat_desktop/resources/values_manager.dart';
import 'package:flutter/material.dart';
import '../../../utils/components.dart';

class NewChatWidget extends StatelessWidget {
  const NewChatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(AppSize.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.newChat.tr(),
              style: TextStyle(color: Theme.of(context).primaryColorDark, fontSize: AppSize.s16, fontWeight: FontWeightManager.bold),),
            const SizedBox(height: AppSize.s16,),
            ReusableComponents.registerTextField(
                context: context,
                textInputType: TextInputType.text,
                hintText: AppStrings.searchText.tr(),
                textInputAction: TextInputAction.search,
                validate: (value){},
                onChanged: (value){}),
            const SizedBox(height: AppSize.s16,),

          ],
        ),
      ),
    );
  }
}
