import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class Constants {
  static String latestVersion = "1.0.0.0";
  static int latestVersionNumber = 1000;
  static int currentVersionNumber = 1000;
  static double currentVersion = 1.0;
  static AdaptiveThemeMode? currentTheme = AdaptiveThemeMode.dark;

  static const sidebarColor = Color(0xFF535252);
  static const backgroundStartColor = Color(0xFF535252);
  static const backgroundEndColor = Color(0xFF575656);
  static const borderColor = Color(0xFF4C4B4B);

/*static final buttonColors = WindowButtonColors(
    iconNormal: Colors.white54,
    mouseOver: Colors.white30,
    mouseDown: Colors.white24,
    iconMouseOver: Colors.grey,
    iconMouseDown: Colors.grey);

static final closeButtonColors = WindowButtonColors(
    mouseOver: const Color(0xFFD32F2F),
    mouseDown: const Color(0xFFB71C1C),
    iconNormal: Colors.white54,
    iconMouseOver: Colors.white);*/
}
/*class LeftSide extends StatelessWidget {
  const LeftSide({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Container(
            color: Constants.backgroundEndColor,
            child: WindowTitleBarBox(child: Align(alignment: Alignment.centerLeft,
                child: Row(
              children: const [
                Icon(Icons.apple, color: Colors.white54,),
                SizedBox(width: 8,),
                Text("منظومة الارشيف", style: TextStyle(color: Colors.white54),),
              ],
            ))
            )));
  }
}
class RightSide extends StatelessWidget {
  const RightSide({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Constants.backgroundStartColor, Constants.backgroundEndColor],
              stops: [0.0, 1.0]),
        ),
        child: WindowTitleBarBox(
          child: Row(
            children: [Expanded(child: MoveWindow()), const WindowButtons()],
          ),
        ),
      ),
    );
  }
}
class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: Constants.buttonColors),
        MaximizeWindowButton(colors: Constants.buttonColors),
        CloseWindowButton(colors: Constants.closeButtonColors),
      ],
    );
  }
}*/
