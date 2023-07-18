import 'package:flutter/material.dart';

import '../../../resources/values_manager.dart';

class StorageSetting extends StatelessWidget {
  const StorageSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const Text(
          'Storage',
          style: TextStyle(fontSize: AppSize.s24, color: Colors.white),
        ),
        const Text('choose which media will be auto downloaded from the massages you receive',style: TextStyle(fontSize: AppSize.s8,color: Colors.white54),
        ),
        CheckboxListTile(
          title: const Text('photos'),
          value: true,
          onChanged: (newValue) { },
          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
        ),
        CheckboxListTile(
          title: const Text('audio'),
          value: true,
          onChanged: (newValue) { },
          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
        ),
        CheckboxListTile(
          title: const Text('video'),
          value: true,
          onChanged: (newValue) { },
          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
        ),
        CheckboxListTile(
          title: const Text('documents'),
          value: true,
          onChanged: (newValue) { },
          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
        ),
      ],
    );
  }
}
