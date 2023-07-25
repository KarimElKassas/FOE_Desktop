import 'package:egypt_future_chat_desktop/resources/font_manager.dart';
import 'package:egypt_future_chat_desktop/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../resources/constants_manager.dart';
import '../../../resources/language_manager.dart';
import '../../../utils/constant.dart';

class TextSwitcherWidget extends StatefulWidget {
  String? initialText;

  TextSwitcherWidget({required this.initialText});

  @override
  _TextSwitcherWidgetState createState() => _TextSwitcherWidgetState();
}

class _TextSwitcherWidgetState extends State<TextSwitcherWidget> {
  bool isEditing = false;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.initialText);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Text widget or TextFormField based on the editing state
        Expanded(
          child: isEditing
              ? TextFormField(
                  cursorWidth: AppSize.s1,
                  cursorColor: Theme.of(context)
                      .primaryColorDark
                      .withOpacity(AppSize.s0_8),
                  textAlignVertical: TextAlignVertical.center,
                  textAlign:
                      Constants.currentLocale == LanguageType.ARABIC.getValue()
                          ? TextAlign.start
                          : TextAlign.end,
                  controller: _textEditingController,
                  autofocus: true,
                  onChanged: (value) {
                    setState(() {
                      widget.initialText = value;
                    });
                  },
                  style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                  ),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColorDark),
                        borderRadius: BorderRadius.circular(AppSize.s10)
                  )),
                )
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      isEditing = true;
                    });
                  },
                  child: Text(
                    widget.initialText!,
                    style: TextStyle(
                      fontSize: AppSize.s20,
                      color: Theme.of(context).primaryColorDark,
                      fontFamily: FontConstants.family,
                    ),
                  ),
                ),
        ),
        // IconButton to toggle editing state
        IconButton(
          icon: Icon(
            isEditing ? Icons.done : Icons.edit,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            setState(() {
              isEditing = !isEditing;
            });
          },
        ),
      ],
    );
  }
}
