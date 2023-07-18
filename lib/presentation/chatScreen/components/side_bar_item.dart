import 'package:flutter/material.dart';
class SideBarItem extends StatelessWidget {
   SideBarItem({super.key, required this.itemTitle,required this.itemIcon});
String itemTitle;
Icon itemIcon;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(5.0))
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(itemTitle, style: TextStyle(color: Colors.grey)),
                Icon(itemIcon as IconData?, color: Colors.grey)
              ])),
      onTap: () {

      },
    );
  }
}
