import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../resources/values_manager.dart';


class GalleryThumbnail extends StatelessWidget {
  const GalleryThumbnail({Key? key, required this.galleryItem, required this.messageId, this.onTap})
      : super(key: key);

  final String galleryItem;
  final String messageId;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: galleryItem,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSize.s4),
          child: Container(
            decoration: BoxDecoration(
              //borderRadius: BorderRadius.circular(48),
                color: Colors.transparent,
                image: DecorationImage(
                  image: Image.memory(
                    base64Decode(galleryItem),
                    scale: 1,
                  ).image,
                  fit: BoxFit.cover,
                )
            ),
            height: AppSize.s50,
            width: AppSize.s50,
            constraints: BoxConstraints(
              minHeight: 20.h
            ),
          ),
        ),
      ),
    );
  }
}