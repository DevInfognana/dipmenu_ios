import 'package:dip_menu/core/config/app_textstyle.dart';
import 'package:dip_menu/core/config/theme.dart';
import 'package:dip_menu/extra/common_widgets/text_scalar_factor.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/static/stactic_values.dart';

// import '../../../../../extra/common_widgets/discount_operations.dart';
import '../../../../logic/controller/customize_edit_controller.dart';

// ignore: must_be_immutable
class CustomizeDropdown extends StatefulWidget {
  CustomizeDropdown(
      {Key? key, this.controller, required this.onViewbuttonpressed})
      : super(key: key);

  CustomizeEditController? controller;
  void Function(dynamic) onViewbuttonpressed;

  @override
  State<CustomizeDropdown> createState() => _customizeDropdownState();
}

class _customizeDropdownState extends State<CustomizeDropdown> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: Row(
            children: [
              Expanded(
                child: Text(NameValues.selectSize,
                    style: TextStore.textTheme.headline6
                        ?.copyWith(color: titleColor)),
              ),
            ],
          ),
          items: widget.controller?.itemSize
              .map((item) => DropdownMenuItem<String>(
                    value: item.code,
                    // onTap: (){
                    //   widget.controller?.productSize=item.id!;
                    //   // widget.controller?.defaultPrice=double.parse(
                    //   //     itemPriceId(item.id!, widget.controller?.priceRange));
                    //   // widget.controller?.totalPrice=double.parse(
                    //   //     itemPriceId(item.id!, widget.controller?.priceRange));
                    //
                    //   widget.controller?.slashedPrice=productSlashValues(double.parse(
                    //       itemPriceId(item.id!, widget.controller?.priceRange)
                    //   ));
                    //   widget.controller?.defaultPrice=productDiscountPrize( widget.controller?.slashedPrice);
                    //   if(widget.controller?.isWeightCheck !='1'){
                    //     widget.controller?.itemSizeValues();
                    //   }
                    //   if(widget.controller?.isWeightCheck =='1' && widget.controller?.categoryIdValues ==4){
                    //
                    //     widget.controller!.weightFeature();
                    //   }
                    //   if (
                    //   /*selectItemsDifferentForms(widget.controller?.productID.toString()) == true &&*/ widget.controller?.subCategoryIdValues == 189) {
                    //
                    //     widget.controller?.itemSizeValues();
                    //   }
                    //   widget.controller!. weightFeatureBasedClearValues();
                    //   widget.controller!.update();
                    // },
                    child: TextScaleFactorClamper(
                      child: Text(item.description!.trim(),
                          style: TextStore.textTheme.headline6
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
          icon: const Icon(
            Icons.expand_more,
          ),
          iconSize: 15.sp,
          //30,
          iconEnabledColor: titleColor,
          iconDisabledColor: Colors.grey,
          buttonHeight: 5.h,
          //50,
          buttonWidth: 40.w,
          //160,
          buttonPadding: EdgeInsets.only(left: 2.w, right: 2.w),
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black26),
            color: Colors.white,
          ),
          buttonElevation: 2,
          itemHeight: 4.h,
          //40,
          // itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight:
              widget.controller?.itemSize.length.isLowerThan(5) == true
                  ? 20.h
                  : 40.h,
          dropdownWidth: 40.w,
          //150,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          dropdownElevation: 8,
          scrollbarRadius: const Radius.circular(10),
          scrollbarThickness: 6,
          scrollbarAlwaysShow: true,
          offset: const Offset(0, 0),
        ),
      ),
    );
  }
}
