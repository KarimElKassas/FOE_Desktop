import 'package:after_layout/after_layout.dart';
import 'package:contextmenu/contextmenu.dart';
import 'package:egypt_future_chat_desktop/resources/language_manager.dart';
import 'package:egypt_future_chat_desktop/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:language_picker/languages.dart';

const double _kMinTileHeight = 24;

/// The actual [ContextMenu] to be displayed
///
/// You will most likely use [showContextMenu] to manually display a [ContextMenu].
///
/// If you just want to use a normal [ContextMenu], please use [ContextMenuArea].

class MContextMenu extends StatefulWidget {
  /// The [Offset] from coordinate origin the [ContextMenu] will be displayed at.
  final Offset position;

  /// The builder for the items to be displayed. [ListTile] is very useful in most cases.
  final ContextMenuBuilder builder;

  /// The padding value at the top an bottom between the edge of the [ContextMenu] and the first / last item
  final double verticalPadding;

  /// The width for the [ContextMenu]. 320 by default according to Material Design specs.
  final double width;

  const MContextMenu({
    Key? key,
    required this.position,
    required this.builder,
    this.verticalPadding = 8,
    this.width = 320,
  }) : super(key: key);

  @override
  _MContextMenuState createState() => _MContextMenuState();
}

class _MContextMenuState extends State<MContextMenu> {
  Map<ValueKey, double> _heights = Map();

  @override
  Widget build(BuildContext context) {
    final children = widget.builder(context);

    double height = 2 * widget.verticalPadding;

    _heights.values.forEach((element) {
      height += element;
    });

    final heightsNotAvailable = children.length - _heights.length;
    height += heightsNotAvailable * _kMinTileHeight;

    if (height > MediaQuery.of(context).size.height) {
      height = MediaQuery.of(context).size.height;
    }
    double leftOnArabic = widget.position.dx - widget.width;
    double leftOnEnglish = widget.position.dx;

    double rightOnArabic = MediaQuery.of(context).size.width - widget.position.dx;
    double rightOnEnglish = MediaQuery.of(context).size.width - widget.position.dx - widget.width;

    double paddingLeft = Constants.currentLocale == LanguageType.ARABIC.getValue() ? leftOnArabic : leftOnEnglish;
    double paddingTop = widget.position.dy + 16;
    double paddingRight = Constants.currentLocale == LanguageType.ARABIC.getValue() ? rightOnArabic : rightOnEnglish;

    if (paddingRight < 0) {
      paddingLeft += paddingRight;
      paddingRight = 0;
    }
    double paddingBottom = MediaQuery.of(context).size.height - widget.position.dy - height;
    if (paddingBottom < 0) {
      paddingTop += paddingBottom;
      paddingBottom = 0;
    }
    return AnimatedPadding(
      padding: EdgeInsets.fromLTRB(
        paddingLeft,
        paddingTop,
        paddingRight,
        paddingBottom,
      ),
      duration: _kShortDuration,
      child: SizedBox.shrink(
        child: Card(
          color: Colors.grey,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Material(
              type: MaterialType.card,
              elevation: 0,
              color: Colors.transparent,
              child: ListView(
                primary: false,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: widget.verticalPadding),
                children: children
                    .map(
                      (e) => _GrowingWidget(
                    child: e,
                    onHeightChange: (height) {
                      setState(() {
                        _heights[ValueKey(e)] = height;
                      });
                    },
                  ),
                )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const _kShortDuration = Duration(milliseconds: 75);

class _GrowingWidget extends StatefulWidget {
  final Widget child;
  final ValueChanged<double> onHeightChange;

  const _GrowingWidget(
      {Key? key, required this.child, required this.onHeightChange})
      : super(key: key);

  @override
  __GrowingWidgetState createState() => __GrowingWidgetState();
}

class __GrowingWidgetState extends State<_GrowingWidget> with AfterLayoutMixin {
  GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child,
      key: _key,
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    final newHeight = _key.currentContext!.size!.height;
    widget.onHeightChange.call(newHeight);
  }
}
