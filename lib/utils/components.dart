import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:egypt_future_chat_desktop/resources/language_manager.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import '../presentation/chatScreen/components/gallery/gallery_item_wrapper_view.dart';
import '../resources/asset_manager.dart';
import '../resources/color_manager.dart';
import '../resources/constants_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';
import 'constant.dart';

class ReusableComponents {
  static Widget registerTextField(
      {required BuildContext context,
      required TextInputType textInputType,
      required String hintText,
      required TextInputAction textInputAction,
      required Function(String? value) validate,
      required Function(String? value) onChanged,
      TextStyle? textStyle,
      Widget? suffixIcon,
      Widget? prefixIcon,
      bool? isPassword,
      Color? background,
      Color? borderColor,
      BorderStyle? borderStyle,
      double? borderRadius,
      int? maxLines,
      TextEditingController? controller}) {
    return TextFormField(
      controller: controller,
      cursorWidth: AppSize.s1,
      maxLines: maxLines ?? 1,
      cursorColor: Theme.of(context).primaryColorDark.withOpacity(AppSize.s0_8),
      textDirection: AppConstants.isArabic() ? ui.TextDirection.rtl : ui.TextDirection.ltr,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      obscureText: isPassword ?? false,
      textAlignVertical: TextAlignVertical.center,
      textAlign: Constants.currentLocale == LanguageType.ARABIC.getValue() ? TextAlign.start : TextAlign.end,
      validator: (value) => validate(value),
      onChanged: (value) => onChanged(value),
      decoration: InputDecoration(
          filled: true,
          fillColor: background ?? ColorManager.white.withOpacity(AppSize.s0_8),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? AppSize.s8)),
            borderSide: BorderSide(
                width: AppSize.s0_2,
                style: borderStyle ?? BorderStyle.solid,
                color: borderColor ?? Theme.of(context).primaryColorDark),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(borderRadius ?? AppSize.s8)),
            borderSide: BorderSide(
              width: AppSize.s0_2,
              style: borderStyle ?? BorderStyle.solid,
              color: ColorManager.error,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(borderRadius ?? AppSize.s8)),
            borderSide: BorderSide(
                width: AppSize.s0_2,
                style: borderStyle ?? BorderStyle.solid,
                color: ColorManager.error),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(borderRadius ?? AppSize.s8)),
            borderSide: BorderSide(
                width: AppSize.s0_2,
                style: borderStyle ?? BorderStyle.solid,
                color: Theme.of(context).primaryColorDark),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(borderRadius ?? AppSize.s8)),
            borderSide: BorderSide(
                width: AppSize.s0_2,
                style: borderStyle ?? BorderStyle.solid,
                color: Theme.of(context).primaryColorDark),
          ),
          floatingLabelStyle:
              TextStyle(color: Theme.of(context).primaryColorDark),
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: AppSize.s14,
              backgroundColor: Colors.transparent,
              color:
                  Theme.of(context).primaryColorDark.withOpacity(AppSize.s0_8),
              fontFamily: FontConstants.family,
              fontWeight: FontWeightManager.bold),
          //alignLabelWithHint: true,
          errorStyle: TextStyle(
              fontSize: AppSize.s12,
              color: ColorManager.error,
              fontFamily: FontConstants.family,
              fontWeight: FontWeightManager.bold),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintTextDirection: AppConstants.isArabic()
              ? ui.TextDirection.rtl
              : ui.TextDirection.ltr,
          border: OutlineInputBorder(
              borderSide: BorderSide(
                width: AppSize.s0_2,
                color: borderColor ?? Theme.of(context).primaryColorDark,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius ?? AppSize.s8))),
          prefixIcon: prefixIcon,
          contentPadding: const EdgeInsets.symmetric(horizontal: AppSize.s12),
          suffixIcon: suffixIcon,
          errorMaxLines: 2),
      style: textStyle ??
          TextStyle(
              fontSize: AppSize.s14,
              color: Theme.of(context).primaryColorDark.withOpacity(AppSize.s0_8),
              fontFamily: FontConstants.family,
              fontWeight: FontWeightManager.bold),
    );
  }

  static Widget defaultButton({
    double width = double.infinity,
    double height = AppSize.s50,
    Color background = Colors.deepPurple,
    Color textColor = Colors.white,
    Color borderColor = Colors.white,
    TextStyle? textStyle,
    double radius = AppSize.s8,
    bool isUpperCase = false,
    bool outline = false,
    required VoidCallback function,
    required String text,
  }) =>
      Container(
        padding: EdgeInsets.zero,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            color: outline ? Colors.transparent : background,
            border: Border.all(
              color: borderColor,
              width: AppSize.s0_8,
            )),
        child: MaterialButton(
          onPressed: function,
          height: height,
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            textAlign: TextAlign.center,
            style: textStyle ??
                TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    letterSpacing: 2,
                    color: textColor),
          ),
        ),
      );

  static void showMToast(
      BuildContext context, String message, Color background) {
    showToast(
      message,
      backgroundColor: background,
      context: context,
      position: StyledToastPosition.bottom,
      animDuration: const Duration(seconds: 1),
      duration: const Duration(milliseconds: 2500),
      animationBuilder: (
        BuildContext context,
        AnimationController controller,
        Duration duration,
        Widget child,
      ) {
        return SlideTransition(
          position: getAnimation<Offset>(
              const Offset(0.0, 3.0), const Offset(0, 0), controller,
              curve: Curves.bounceInOut),
          child: child,
        );
      },
      reverseAnimBuilder: (
        BuildContext context,
        AnimationController controller,
        Duration duration,
        Widget child,
      ) {
        return SlideTransition(
          position: AppConstants.isArabic()
              ? (getAnimation<Offset>(
                  const Offset(0.0, 0.0), const Offset(-3.0, 0), controller,
                  curve: Curves.easeInOut))
              : (getAnimation<Offset>(
                  const Offset(0.0, 0.0), const Offset(3.0, 0), controller,
                  curve: Curves.easeInOut)),
          child: child,
        );
      },
    );
  }
  static Widget cachedImage(
      {required String url,
        required BorderRadius borderRadius,
        BoxFit? fit,
        double? height, double? width}) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => ClipRRect(
        borderRadius: borderRadius,
        child: FadeInImage(
          height: height,
          width: width,
          fit: fit??BoxFit.fill,
          image: imageProvider,
          placeholder: const AssetImage(ImageAsset.placeholder),
          imageErrorBuilder: (context, error, stackTrace) {
            print("ERROR IN IMAGE : $error\n");
            return Image.asset(
              ImageAsset.error,
              fit: BoxFit.fill,
              height: height,
              width: width,
            );
          },
        ),
      ),
      placeholder: (context, url) => CircularProgressIndicator(
        color: ColorManager.lightGreen,
        strokeWidth: AppSize.s0_8,
      ),
      errorWidget: (context, url, error) => FadeInImage(
        height: height,
        width: width,
        fit: BoxFit.fill,
        image: const AssetImage(ImageAsset.error),
        placeholder: const AssetImage(ImageAsset.placeholder),
      ),
    );
  }

  static void openImageFullScreen(
      BuildContext context, List<String> imagesList, final int index, {bool? isFile}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryImageWrapper(
          isFile: isFile??false,
          titleGallery: "",
          galleryItems: imagesList,
          backgroundDecoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(4)),
          initialIndex: index,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

}

