import 'package:flutter/material.dart';
import 'package:egypt_future_chat_desktop/resources/values_manager.dart';
import 'package:flutter_switch/flutter_switch.dart';

class NotificationSettings extends StatelessWidget {
  const NotificationSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.s30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: AppSize.s24),
            child: Text('Notifications',style: TextStyle(fontSize: AppSize.s24,color: Colors.white),),
          ),
          Row(
            children: [
              Text('when whatsapp is closed continue '
                  ,style: TextStyle(fontSize: AppSize.s12,color: Colors.grey),),

              Switch(value: false, onChanged: (bool value){})

            ],
          ),
        ],
      ),
    );
  }
}
