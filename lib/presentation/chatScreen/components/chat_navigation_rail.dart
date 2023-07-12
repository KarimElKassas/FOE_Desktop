import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';

class ChatNavigationRail extends StatefulWidget {
  const ChatNavigationRail({Key? key}) : super(key: key);

  @override
  State<ChatNavigationRail> createState() => _ChatNavigationRailState();
}

class _ChatNavigationRailState extends State<ChatNavigationRail> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {

    return  NavigationRail(
      backgroundColor: ColorManager.darkGoldColor,
      elevation: 10,
      useIndicator: true,
      indicatorColor: ColorManager.black,
      selectedIndex: _selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      destinations: <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(
            Icons.chat_bubble_outline_rounded,
            color: ColorManager.black,
          ),
          selectedIcon: const Icon(Icons.chat_rounded),
          label: const Text('Chats'),
        ),
        NavigationRailDestination(
          icon: Icon(
            Icons.archive_outlined,
            color: ColorManager.black,
          ),
          selectedIcon: Icon(Icons.archive_rounded),
          label: Text('Archive'),
        ),
      ],
      trailing: Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: AppSize.s10),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings),
            ),
          ),
        ),
      ),
      selectedIconTheme: Theme.of(context).primaryIconTheme,
    );
  }
}