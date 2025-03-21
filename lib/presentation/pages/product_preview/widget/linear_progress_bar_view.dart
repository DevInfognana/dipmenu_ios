import 'package:dip_menu/core/config/app_textstyle.dart';
import 'package:dip_menu/data/model/product_preview/custom_menu_data.dart';
import 'package:dip_menu/extra/packages/linear_progress_bar.dart';
import 'package:dip_menu/presentation/logic/controller/product_preview_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class LinearProgressBarValues extends StatelessWidget {
  LinearProgressBarValues(
      {Key? key,
        this.percent,
        required this.customMenu,
        required this.controller})
      : super(key: key);

  double? percent = 0.0;
  List<CustomMenuData> customMenu = [];
  ProductPreviewController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 0.4.h,left: 2.w),
        child: SizedBox(
            height: 8.h,
            width: double.infinity,
            child: controller.isWeightCheck != '1'
                ?
            ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: customMenu.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final percentValues = double.parse(controller
                      .weightOthersBasedLineGraphValues(
                      selectedItemsValues:
                      customMenu[index].selectedItems,
                      customMenuId: customMenu[index].id!)
                      .toString());
                  final headersValues =
                      double.parse(percentValues.toString()) * 100;
                  return GetBuilder<ProductPreviewController>(builder: (_) {
                    return VerticalBarIndicator(
                        percent: percentValues,
                        // height: 10.h,
                        height: 1.h,
                        animationDuration: const Duration(seconds: 3),
                        color: const [Colors.limeAccent, Colors.green],
                        header: '${headersValues.toStringAsFixed(2)} %',
                        footer: customMenu[index].name!,
                        footerStyle: TextStore.textTheme.headline6
                            ?.copyWith(fontSize: 9.sp, color: Colors.white),
                        headerStyle: TextStore.textTheme.headline6
                            ?.copyWith(fontSize: 9.sp, color: Colors.white),
                        width: 53.w);
                  });
                },
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 1.h))
                :
            GetBuilder<ProductPreviewController>(builder: (_) {
              return VerticalBarIndicator(
                  percent: controller.lineGraphValues,
                  height: 1.h,
                  animationDuration: const Duration(seconds: 3),
                  color: const [Colors.limeAccent, Colors.green],
                  header:
                  '${(controller.lineGraphValues * 100).toStringAsFixed(2)} %',
                  footer: "Total",
                  footerStyle: TextStore.textTheme.headline6
                      ?.copyWith(fontSize: 9.sp, color: Colors.white),
                  headerStyle: TextStore.textTheme.headline6
                      ?.copyWith(fontSize: 9.sp, color: Colors.white),
                  width: 53.w);
            })
        ));
  }
}