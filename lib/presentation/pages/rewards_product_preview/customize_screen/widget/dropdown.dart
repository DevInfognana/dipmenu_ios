import 'package:dipmenu_ios/core/config/app_textstyle.dart';
import 'package:dipmenu_ios/core/config/theme.dart';
import 'package:dipmenu_ios/core/static/stactic_values.dart';
import 'package:dipmenu_ios/extra/common_widgets/text_scalar_factor.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../logic/controller/rewards_customize_edit_controller.dart';

// ignore: must_be_immutable
class RewardDropdown extends StatefulWidget {
  RewardDropdown({Key? key,this.controller,required this.onViewbuttonpressed}) : super(key: key);


  RewardsCustomizeEditController? controller;
  void Function(dynamic) onViewbuttonpressed;

  @override
  State<RewardDropdown> createState() => _RewardDropdownState();
}

class _RewardDropdownState extends State<RewardDropdown> {
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
                    style: TextStore.textTheme.headlineSmall
                        ?.copyWith(color: titleColor)),
              ),
            ],
          ),
          items: widget.controller?.itemSize
              .map((item) => DropdownMenuItem<String>(
            value: item.code,
            // onTap: (){
                    //   widget.controller?.productSize=item.id!;
                    //   widget.controller?.defaultPrice=double.parse(
                    //       itemPointsId(item.id!, widget.controller?.priceRange));
                    //   widget.controller?.totalPrice=double.parse(
                    //       itemPointsId(item.id!, widget.controller?.priceRange));
                    //   widget.controller!.update();
                    // },
                    child: TextScaleFactorClamper(
              child: Text( item.description!,
                  style: TextStore.textTheme.headlineSmall
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

          iconStyleData: IconStyleData(
            icon: const Icon(Icons.expand_more),
            iconSize: 15.sp,
            iconEnabledColor: titleColor,
            iconDisabledColor: Colors.grey,
          ),

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

          menuItemStyleData: MenuItemStyleData(
            height: 4.h,
          ),

          // icon: const Icon(
          //   Icons.expand_more,
          // ),
          // iconSize: 15.sp,  //30,
          // iconEnabledColor: titleColor,
          // iconDisabledColor: Colors.grey,
          // buttonHeight: 5.h,
          // buttonWidth: 40.w,    //160
          // buttonPadding: EdgeInsets.only(left: 2.w, right: 2.w),
          // buttonDecoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(10),
          //   border: Border.all(
          //     color: Colors.black26,
          //   ),
          //   color: Colors.white,
          // ),
          // buttonElevation: 2,
          // itemHeight: 4.h,  //40,
          // // itemPadding: const EdgeInsets.only(left: 14, right: 14),
          // dropdownMaxHeight:widget.controller?.itemSize.length.isLowerThan(5) ==true? 20.h:40.h,
          // dropdownWidth: 40.w,    //150,
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
    );
  }
}