class BlurryProgressDialog extends StatelessWidget {
  final String title;
  TextStyle? titleStyle;
  double? titleMinSize, titleMaxSize, blurValue;
  int? titleMaxLines;

  BlurryProgressDialog(
      {Key? key,
      required this.title,
      this.titleStyle,
      this.titleMaxLines,
      this.titleMaxSize,
      this.titleMinSize,
      this.blurValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          AppConstants.isArabic() ? ui.TextDirection.rtl : ui.TextDirection.ltr,
      child: BackdropFilter(
          filter: ui.ImageFilter.blur(
              sigmaX: blurValue ?? 4, sigmaY: blurValue ?? 4),
          child: AlertDialog(
            backgroundColor: Theme.of(context).backgroundColor,
            scrollable: true,
            content: Column(
              children: [
                CircularProgressIndicator(
                  color: Theme.of(context).primaryColorDark,
                  strokeWidth: AppSize.s0_8,
                ),
                const SizedBox(
                  height: AppSize.s36,
                ),
                AutoSizeText(
                  title,
                  style: titleStyle ??
                      TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontSize: AppSize.s12),
                  minFontSize: titleMinSize ?? AppSize.s12,
                  maxFontSize: titleMaxSize ?? AppSize.s14,
                  maxLines: titleMaxLines ?? AppSize.s2.toInt(),
                ),
                const SizedBox(
                  height: AppSize.s8,
                ),
              ],
            ),
          )),
    );
  }
}

