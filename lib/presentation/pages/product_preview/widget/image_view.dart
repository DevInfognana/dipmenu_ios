// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dipmenu_ios/core/config/app_textstyle.dart';
import 'package:dipmenu_ios/core/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';




class ImageView extends StatelessWidget {
  ImageView(
      {Key? key,
        this.imageUrl,
        this.name,
        this.index,
        required this.showValues,
        this.selectedIndex,
        this.mainImageViewWidth,
        this.bottomImageViewHeight})
      : super(key: key);
  String? imageUrl;
  String? name;
  int? index;
  bool showValues = false;
  int? selectedIndex;
  double? mainImageViewWidth;
  double? bottomImageViewHeight;




  @override
  Widget build(BuildContext context) {
    return Container(
      width: mainImageViewWidth,
      margin: EdgeInsets.all(1.h),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            showValues == true
                ? (index == selectedIndex
                ? BoxShadow(
                color: mainColor, // Change color of the shadow
                blurRadius: 5.0,
                spreadRadius: 3.0)
                : const BoxShadow())
                : const BoxShadow()
          ],
          borderRadius: BorderRadius.circular(4.w)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: imageUrl!,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress,
                            color: mainColor)),
                errorWidget: (context, url, error) => Image.network(
                    'https://i.pinimg.com/originals/dc/66/53/dc6653448a617b0564541708101d3eac.gif',
                    fit: BoxFit.cover)),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: bottomImageViewHeight,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(4.w),
                        bottomRight: Radius.circular(4.w)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, -7))
                    ]),
                child: Center(
                    child: Text(name!,
                        style: TextStore.textTheme.headlineSmall!.copyWith(
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w900))),
              )),
        ],
      ),
    );
  }
}
