import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/bloc/home_states.dart';
import 'package:egypt_future_chat_desktop/resources/language_manager.dart';
import 'package:egypt_future_chat_desktop/utils/components.dart';
import 'package:egypt_future_chat_desktop/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:iconly/iconly.dart';
import 'package:sizer/sizer.dart';
import '../../../data/models/chat_model.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/constants_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';
import '../bloc/home_cubit.dart';
import 'chat_list_header.dart';
import 'dart:ui' as ui;

class ChatListWidget extends StatelessWidget {
  const ChatListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return PageView(
          controller: cubit.chatListPageController,
          children: [
            SizedBox(
              height: AppSize.sFullHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(AppSize.s16),
                    child: ChatListHeader(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: AppSize.s16,
                        right: AppSize.s8,
                        left: AppSize.s8),
                    child: SizedBox(
                      child: ReusableComponents.registerTextField(
                          context: context,
                          background: Colors.transparent,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.s12),
                            child: Icon(Icons.search,
                                color: Theme.of(context).primaryColorDark),
                          ),
                          textInputType: TextInputType.text,
                          hintText: AppStrings.searchText.tr(),
                          textInputAction: TextInputAction.search,
                          validate: (value) {},
                          onChanged: (value){
                            cubit.search(value??"");
                          }
                      ),
                    ),
                  ),
                  cubit.filteredChatList == null
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColorDark,
                            strokeWidth: AppSize.s0_8,
                          ),
                        )
                      : ValueListenableBuilder(
                    valueListenable: AppConstants.boxKeyNotifier,
                    builder: (context, bool value, _){
                      return value ? ValueListenableBuilder(
                        valueListenable: Hive.box('chatsBox').listenable(),
                        builder: (context, Box box, _){
                          return ListView.builder(
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: box.values.length,
                              itemBuilder: (context, index) => listItem(context, cubit, index, box));
                        },
                      ) : const SizedBox.shrink();
                    },
                  )
                  /*ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: cubit.filteredChatList?.length,
                          itemBuilder: (context, index) =>
                              listItem(context, cubit, index))*/
                  /*
                  ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    shrinkWrap: true,
                    itemCount: DummyValues.listOfUsers.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppSize.s6),
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            onEnter: (event){
                              cubit.changeChatRowBackground(Theme.of(context)lashColor);
                            },
                            onExit: (event){
                              cubit.changeChatRowBackground(Colors.transparent);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: AppSize.s18,vertical: AppSize.s6),
                              decoration: BoxDecoration(
                                color: cubit.chatRowBackground,
                                borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                              ),
                              child: Row(
                                children: [
                                  ClipOval(
                                    child: CircleAvatar(
                                      child: SvgPicture.asset(DummyValues.listOfUsers[index].imagePath),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: AppSize.s8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text(
                                          DummyValues.listOfUsers[index]
                                              .userName,
                                          style: TextStyle(
                                              fontWeight: FontWeightManager
                                                  .bold,
                                              fontFamily: FontConstants.family,
                                              fontSize: FontSize.s18,
                                              color: Theme
                                                  .of(context)
                                                  .primaryColorDark),
                                        ),
                                        Text(DummyValues.listOfUsers[index].messages.last,
                                          style: TextStyle(
                                              fontWeight: FontWeightManager.bold,
                                              fontFamily: FontConstants.family,
                                              fontSize: FontSize.s14,
                                              color: Theme.of(context).disabledColor),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ).ripple((){cubit.changeSelectedUser(index);}, borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)), overlayColor: MaterialStateColor.resolveWith((states) => Theme.of(context)lashColor.withOpacity(AppSize.s0_2))),
                          ),
                        ),
                      );
                    },
                  )
*/
                ],
              ),
            ),
            Center(
              child: Text(
                'Settings',
                style: TextStyle(color: Theme.of(context).primaryColorDark),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget listItem(BuildContext context, HomeCubit cubit, int index, Box box) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s8),
      child: InkWell(
        onTap: () {
          /*cubit.openBox();
          Navigator.pushNamed(context, RoutesManager.conversationRoute,
              arguments: ConversationArguments(cubit.chatList![index].toJson(), 'Display'));*/
        },
        child: Row(
          children: [
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return SlideInUp(
                          duration: const Duration(milliseconds: 300),
                          child: Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppSize.s12),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.file(
                                    File("\\\\172.16.8.45\\it\\Chat_Media\\UserProfileImage\\01559700500.jpg"),
                                    height: AppSize.s45Height,
                                    width: AppSize.sFullWidth),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColorDark,
                      width: AppSize.s1),
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.3 / 8,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppSize.s2),
                  child:CircleAvatar(
                    radius: AppSize.s28,
                    backgroundImage:
                    FileImage(File("\\\\172.16.8.45\\it\\Chat_Media\\UserProfileImage\\01559700500.jpg"),),
                    backgroundColor: Colors.transparent,
                  ) /*ReusableComponents.cachedImage(
                      url: "file:///\\\\172.16.8.45\\it\\Chat_Media\\01017268677.jpg",
                      borderRadius: BorderRadius.circular(AppSize.s48))*/,
                ),
              ),
            ),
            const SizedBox(
              width: AppSize.s8,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: AppSize.s6.toInt(),
                        child: Text(
                          "El Qassas",
                          style: TextStyle(
                              color: Theme.of(context).primaryColorDark,
                              fontFamily: FontConstants.family,
                              fontSize: AppSize.s18,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeightManager.bold),
                          maxLines: AppSize.s1.toInt(),
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: AppSize.s2.toInt(),
                        child: Text(
                           "TIME", //cubit.formatShortTime(cubit.filteredChatList![index].lastMessageDto.messageTimeString.toString()),
                          style: TextStyle(
                            color: Theme.of(context).disabledColor,
                            fontFamily: FontConstants.family,
                            fontSize: AppSize.s16,
                            overflow: TextOverflow.ellipsis,
                          ),
                          textDirection: ui.TextDirection.ltr,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.s6,
                  ),
                  cubit.filteredChatList![index].lastMessageDto.messageTypeId ==
                          1 || cubit.filteredChatList![index].lastMessageDto.messageTypeId ==
                      8 // text
                      ? Text(
                          "Message",//cubit.filteredChatList![index].lastMessageDto.messageText,
                          style: TextStyle(
                            color: Theme.of(context).primaryColorDark,
                            fontFamily: FontConstants.family,
                            fontSize: AppSize.s16,
                            fontWeight: FontWeightManager.light,
                            overflow: TextOverflow.ellipsis,
                          ),
                          overflow: TextOverflow.ellipsis,
                          textDirection: Constants.currentLocale ==
                                  LanguageType.ARABIC.getValue()
                              ? ui.TextDirection.rtl
                              : ui.TextDirection.ltr,
                          maxLines: AppSize.s1.toInt(),
                        )
                      : const SizedBox.shrink(),
                  cubit.filteredChatList![index].lastMessageDto.messageTypeId ==
                              2 || // image
                          cubit.filteredChatList![index].lastMessageDto.messageTypeId ==
                              3 || // image and text
                          cubit.filteredChatList![index].lastMessageDto.messageTypeId ==
                              4 || // file
                          cubit.filteredChatList![index].lastMessageDto.messageTypeId ==
                              5 // audio
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              cubit.filteredChatList![index].lastMessageDto
                                              .messageTypeId ==
                                          2 || // image
                                      cubit.filteredChatList![index].lastMessageDto
                                              .messageTypeId ==
                                          3 // image and text
                                  ? IconlyBroken.image
                                  : cubit.filteredChatList![index].lastMessageDto
                                              .messageTypeId ==
                                          4 // file
                                      ? IconlyBroken.document
                                      : Icons.mic,
                              color: Theme.of(context).disabledColor,
                              size: AppSize.s20,
                            ),
                            const SizedBox(
                              width: AppSize.s4,
                            ),
                            SizedBox(
                              width: AppSize.s60Width,
                              child: Text(
                                "Message", //cubit.filteredChatList![index].lastMessageDto.messageText,
                                style: TextStyle(
                                  color: AppConstants.isDark()
                                      ? ColorManager.white54
                                      : ColorManager.grey,
                                  fontFamily: FontConstants.family,
                                  fontSize: AppSize.s16,
                                  fontWeight: FontWeightManager.light,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                overflow: TextOverflow.ellipsis,
                                textDirection: Constants.currentLocale ==
                                        LanguageType.ARABIC.getValue()
                                    ? ui.TextDirection.rtl
                                    : ui.TextDirection.ltr,
                                maxLines: AppSize.s1.toInt(),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
