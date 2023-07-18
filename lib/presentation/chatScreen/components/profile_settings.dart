import 'package:egypt_future_chat_desktop/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../resources/asset_manager.dart';
class ProfileSettings extends StatelessWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(AppSize.s50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSize.s30),
            child: Container(
              height: AppSize.s100,
              width: AppSize.s100,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(ImageAsset.myImage),
                      fit: BoxFit.cover
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:AppSize.s30),
            child: Text('Data',style: TextStyle(fontSize: AppSize.s24,color: Colors.white),),
          ),
          Text('about',style: TextStyle(fontSize: AppSize.s16,color: Colors.white54),),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text('ur bio',style:TextStyle(fontSize: AppSize.s12,color: Colors.white)),
          ),
          Text('Phone number',style: TextStyle(fontSize: AppSize.s24,color: Colors.white54),),
          Text('11111111',style: TextStyle(fontSize: AppSize.s24,color: Colors.white),),
        ],
      ),
    );
  }
}