class TextFieldDialog extends StatelessWidget {
  Widget content;
  TextStyle? titleTextStyle;
  TextStyle? contentTextStyle;
  TextStyle? okTextStyle;
  TextStyle? noTextStyle;
  double? titleTextMinSize;
  double? titleTextMaxSize;
  double? contentTextMinSize;
  double? contentTextMaxSize;
  int? contentTextMaxLines;
  double? okTextMinSize;
  double? okTextMaxSize;
  double? noTextMinSize;
  double? noTextMaxSize;
  double? blurValue;
  VoidCallback continueCallBack;
  VoidCallback cancelCallBack;

  TextFieldDialog(this.content, this.continueCallBack, this.cancelCallBack,
      {Key? key,
      this.titleTextStyle,
      this.contentTextStyle,
      this.okTextStyle,
      this.noTextStyle,
      this.blurValue,
      this.titleTextMinSize,
      this.titleTextMaxSize,
      this.contentTextMinSize,
      this.contentTextMaxSize,
      this.contentTextMaxLines,
      this.okTextMinSize,
      this.okTextMaxSize,
      this.noTextMinSize,
      this.noTextMaxSize})
      : super(key: key);
  TextStyle textStyle =
      TextStyle(color: ColorManager.lightGreen, fontSize: AppSize.s12);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          AppConstants.isArabic() ? ui.TextDirection.rtl : ui.TextDirection.ltr,
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(
            sigmaX: blurValue ?? AppSize.s4, sigmaY: blurValue ?? AppSize.s4),
        child: AlertDialog(
          backgroundColor: Theme.of(context).backgroundColor,
          content:
              SizedBox(width: AppSize.sFullWidth, height: 100, child: content),
          contentPadding: const EdgeInsets.all(AppSize.s8),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                continueCallBack();
              },
              style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith((states) =>
                      AppConstants.isDark()
                          ? ColorManager.veryLightWhite
                          : ColorManager.veryLightGreen)),
              child: AutoSizeText(
                AppStrings.ok.tr(),
                style: okTextStyle ?? textStyle,
                minFontSize: okTextMinSize ?? AppSize.s10,
                maxLines: AppSize.s1.toInt(),
                maxFontSize: okTextMaxSize ?? AppSize.s12,
              ),
            ),
            TextButton(
              onPressed: () {
                cancelCallBack();
              },
              style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith((states) =>
                      AppConstants.isDark()
                          ? ColorManager.veryLightWhite
                          : ColorManager.veryLightGreen)),
              child: AutoSizeText(
                AppStrings.cancel.tr(),
                style: noTextStyle ?? textStyle,
                minFontSize: noTextMinSize ?? AppSize.s10,
                maxLines: AppSize.s1.toInt(),
                maxFontSize: noTextMaxSize ?? AppSize.s12,
              ),
            ),
          ],
          buttonPadding: const EdgeInsets.all(AppSize.s4),
        ),
      ),
    );
  }
}


