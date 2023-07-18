import 'package:egypt_future_chat_desktop/utils/components.dart';
import 'package:flutter/material.dart';
import 'package:egypt_future_chat_desktop/resources/values_manager.dart';

class ChatSettings extends StatelessWidget {
  const ChatSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: AppSize.s10, bottom: AppSize.s24),
          child: Text('Chats',
              style: TextStyle(color: Colors.white, fontSize: AppSize.s24)),
        ),
        const Text(
          'Chat history',
          style: TextStyle(fontSize: AppSize.s16, color: Colors.white54),
        ),
        const Text(
          'Synced with your phone',
          style: TextStyle(fontSize: AppSize.s16, color: Colors.white54),
        ),
        ReusableComponents.defaultButton(
            function: () {},
            text: 'Archive all chats',
            background: Colors.transparent,
            width: AppSize.s16),
        const Text(
          'You still receive new massages from archived chats',
          style: TextStyle(),
        ),
        ReusableComponents.defaultButton(
            function: () {},
            text: 'Clear all massages',
            background: Colors.transparent,
            width: AppSize.s16,
            textColor: Colors.redAccent),
        const Text(
          'Delete all massages from chats and groups',
          style: TextStyle(fontSize: AppSize.s10, color: Colors.white54),
        ),
        ReusableComponents.defaultButton(
            function: () {},
            text: 'Delete all Chats',
            background: Colors.transparent,
            width: AppSize.s16,
            textColor: Colors.redAccent),
        const Text(
          'Delete all massages and clear chats from history',
          style: TextStyle(fontSize: AppSize.s10, color: Colors.white54),
        )
      ],
    );
  }
}
