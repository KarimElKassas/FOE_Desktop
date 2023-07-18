import 'package:egypt_future_chat_desktop/resources/values_manager.dart';
import 'package:flutter/material.dart';

class personalizationSetting extends StatelessWidget {
  personalizationSetting({Key? key}) : super(key: key);

  /*List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("dark"), value: "Dark"),
    DropdownMenuItem(child: Text("light"), value: "light"),
  ];*/

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.s30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: AppSize.s30),
            child: Text(
              'Personalization',
              style: TextStyle(fontSize: AppSize.s24, color: Colors.white),
            ),
          ),
          Text(
            'theme',
            style: TextStyle(color: Colors.white54, fontSize: AppSize.s20),
          ),
          //DropdownButton(items: menuItems, onChanged: () {})
        ],
      ),
    );
  }
}
