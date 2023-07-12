import 'package:easy_localization/easy_localization.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/dummyValues/user.dart';
import 'package:egypt_future_chat_desktop/resources/strings_manager.dart';
import 'package:egypt_future_chat_desktop/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/asset_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../components/chat_list_header.dart';
import '../components/chat_navigation_rail.dart';
import '../dummyValues/dummy_values.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<User?> chosenUser = ValueNotifier(null);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: Row(
        children: [
          const ChatNavigationRail(),
          Container(
            height: AppSize.sFullHeight,
            width: AppSize.s45Width,
            color: ColorManager.black25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(AppSize.s16),
                  child: ChatListHeader(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSize.s15),
                  child: TextFormField(
                    cursorColor: ColorManager.darkGoldColor,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColorDark),
                        borderRadius: BorderRadius.circular(AppSize.s8),
                      ),
                      suffixIcon: const Icon(Icons.search_rounded),
                      suffixIconColor: Theme.of(context).primaryColorDark,
                      hintText: AppStrings.searchText.tr(),
                    ),
                    style: TextStyle(
                        fontWeight: FontWeightManager.bold,
                        fontFamily: FontConstants.family,
                        fontSize: FontSize.s18,
                        color: Theme.of(context).primaryColorDark),
                  ),
                ),
                const SizedBox(height: AppSize.s15),
                ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  shrinkWrap: true,
                  itemCount: DummyValues.listOfUsers.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        chosenUser.value = DummyValues.listOfUsers[index];
                      },
                      splashColor: ColorManager.darkGoldColor,
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSize.s8),
                          child: Row(
                            children: [
                              ClipOval(
                                child: CircleAvatar(
                                  child: SvgPicture.asset(
                                      DummyValues.listOfUsers[index].imagePath),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppSize.s8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      DummyValues.listOfUsers[index].userName,
                                      style: TextStyle(
                                          fontWeight: FontWeightManager.bold,
                                          fontFamily: FontConstants.family,
                                          fontSize: FontSize.s18,
                                          color: Theme.of(context)
                                              .primaryColorDark),
                                    ),
                                    Text(
                                      DummyValues
                                          .listOfUsers[index].messages.last,
                                      style: TextStyle(
                                          fontWeight: FontWeightManager.bold,
                                          fontFamily: FontConstants.family,
                                          fontSize: FontSize.s14,
                                          color:
                                              Theme.of(context).disabledColor),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          const SizedBox(
            width: AppSize.s2,
          ),
          ValueListenableBuilder(
              valueListenable: chosenUser,
              builder: (context, chosenUser, child) {
                if (chosenUser == null) {
                  return Expanded(
                    child: Container(
                      color: ColorManager.black25,
                      child: Column(
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
                      ),
                    ),
                  );
                } else {
                  return Expanded(
                    child: Container(
                      color: ColorManager.black25,
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
                          ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: chosenUser.messages.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(AppSize.s10),
                                child: ListTile(
                                  tileColor: Theme.of(context).highlightColor,
                                  shape: const StadiumBorder(),
                                  title: Text(
                                    chosenUser.messages[index],
                                    style: TextStyle(
                                        fontWeight: FontWeightManager.bold,
                                        fontFamily: FontConstants.family,
                                        fontSize: FontSize.s18,
                                        color:
                                            Theme.of(context).primaryColorDark),
                                  ),
                                ),
                              );
                            },
                          ),
                          const Spacer(),
                          Container(
                            width: double.infinity,
                            height: AppSize.s60,
                            color: Theme.of(context).primaryColorLight,
                            child: Padding(
                              padding: const EdgeInsets.all(AppSize.s8),
                              child: TextFormField(
                                cursorColor: ColorManager.darkGoldColor,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Theme.of(context).primaryColorDark),
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s8),
                                  ),
                                  suffixIcon: IconButton(
                                      onPressed: () {}, icon: Icon(Icons.send)),
                                  suffixIconColor:
                                      Theme.of(context).primaryColorDark,
                                ),
                                style: TextStyle(
                                    fontWeight: FontWeightManager.bold,
                                    fontFamily: FontConstants.family,
                                    fontSize: FontSize.s18,
                                    color: Theme.of(context).primaryColorDark),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }),
        ],
      ),
    );
  }
}
