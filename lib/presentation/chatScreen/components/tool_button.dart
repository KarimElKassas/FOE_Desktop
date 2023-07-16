import 'package:egypt_future_chat_desktop/resources/extentions.dart';
import 'package:flutter/material.dart';
import '../../../resources/values_manager.dart';

class ToolButton extends StatelessWidget {
  IconData iconData;
  Function onPressed;
  VoidCallback onEnter, onExit;
  Color iconButtonBackground;
  EdgeInsetsGeometry? padding;

  ToolButton(this.iconData, this.onPressed, this.onEnter, this.onExit, this.iconButtonBackground, {super.key, this.padding});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event){
        onEnter();
      },
      onExit: (event){
        onExit();
      },
      child: Container(
        padding: padding ?? const EdgeInsets.symmetric(vertical: AppSize.s6,horizontal: AppSize.s18),
        decoration: BoxDecoration(
          color: iconButtonBackground,
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
        ),
        child: Icon(
          iconData,
          color: Theme.of(context).primaryColorDark,
        ),
      ).ripple(onPressed,
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
          overlayColor: MaterialStateColor.resolveWith((states) => iconButtonBackground.withOpacity(AppSize.s0_2))),
    );
  }
}
