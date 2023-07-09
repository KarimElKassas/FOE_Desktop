import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'constants_manager.dart';
import 'values_manager.dart';

extension OnPressed on Widget {
  Widget ripple(Function onPressed,
      {BorderRadiusGeometry borderRadius =
      const BorderRadius.all(Radius.circular(AppSize.s5)), MaterialStateProperty<Color>? overlayColor}) =>
      Stack(
        children: <Widget>[
          this,
          Positioned(
            left: AppSize.s0,
            right: AppSize.s0,
            top: AppSize.s0,
            bottom: AppSize.s0,
            child: TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(borderRadius: borderRadius),
                    ),
                  overlayColor: overlayColor ?? (AppConstants.isDark() ? MaterialStateProperty.all(ColorManager.darkGreen.withOpacity(0.2)) : MaterialStateProperty.all(ColorManager.grey1.withOpacity(0.2))),
                ),
                onPressed: () {
                  onPressed();
                },
                child: Container()),
          )
        ],
      );
}