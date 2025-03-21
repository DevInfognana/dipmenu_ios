
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dip_menu/core/config/icon_config.dart';
import 'package:dip_menu/presentation/logic/controller/product_preview_controller.dart';
import 'package:dip_menu/extra/common_widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_textstyle.dart';
import '../../../../core/config/theme.dart';

class MySliverAppBar extends SliverPersistentHeaderDelegate {

  final double expandedHeight;
  ProductPreviewController? controller;
  String? imageUrl;
  void Function()? onBackPressed;
  String? title;
  //int? length;
  //var catLength = 15; //controller.subCategoryList.length;
  var topTittle = 0.0;

  MySliverAppBar(
      {required this.expandedHeight,
        this.imageUrl,
        this.controller,
        //this.length,
        this.onBackPressed,
        this.title
      });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / maxExtent;
    return Stack(
      fit: StackFit.expand,
      children: [
        AnimatedOpacity(
          duration: const Duration(milliseconds: 250),
          opacity:  topTittle <= 120 ? 1.00 : 0.0,  // progress,
          child: ColoredBox(
            color: mainColor,
          ),
        ),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 150),
          opacity: 1 - progress,
          child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: imageUrl!,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress, color: mainColor)),
              errorWidget: (context, url, error) =>
                  Image.asset(ImageAsset.errorImage, fit: BoxFit.cover)),
        ),
      //  length! > 4 ?// catLength >12 ?
        AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeIn,
            padding: EdgeInsets.lerp(
              EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              EdgeInsets.only(bottom: 3.w),
              progress,
            ),
            alignment: Alignment.lerp(
              Alignment.bottomLeft,
              Alignment.bottomCenter,
              progress,
            ),
            child: Text(title!,
                style: TextStore.textTheme.headline3!.copyWith(
                    color: ThemesApp.light.scaffoldBackgroundColor,
                    fontWeight: FontWeight.bold))

        ),
        /*:
        Container( height: 0),*/
        AppBar(
          //leadingWidth: 18.w,
          backgroundColor: Colors.transparent,
          leading: AuthBackButton(
            press: (){
              onBackPressed!();
            },
          ),
          actions: [
            GestureDetector(
              onTap: () {
               /* setState(() {
                  if (SharedPrefs.instance
                      .getString('token') !=
                      null) {
                    if (productPreviewController
                        .isFavourite ==
                        true) {
                      productPreviewController
                          .favouriteValues =
                      'favouriteScreen';
                      productPreviewController
                          .isFavourite = false;
                      productPreviewController
                          .favouriteAdded(
                          productCode:
                          productPreviewController
                              .productID!,
                          status: '0');
                    } else if (productPreviewController
                        .isFavourite ==
                        false) {
                      productPreviewController
                          .favouriteValues =
                      'favouriteScreen';
                      productPreviewController
                          .isFavourite = true;
                      productPreviewController
                          .favouriteAdded(
                          productCode:
                          productPreviewController
                              .productID!,
                          status: '1');
                    }
                  } else {
                    showFavLoginAlertDialog(context);
                  }
                });*/
              },
              child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(2.w)),
                  child: controller
                      ?.isFavourite ==
                      true
                      ? SizedBox(
                      height: 5.5.h,
                      width: 12.w,
                      child: const Icon(
                          Icons.favorite,
                          color: Colors.red))
                      : SizedBox(
                      height: 5.5.h,
                      width: 12.w,
                      child: const Icon(
                          Icons
                              .favorite_outline_outlined,
                          color: Colors.grey))),
            ),
          ],
          /*leading: Padding(
            padding: EdgeInsets.only(left: 2.w,top: 1.h),
            child: AuthBackButton(
              press: (){
                  onBackPressed!();
                },
              ),
          ),*/
          elevation: 0,
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

