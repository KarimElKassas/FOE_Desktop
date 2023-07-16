import 'package:easy_localization/easy_localization.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/bloc/home_states.dart';
import 'package:egypt_future_chat_desktop/resources/extentions.dart';
import 'package:egypt_future_chat_desktop/utils/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sidebarx/sidebarx.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';
import '../bloc/home_cubit.dart';
import '../dummyValues/dummy_values.dart';
import '../dummyValues/user.dart';
import 'chat_list_header.dart';

class ChatListWidget extends StatelessWidget {
  const ChatListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state){
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
                    padding: const EdgeInsets.only(bottom: AppSize.s16,right: AppSize.s8,left: AppSize.s8),
                    child: SizedBox(
                      child: ReusableComponents.registerTextField(
                          context: context,
                          background: Colors.transparent,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: AppSize.s12),
                            child: Icon(Icons.search, color: Theme.of(context).primaryColorDark),
                          ),
                          textInputType: TextInputType.text,
                          hintText: AppStrings.searchText.tr(),
                          textInputAction: TextInputAction.search,
                          validate: (value){}),
                    ),
                  ),
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
                              cubit.changeChatRowBackground(Theme.of(context).splashColor);
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
                            ).ripple((){cubit.changeSelectedUser(index);}, borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)), overlayColor: MaterialStateColor.resolveWith((states) => Theme.of(context).splashColor.withOpacity(AppSize.s0_2))),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            Center(
              child: Text('Settings', style: TextStyle(color: Theme
                  .of(context)
                  .primaryColorDark),),
            ),
          ],
        );
      },
    );
  }
}