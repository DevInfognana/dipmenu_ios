import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_textstyle.dart';
import '../../../../core/config/icon_config.dart';
import '../../../../core/config/theme.dart';
import '../../../../extra/common_widgets/back_button.dart';

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  String? imageUrl;
  void Function()? onBackPressed;
  String? title;
  int? length;

  //var catLength = 15; //controller.subCategoryList.length;
  var topTittle = 0.0;

  MySliverAppBar(
      {required this.expandedHeight,
      this.imageUrl,
      this.length,
      this.onBackPressed,
      this.title});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / maxExtent;
    return Stack(
      fit: StackFit.expand,
      children: [
        AnimatedOpacity(
          duration: const Duration(milliseconds: 250),
          opacity: topTittle <= 120 ? 1.00 : 0.0, // progress,
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
        length! > 4
            ? // catLength >12 ?
            AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeIn,
                padding: EdgeInsets.lerp(
                  EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  EdgeInsets.only(bottom: 3.w),
                  progress,
                ),
                alignment: Alignment.lerp(
                    Alignment.bottomLeft, Alignment.bottomCenter, progress),
                child: Text(title!,
                    style: TextStore.textTheme.displaySmall!.copyWith(
                        color: ThemesApp.light.scaffoldBackgroundColor,
                        fontWeight: FontWeight.bold)))
            : const SizedBox(height: 0),
        AppBar(
          //leadingWidth: 18.w,
          backgroundColor: Colors.transparent,
          leading: AuthBackButton(
            press: () {
              onBackPressed!();
            },
          ),
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
