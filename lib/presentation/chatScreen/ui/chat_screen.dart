import 'package:easy_localization/easy_localization.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/bloc/home_cubit.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/bloc/home_states.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/components/chat_list_widget.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/components/side_bar.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/components/tool_button.dart';
import 'package:egypt_future_chat_desktop/resources/strings_manager.dart';
import 'package:egypt_future_chat_desktop/resources/values_manager.dart';
import 'package:egypt_future_chat_desktop/utils/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';

import '../../../core/service/service_locator.dart';
import '../../../resources/asset_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>()..initChatHub()..getChatsFromServer(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = HomeCubit.get(context);
          return Scaffold(
            backgroundColor: Theme.of(context).primaryColorLight,
            body: RawKeyboardListener(
              focusNode: FocusNode(),
              autofocus: true,
              onKey: (RawKeyEvent event){
                if(event is RawKeyDownEvent){
                  if(event.logicalKey == LogicalKeyboardKey.escape){
                    if(cubit.chosenUser.value != null){
                        cubit.chosenUser.value = null;
                    }
                  }
                }
              },
              child: Row(
                children: [
                  const ChatSideBar(),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.3, child: const ChatListWidget()),
                  Container(color: Theme.of(context).primaryColor,width: 2,height: AppSize.sFullHeight,),
                  Expanded(
                    child: ValueListenableBuilder(
                        valueListenable: cubit.chosenUser,
                        builder: (context, chosenUser, child) {
                          if (chosenUser == null) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  ImageAsset.chatLogo,
                                  alignment: Alignment.center,
                                  width: AppSize.s45Width,
                                  height: AppSize.s10Height,
                                ),
                                const SizedBox(
                                  height: AppSize.s5,
                                ),
                                Text(
                                  AppStrings.egyptFutureChatApp.tr(),
                                  style: TextStyle(
                                      fontWeight: FontWeightManager.bold,
                                      fontFamily: FontConstants.family,
                                      fontSize: FontSize.s22,
                                      color: Theme.of(context).primaryColorDark),
                                ),
                                const SizedBox(
                                  height: AppSize.s10,
                                ),
                                Text(
                                  AppStrings.chooseChat.tr(),
                                  style: TextStyle(
                                      fontWeight: FontWeightManager.bold,
                                      fontFamily: FontConstants.family,
                                      fontSize: FontSize.s14,
                                      color: ColorManager.darkGrey),
                                ),
                              ],
                            );
                          } else {
                            return Container(
                              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(ImageAsset.chatImage), fit: BoxFit.fill)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: AppSize.s50,
                                    color: Theme.of(context).primaryColorLight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(AppSize.s8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          ClipOval(
                                            child: CircleAvatar(
                                              child: SvgPicture.asset(
                                                  chosenUser.imagePath),
                                            ),
                                          ),
                                          const SizedBox(width: AppSize.s10),
                                          Text(
                                            chosenUser.userName,
                                            style: TextStyle(
                                                fontWeight: FontWeightManager.bold,
                                                fontFamily: FontConstants.family,
                                                fontSize: FontSize.s18,
                                                color:
                                                Theme.of(context).primaryColorDark),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(color: Theme.of(context).primaryColor,height: 2,width: double.infinity,),
                                  ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: chosenUser.messages.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(AppSize.s10),
                                        child: Container(
                                          color: Colors.black,
                                          padding: const EdgeInsets.all(AppSize.s8),
                                          child: Text(
                                            chosenUser.messages[index],
                                            style: TextStyle(
                                                fontWeight: FontWeightManager.bold,
                                                fontFamily: FontConstants.family,
                                                fontSize: FontSize.s18,
                                                color: Theme.of(context).primaryColorDark),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  const Spacer(),
                                  Container(color: Theme.of(context).primaryColor,height: 2,width: double.infinity,),
                                  Container(
                                    width: double.infinity,
                                    height: AppSize.s50,
                                    color: Theme.of(context).primaryColorLight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(AppSize.s8),
                                      child: Row(
                                        children: [
                                          ToolButton(
                                              Icons.emoji_emotions_outlined,
                                                  (){},
                                                  () {cubit.changeEmojiIconButtonBackground(Theme.of(context).splashColor);},
                                                  () { cubit.changeEmojiIconButtonBackground(Colors.transparent);},
                                              cubit.emojiIconButtonBackground, padding: const EdgeInsets.symmetric(vertical: AppSize.s6,horizontal: AppSize.s12)),
                                          const SizedBox(width: AppSize.s6,),
                                          ToolButton(
                                              LineIcons.link,
                                                  (){},
                                                  () {cubit.changeAttachIconButtonBackground(Theme.of(context).splashColor);},
                                                  () { cubit.changeAttachIconButtonBackground(Colors.transparent);},
                                              cubit.attachIconButtonBackground, padding: const EdgeInsets.symmetric(vertical: AppSize.s6,horizontal: AppSize.s12),),
                                          Expanded(
                                            child: ReusableComponents.registerTextField(
                                                context: context,
                                                textInputType: TextInputType.text,
                                                hintText: AppStrings.typeMessage.tr(),
                                                textInputAction: TextInputAction.send,
                                                background: Colors.transparent,
                                                borderStyle: BorderStyle.none,
                                                suffixIcon: IconButton(onPressed: (){}, icon: Icon(LineIcons.search, color: Theme.of(context).primaryColorDark,)),
                                                validate: (value){},
                                                onChanged: (value){}
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        }),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
