import 'package:flutter/material.dart';

import '../../../resources/values_manager.dart';
class HelpSettings extends StatelessWidget {
  const HelpSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSize.s10),
            child: Text('Help',style: TextStyle(fontSize: AppSize.s24,color: Colors.white),),
          ),
          Text('FOE for desktop',style: TextStyle(fontSize: AppSize.s24,color: Colors.white),),
          Padding(
            padding: EdgeInsets.all(AppSize.s10),
            child: Text('version 1.0.0.0',style: TextStyle(fontSize: AppSize.s16,color: Colors.white54),),
          ),
          Padding(
            padding: EdgeInsets.all(AppSize.s30),
            child: Divider(
              height: AppSize.s5,
              thickness: AppSize.s2,
              indent: AppSize.s10,
              endIndent: 0,
              color: Colors.grey,
            ),
            
          ),
          Text('Contact us',style: TextStyle(fontSize: AppSize.s24,color: Colors.white),),


        ],
      ),
    );
  }
}
