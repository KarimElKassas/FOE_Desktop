import 'package:egypt_future_chat_desktop/resources/values_manager.dart';
import 'package:flutter/material.dart';
class AccountSettings extends StatelessWidget {
  const AccountSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal:AppSize.s30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
          padding: EdgeInsets.only(top: AppSize.s40,bottom: AppSize.s24),
          child: Text('Account',style: TextStyle(fontSize: AppSize.s24,color: Colors.white),),
        ),
          Text('Privacy',style: TextStyle(color: Colors.white54),),
          Padding(
            padding: EdgeInsets.only(bottom: AppSize.s30),
            child: Text('Managed on your phone',style: TextStyle(color: Colors.white54),),
          ),
          Text('Nobody',style: TextStyle(color: Colors.white,fontSize: AppSize.s20),),
          Padding(
            padding: EdgeInsets.only(bottom: AppSize.s10),
            child: Text('if u dont dont share last seen',style: TextStyle(color: Colors.white54,fontSize: AppSize.s15),),
          ),
          Text('Every one',style: TextStyle(color: Colors.white,fontSize: AppSize.s20),),
          Text('if u dont dont share last seen',style: TextStyle(color: Colors.white54,fontSize: AppSize.s15),),



      ],
      ),
    );
  }
}
