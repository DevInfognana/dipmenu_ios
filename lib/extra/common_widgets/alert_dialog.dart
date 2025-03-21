import 'package:dip_menu/core/config/theme.dart';
import 'package:dip_menu/extra/common_widgets/text_scalar_factor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'dart:io' show Platform;

import '../../core/config/app_textstyle.dart';

class ShowDialogBox {
  static showAlertDialog(
      {BuildContext? context,
      String? content,
      String? title,
      void Function()? onButtonTapped,
      String? textBackButton,
      String? textOkButton}) {
    if(Platform.isAndroid){
      return showDialog(
          context: context!,
          // barrierColor: const Color(0xDD282424),
          builder: (BuildContext context) {
            return TextScaleFactorClamper(
              child: AlertDialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.w)),
                title: Text(title!,
                    style: TextStore.textTheme.headline4!
                        .copyWith(color: borderColor,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                content: Text(content!,
                    style: TextStore.textTheme.headline5!
                        .copyWith(color: borderColor),
                    textAlign: TextAlign.center),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                              side: BorderSide.none,
                              fixedSize: Size(
                                  28.w, getDeviceType == "phone" ? 8.h : 6.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.w)),
                              backgroundColor: Colors.grey),
                          child: Text(textBackButton!,style: TextStore.textTheme.headline5!
                              .copyWith(color: Colors.white))),
                      SizedBox(width: 2.w),
                      ElevatedButton(
                          onPressed: () {
                            onButtonTapped!();
                          },
                          style: ElevatedButton.styleFrom(
                              side: BorderSide.none,
                              fixedSize: Size(
                                  28.w, getDeviceType == "phone" ? 8.h : 6.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.w)),
                              backgroundColor: mainColor),
                          child: Text(textOkButton!,style: TextStore.textTheme.headline5!
                              .copyWith(color: Colors.white)))
                    ],
                  ),
                ],
              ),
            );
          });
    }else{
      return   showDialog(
          context: context!,
          builder: (context) {
                  return CupertinoAlertDialog(
                    title: Text(
                        title!,style: TextStore.textTheme.headline3!.copyWith(fontWeight: FontWeight.bold)),
                    content: Text(
                        content!,style: TextStore.textTheme.headline5!),
                    actions: <Widget>[
                      CupertinoDialogAction(
                        child: Text(textBackButton!,style: TextStore.textTheme.headline5!),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      CupertinoDialogAction(
                        child: Text(textOkButton!,style: TextStore.textTheme.headline5!),
                        onPressed: () {
                          onButtonTapped!();
                        },
                      ),
                    ],
                  );
            // return CupertinoAlertDialog(
            //   title: Text(title!,
            //       style: TextStore.textTheme.headline3!
            //           .copyWith(color: borderColor,fontWeight: FontWeight.bold),
            //       textAlign: TextAlign.center),
            //   content: Text(content!,
            //       style: TextStore.textTheme.headline5!
            //           .copyWith(color: borderColor),
            //       textAlign: TextAlign.center),
            //   actions: <Widget>[
            //     TextButton(
            //         onPressed: () {
            //           Get.back();
            //         },
            //         child: Text(textBackButton!,style: TextStore.textTheme.headline5!
            //             .copyWith(color: Colors.black))),
            //     TextButton(
            //         onPressed: () {
            //           onButtonTapped!();
            //         },
            //         child: Text(textOkButton!,style: TextStore.textTheme.headline5!
            //             .copyWith(color: mainColor)))
            //   ],
            // );
          });
    }


  }

  static String getDeviceType() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600 ? 'phone' : 'tablet';
  }

  static alertDialogBox(
      {BuildContext? context,
      String? content,
        String? title,
      void Function()? onButtonTapped,
        int?  cartScreen,
        int?  categoryId,
      String? textOkButton}) {
    if(Platform.isAndroid){
      return showDialog(
          context: context!,
          // barrierColor: const Color(0xDD282424),
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.w)),
              title: Text(title!,
                  style: TextStore.textTheme.headline3!
                      .copyWith(color: borderColor,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              content: cartScreen==0?
              Text(
                  content!,
                  style: TextStore.textTheme.headline5!
                      .copyWith(color: borderColor),
                  textAlign: TextAlign.center
              ):Text.rich(
                  textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(text: categoryId==4?'Please select custom menu items based on size limit for ':'Please Select  Items from ', style: TextStore.textTheme.headline5!
                        .copyWith(color: borderColor)),
                    TextSpan(
                      text: content,
                        style: TextStore.textTheme.headline5!
                            .copyWith(color: borderColor,fontWeight: FontWeight.bold)
                    ),
                    TextSpan(text:categoryId!=4? 'Before adding item to cart':'', style: TextStore.textTheme.headline5!
                        .copyWith(color: borderColor)),
                  ],
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        style:
                        ElevatedButton.styleFrom(backgroundColor: mainColor,     side: BorderSide.none,
                          fixedSize: Size(
                              28.w, getDeviceType == "phone" ? 8.h : 6.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.w)),),
                        child: Text(textOkButton!)),
                  ],
                ),
              ],
            );
          });
    }
    return showDialog(
        context: context!,
        // barrierColor: const Color(0xDD282424),
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(
                title!,style: TextStore.textTheme.headline3!.copyWith(fontWeight: FontWeight.bold)),
            content: cartScreen==0?
            Text(
                content!,
                style: TextStore.textTheme.headline5!,
                textAlign: TextAlign.center
            ):Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(text: categoryId==4?'Please select custom menu items based on size limit for ':'Please Select  Items from ', style: TextStore.textTheme.headline5!
                      ),
                  TextSpan(
                      text: content,
                      style: TextStore.textTheme.headline5!
                          .copyWith(fontWeight: FontWeight.bold)
                  ),
                  TextSpan(text:categoryId!=4? 'Before adding item to cart':'', style: TextStore.textTheme.headline5!),
                ],
              ),
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text(textOkButton!,style: TextStore.textTheme.headline5!),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          );
        });
  }

  static commonAlertDialogBox(
      {BuildContext? context,
      String? content,
      String? title,
      void Function()? onButtonTapped,
      String? textOkButton,
      String? textNOButton}) {
    if (Platform.isAndroid) {
      return showDialog(
          context: context!,
          // barrierColor: const Color(0xDD282424),
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text(title!,
                  style: TextStore.textTheme.headline4!
                      .copyWith(color: borderColor),
                  textAlign: TextAlign.center),
              content: Text(content!,
                  style: TextStore.textTheme.headline5!
                      .copyWith(color: descriptionColor),
                  textAlign: TextAlign.center),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      //action code for "Yes" button
                    },
                    child: const Text('Yes')),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); //close Dialog
                  },
                  child: const Text('Close'),
                )
              ],
            );
          });
    } else {
      showDialog(
          context: context!,
          builder: (context) {
            return CupertinoAlertDialog(
              title: const Text('Cupertino Alert Dialog'),
              content: const Text('Do you really want to delete?'),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      //action code for "Yes" button
                    },
                    child: const Text('Yes')),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); //close Dialog
                  },
                  child: const Text('Close'),
                )
              ],
            );
          });
    }
  }


  static alertDialogBoxValues(
      {BuildContext? context,
        String? content,
        String? content1,
        String? content2,
        String? title,
        int? values,
        void Function()? onButtonTapped,
        String? textOkButton}) {
    if (Platform.isAndroid) {
      return showDialog(
          context: context!,
          builder: (BuildContext context) {
            return AlertDialog(
              iconPadding: EdgeInsets.zero,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.w)),
              title: Text(title!,
                  style: TextStore.textTheme.headline3!
                      .copyWith(color: borderColor, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              content:
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(
                        text: values==0?'Maximum Selection Limit Reached for ':'Maximum Weight Limit Reached for product ',
                        style: TextStore.textTheme.headline5!
                            .copyWith(color: borderColor)),
                    TextSpan(
                        text:values==0? content :" ",
                        style: TextStore.textTheme.headline5!.copyWith(
                            color: borderColor, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                            side: BorderSide.none,
                            fixedSize:
                            Size(28.w, getDeviceType == "phone" ? 8.h : 6.h),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.w))),
                        child: Text(textOkButton!,
                            style: TextStore.textTheme.headline5!
                                .copyWith(color: Colors.white))),
                  ],
                ),
              ],
            );
          });
    }else{
      showDialog(
          context: context!,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text(
                  title!,style: TextStore.textTheme.headline3!.copyWith(fontWeight: FontWeight.bold)),
              content:    Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                          text: values==0?'Maximum Selection Limit Reached for ':'Maximum Weight Limit Reached for product ',
                          style: TextStore.textTheme.headline5!
                              ),
                      TextSpan(
                          text:values==0? content :" ",
                          style: TextStore.textTheme.headline5!.copyWith(
                               fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text(textOkButton!,style: TextStore.textTheme.headline5!),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            );
            // return CupertinoAlertDialog(
            //
            //   title: Text(title!,
            //       style: TextStore.textTheme.headline3!
            //           .copyWith(color: borderColor, fontWeight: FontWeight.bold),
            //       textAlign: TextAlign.center),
            //   content:
            //   Text.rich(
            //     textAlign: TextAlign.center,
            //     TextSpan(
            //       children: [
            //         TextSpan(
            //             text: values==0?'Maximum Selection Limit Reached for ':'Maximum Weight Limit Reached for product ',
            //             style: TextStore.textTheme.headline5!
            //                 .copyWith(color: borderColor)),
            //         TextSpan(
            //             text:values==0? content :" ",
            //             style: TextStore.textTheme.headline5!.copyWith(
            //                 color: borderColor, fontWeight: FontWeight.bold)),
            //       ],
            //     ),
            //   ),
            //   actions: <Widget>[
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         ElevatedButton(
            //             onPressed: () {
            //               Get.back();
            //             },
            //             style: ElevatedButton.styleFrom(
            //                 backgroundColor: mainColor,
            //                 side: BorderSide.none,
            //                 fixedSize:
            //                 Size(28.w, getDeviceType == "phone" ? 8.h : 6.h),
            //                 shape: RoundedRectangleBorder(
            //                     borderRadius: BorderRadius.circular(3.w))),
            //             child: Text(textOkButton!,
            //                 style: TextStore.textTheme.headline5!
            //                     .copyWith(color: Colors.white))),
            //       ],
            //     ),
            //   ],
            // );
          });
    }

  }




  static alertDialogBoxValues1(
      {BuildContext? context,
        String? content,
        String? content1,
        String? title,
        void Function()? onButtonTapped,
        String? textOkButton}) {
    if(Platform.isAndroid){
      return showDialog(
          context: context!,
          builder: (BuildContext context) {
            return AlertDialog(
              iconPadding: EdgeInsets.zero,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.w)),
              title: Text(title!,
                  style: TextStore.textTheme.headline3!
                      .copyWith(color: borderColor, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              content:
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Maximum item limit in Toppings for ',
                        style: TextStore.textTheme.headline5!
                            .copyWith(color: borderColor)),
                    TextSpan(
                        text: content,
                        style: TextStore.textTheme.headline5!.copyWith(
                            color: borderColor, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                        ' size has been exceeded. Please Deselect Items! ',
                        style: TextStore.textTheme.headline5!
                            .copyWith(color: borderColor)),
                    TextSpan(
                        text: ' ${content1?.replaceAll('}', '')}',
                        style: TextStore.textTheme.headline5!.copyWith(
                            color: borderColor, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                            side: BorderSide.none,
                            fixedSize:
                            Size(28.w, getDeviceType == "phone" ? 8.h : 6.h),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.w))),
                        child: Text(textOkButton!,
                            style: TextStore.textTheme.headline5!
                                .copyWith(color: Colors.white))),
                  ],
                ),
              ],
            );
          });
    }else{
      showDialog(
          context: context!,
          builder: (context) {

            return CupertinoAlertDialog(
              title: Text(
                  title!,style: TextStore.textTheme.headline3!.copyWith(fontWeight: FontWeight.bold)),
                content:Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                          text: 'Maximum Selection Limit Reached for ',
                          style: TextStore.textTheme.headline5!),
                      TextSpan(
                          text: content,
                          style: TextStore.textTheme.headline5!.copyWith(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                          ' size has been exceeded. Please Deselect Items! ',
                          style: TextStore.textTheme.headline5!
                              ),
                      TextSpan(
                          text: ' ${content1?.replaceAll('}', '')}',
                          style: TextStore.textTheme.headline5!.copyWith(
                               fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text(textOkButton!,style: TextStore.textTheme.headline5!),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            );
            // return CupertinoAlertDialog(
            //   title: Text(title!,
            //       style: TextStore.textTheme.headline3!
            //           .copyWith(color: borderColor, fontWeight: FontWeight.bold),
            //       textAlign: TextAlign.center),
            //   content:Text.rich(
            //     textAlign: TextAlign.center,
            //     TextSpan(
            //       children: [
            //         TextSpan(
            //             text: 'Maximum Selection Limit Reached for ',
            //             style: TextStore.textTheme.headline5!
            //                 .copyWith(color: borderColor)),
            //         TextSpan(
            //             text: content,
            //             style: TextStore.textTheme.headline5!.copyWith(
            //                 color: borderColor, fontWeight: FontWeight.bold)),
            //         TextSpan(
            //             text:
            //             ' size has been exceeded. Please Deselect Items! ',
            //             style: TextStore.textTheme.headline5!
            //                 .copyWith(color: borderColor)),
            //         TextSpan(
            //             text: ' ${content1?.replaceAll('}', '')}',
            //             style: TextStore.textTheme.headline5!.copyWith(
            //                 color: borderColor, fontWeight: FontWeight.bold)),
            //       ],
            //     ),
            //   ),
            //   actions: <Widget>[
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         ElevatedButton(
            //             onPressed: () {
            //               Get.back();
            //             },
            //             style: ElevatedButton.styleFrom(
            //                 backgroundColor: mainColor,
            //                 side: BorderSide.none,
            //                 fixedSize:
            //                 Size(28.w, getDeviceType == "phone" ? 8.h : 6.h),
            //                 shape: RoundedRectangleBorder(
            //                     borderRadius: BorderRadius.circular(3.w))),
            //             child: Text(textOkButton!,
            //                 style: TextStore.textTheme.headline5!
            //                     .copyWith(color: Colors.white))),
            //       ],
            //     ),
            //   ],
            // );
          });
    }

  }
}
