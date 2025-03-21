import 'package:dipmenu_ios/extra/common_widgets/text_scalar_factor.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_textstyle.dart';
import '../../../../core/config/theme.dart';
import '../../../../core/static/stactic_values.dart';
// import '../../../../extra/common_widgets/discount_operations.dart';
import '../../../logic/controller/product_preview_controller.dart';

// ignore: must_be_immutable
class DropdownMethod extends StatefulWidget {
  DropdownMethod({Key? key, this.controller, required this.onViewbuttonpressed})
      : super(key: key);

  ProductPreviewController? controller;
  void Function(dynamic) onViewbuttonpressed;

  @override
  State<DropdownMethod> createState() => _DropdownMethodState();
}

class _DropdownMethodState extends State<DropdownMethod> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextScaleFactorClamper(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint: Row(
              children: [
                Expanded(
                  child: Text(NameValues.selectSize,
                      style: TextStore.textTheme.titleLarge
                          ?.copyWith(color: titleColor)),
                ),
              ],
            ),
            items: widget.controller?.itemSize
                .map((item) => DropdownMenuItem<String>(
                      value: item.code,
                      // onTap: () {
                      //   widget.controller?.productSize = item.id!;
                      //   widget.controller?.defaultPrice = double.parse(
                      //       itemPriceId(
                      //           item.id!, widget.controller?.priceRange));
                      //
                      //   widget.controller?.slashedPrice = productSlashValues(
                      //       double.parse(itemPriceId(
                      //           item.id!, widget.controller?.priceRange)));
                      //   widget.controller?.totalPrice = productDiscountPrize(
                      //       widget.controller?.slashedPrice);
                      //   if(widget.controller?.isWeightCheck !='1'){
                      //    widget.controller?.itemSizeValues();
                      //   }
                      //   if(widget.controller?.isWeightCheck =='1' && widget.controller?.categoryIdValues ==4){
                      //     // widget.controller!. weightFeatureBasedClearValues();
                      //     widget.controller!.weightFeature();
                      //   }
                      //   if ( widget.controller?.subCategoryIdValues == 189) {
                      //     // widget.controller!. weightFeatureBasedClearValues();
                      //     widget.controller?.itemSizeValues();
                      //   }
                      //   widget.controller!. weightFeatureBasedClearValues();
                      //   widget.controller!.update();
                      // },
                      child: TextScaleFactorClamper(
                        child: Text(item.description!.trim(),
                            style: TextStore.textTheme.titleLarge
                                ?.copyWith(color: titleColor)),
                      ),
                    ))
                .toList(),
            value: widget.controller?.selectedValue,
            onChanged: (value) {
              setState(() {
                widget.onViewbuttonpressed(value);
              });
            },

            //after flutter upgrade for dropdown

            buttonStyleData: ButtonStyleData(
              height: 5.h,
              width: 40.w,
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black26),
                color: Colors.white,
              ),
              elevation: 2,
            ),
            /// New way to set dropdown styles
            dropdownStyleData: DropdownStyleData(
              maxHeight: widget.controller?.itemSize.length.isLowerThan(5) == true ? 20.h : 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              elevation: 8,
              offset: const Offset(0, 0),
            ),
            /// Updated way to set icons
            iconStyleData: IconStyleData(
              icon: const Icon(Icons.expand_more),
              iconSize: 15.sp,
              iconEnabledColor: titleColor,
              iconDisabledColor: Colors.grey,
            ),
            /// New menu item style
            menuItemStyleData: MenuItemStyleData(
              height: 4.h,
            ),

            // icon: const Icon(Icons.expand_more),
            // iconSize: 15.sp,
            // iconEnabledColor: titleColor,
            // iconDisabledColor: Colors.grey,
            // buttonHeight: 5.h,
            // //50,
            // buttonWidth: 40.w,
            // //160,
            // buttonPadding: EdgeInsets.only(left: 2.w, right: 2.w),
            // //(left: 14, right: 14),
            // buttonDecoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(10),
            //   border: Border.all(
            //     color: Colors.black26,
            //   ),
            //   color: Colors.white,
            // ),
            // buttonElevation: 2,
            // itemHeight: 4.h,
            // //40,
            // // itemPadding: const EdgeInsets.only(left: 14, right: 14),
            // dropdownMaxHeight:widget.controller?.itemSize.length.isLowerThan(5) ==true? 20.h:40.h,
            // dropdownWidth: 40.w,
            // //150,
            // dropdownPadding: null,
            // dropdownDecoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(10),
            //   color: Colors.white,
            // ),
            // dropdownElevation: 8,
            // scrollbarRadius: const Radius.circular(10),
            // scrollbarThickness: 6,
            // scrollbarAlwaysShow: true,
            // offset: const Offset(0, 0),
          ),
        ),
      ),
    );
  }
}
