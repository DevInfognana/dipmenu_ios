// import 'package:dipmenu_ios/core/config/icon_config.dart';
import 'package:dipmenu_ios/domain/entities/handling_data_view.dart';
import 'package:dipmenu_ios/domain/local_handler/Local_handler.dart';

// import 'package:dipmenu_ios/extra/common_widgets/back_button.dart';
import 'package:dipmenu_ios/extra/common_widgets/bottom_navigation.dart';
import 'package:dipmenu_ios/extra/common_widgets/text_form_field_2.dart';
import 'package:dipmenu_ios/extra/common_widgets/text_scalar_factor.dart';
import 'package:dipmenu_ios/extra/packages/linear_progress_bar.dart';
import 'package:dipmenu_ios/extra/packages/scrollable_list_tab_scroller.dart';
import 'package:dipmenu_ios/presentation/logic/controller/authentication_controller.dart';
import 'package:dipmenu_ios/presentation/pages/product_preview/widget/custom_menu.dart';
import 'package:dipmenu_ios/presentation/pages/product_preview/widget/dropdown_button.dart';
import 'package:dipmenu_ios/presentation/pages/product_preview/widget/merch_category.dart';
import 'package:dipmenu_ios/presentation/pages/product_preview/widget/top_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../../../core/config/app_textstyle.dart';
import '../../../core/config/theme.dart';
import '../../../core/static/stactic_values.dart';
import '../../../extra/common_widgets/alert_dialog.dart';
import '../../../extra/common_widgets/common_product_page_widgets.dart';
import '../../../extra/common_widgets/counter_increment.dart';
import '../../../extra/common_widgets/description_text.dart';
import '../../../extra/common_widgets/fav_login_alert_dialog.dart';
import '../../../extra/common_widgets/image_view.dart';
import '../../logic/controller/product_preview_controller.dart';
import '../../routes/routes.dart';

class ProductPreviewScreen extends StatefulWidget {
  const ProductPreviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductPreviewScreen> createState() => _ProductPreviewScreenState();
}

class _ProductPreviewScreenState extends State<ProductPreviewScreen>
    with SingleTickerProviderStateMixin {
  final productPreviewController = Get.find<ProductPreviewController>();

  final controller = Get.put(AuthController());

  final numberFormat = NumberFormat("#,##0.00##", "en_US");

  double scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (productPreviewController.favouriteValuesChecking ==
            'favouriteScreen') {
          Get.offAllNamed(Routes.mainScreen, arguments: 2);
        } else if (productPreviewController
            .favouriteValuesChecking !=
            'others') {
          Get.offAllNamed(Routes.mainScreen, arguments: 1);
        } else {
          Get.back();
        }
        return true;
      },
      child: SafeArea(child: GetBuilder<ProductPreviewController>(
        builder: (_) {
          return HandlingDataView(
              statusRequest: productPreviewController.statusRequestCustomMenu!,
              widget: TextScaleFactorClamper(
                  child: Scaffold(
                appBar: PreferredSize(
                    preferredSize: Size.fromHeight(7.5.h),
                    child: ProductAppBar(
                      press: () {
                        if (productPreviewController.favouriteValuesChecking ==
                            'favouriteScreen') {
                          Get.offAllNamed(Routes.mainScreen, arguments: 2);
                        } else if (productPreviewController
                                .favouriteValuesChecking !=
                            'others') {
                          Get.offAllNamed(Routes.mainScreen, arguments: 1);
                        } else {
                          Get.back();
                        }
                      },
                    )),
                backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
                body: NotificationListener(
                    child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (productPreviewController.customMenu.isNotEmpty) {
                      if (scrollInfo is UserScrollNotification) {
                        if (scrollInfo.direction == ScrollDirection.reverse) {
                          productPreviewController.scrollingValues();
                          // onEndScroll(scrollInfo.metrics);
                        }
                      }
                    } else {
                      productPreviewController.scrollingValues();
                    }
                    return true;
                  },
                  child: productPreviewController.categoryIdValues != 5
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                              SizedBox(
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 1.w, right: 1.w),
                                  child: Card(
                                    elevation: 0,
                                    color: Theme.of(Get.context!)
                                        .scaffoldBackgroundColor,
                                    child: Column(children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 15.h,
                                            width: getDeviceType() == 'phone'
                                                ? 27.w
                                                : 23.w,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(4.w),
                                              child: ImageView(
                                                imageUrl: imageview(
                                                    productPreviewController
                                                            .argumentData[
                                                        'image']!),
                                                showValues: false,
                                                mainImageViewWidth: 34.w,
                                                bottomImageViewHeight: 5.h,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Container(
                                              padding: EdgeInsets.all(0.1.h),
                                              child: Column(
                                                children: [
                                                  Row(children: [
                                                    CommonWidget().productName(
                                                        context,
                                                        productPreviewController
                                                                .argumentData[
                                                            'name'])
                                                  ]),
                                                  Row(children: [
                                                    priceContent(),
                                                    const Spacer(),
                                                    totalPrizeValues(),
                                                    const Spacer(flex: 2),
                                                    favouriteContent(),
                                                  ]),
                                                  // Row(
                                                  //   mainAxisAlignment:
                                                  //       MainAxisAlignment
                                                  //           .spaceBetween,
                                                  //   children: [
                                                  //
                                                  //
                                                  //   ],
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            addButton(),
                                            productDescription()
                                            // productDescription(),
                                          ]),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 2.w),
                                          child: productDescription1()),
                                    ]),
                                  ),
                                ),
                              ),
                              productPreviewController
                                          .customMenuBoolValues.value ==
                                      false
                                  ? Expanded(
                                      child: Container(
                                          padding: EdgeInsets.only(
                                              left: 4.w,
                                              top: 2.h,
                                              right: 4.w,
                                              bottom: 2.h),
                                          child: ScrollableListTabScrollerView(
                                            tabBuilder: (BuildContext context,
                                                int index, bool active) {
                                              // int? previousIndex;
                                              // if(active ==true &&  previousIndex!=index) {
                                              //   print(index);
                                              //   previousIndex=index;
                                              // }
                                              return Container(
                                                color: Get.isDarkMode
                                                    ? (Colors.transparent)
                                                    : (productPreviewController
                                                                .customMenu
                                                                .length <=
                                                            1
                                                        ? Colors.transparent
                                                        : Colors.grey.shade100),
                                                height: 9.h,
                                                width: productPreviewController
                                                            .customMenu
                                                            .length <=
                                                        1
                                                    ? MediaQuery.of(context)
                                                        .size
                                                        .width
                                                    : null,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 6.w),
                                                child: Text(
                                                  productPreviewController
                                                      .customMenu[index].name!,
                                                  style: !active
                                                      ? TextStore
                                                          .textTheme.headlineLarge
                                                          ?.copyWith(
                                                              color:
                                                                  descriptionColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)
                                                      : TextStore
                                                          .textTheme.headlineLarge
                                                          ?.copyWith(
                                                              color: mainColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                ),
                                              );
                                            },

                                            addingWidget: verticalBar(),
                                            tabChanged: (int values) {
                                              productPreviewController
                                                  .valuesChanges(values, '');
                                            },
                                            itemCount: productPreviewController
                                                .customMenu.length,
                                            //data.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              final size =
                                                  productPreviewController
                                                      .minMaxShow(
                                                          productPreviewController
                                                              .customMenu[index]
                                                              .id);
                                              return Column(
                                                children: [
                                                  // SizedBox(height: 1.h),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 1.h),
                                                    child: MenuCategoryItem(
                                                      title:
                                                          productPreviewController
                                                              .customMenu[index]
                                                              .name!,
                                                      customMenuItemValues:
                                                          productPreviewController
                                                              .customMenu[index]
                                                              .customMenuItems!,
                                                      minMaxValues: size,
                                                      controller:
                                                          productPreviewController,
                                                      customProductsValues:
                                                          productPreviewController
                                                              .customMenu[index]
                                                              .customProducts!,
                                                      customizeMenuItems:
                                                          productPreviewController
                                                              .customMenu[index]
                                                              .customizeMenuItems,
                                                      selectedItems:
                                                          productPreviewController
                                                              .customMenu[index]
                                                              .selectedItems,
                                                      customMenuId:
                                                          productPreviewController
                                                              .customMenu[index]
                                                              .id,
                                                      isHybrid:
                                                          productPreviewController
                                                              .customMenu[index]
                                                              .isHybrid,
                                                    ),
                                                  ),
                                                  index ==
                                                          productPreviewController
                                                                  .customMenu
                                                                  .length -
                                                              1
                                                      ? SizedBox(
                                                          height:
                                                              getDeviceType() ==
                                                                      'phone'
                                                                  ? 24.h
                                                                  : 34.h)
                                                      : const SizedBox(),
                                                ],
                                              );
                                            },
                                          )))
                                  : const SizedBox(),
                            ])
                      : MerchCategory(
                          productPreviewController: productPreviewController),
                )),
                floatingActionButton: productPreviewController
                        .customMenu.isNotEmpty
                    ? floatingbtn(
                        endPointValues: productPreviewController.endPoint,
                    name: NameValues.add,
                        totalLength: productPreviewController.productTotal,
                        onViewbuttonpressed: () {
                          final bool values =
                              productPreviewController.minimumCheckValues();
                          if (values == false) {
                            ShowDialogBox.alertDialogBox(
                                context: context,
                                title: 'Alert',
                                content: productPreviewController
                                    .minCustMenuName
                                    .join(', '),
                                onButtonTapped: () {
                                  Get.back();
                                },
                                cartScreen: 1,
                                categoryId:
                                    productPreviewController.categoryIdValues,
                                textOkButton: 'OK');
                          } else {
                            // print('=======>just check on the product preview:');
                            productPreviewController.addToCartCalculations();
                          }
                        })
                    : FloatingActionButton.extended(
                        onPressed: () {
                          double subTotal = 0.0;
                          productPreviewController
                              .overAllPriceCalculation()
                              .forEach((element) {
                            subTotal += double.parse(element);
                          });

                          productPreviewController.addCart(
                              itemPrize: '',
                              itemID: '',
                              totalCost: productPreviewController
                                  .allProductTotalValues(subTotal),
                              defaultCustom: 1,
                              itemNames: '');
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.w)),
                        label: Text(NameValues.add,
                            style: TextStore.textTheme.headlineLarge!
                                .copyWith(color: Colors.white)),
                        backgroundColor: mainColor),
              )));
        },
      )),
    );
  }

  static String getDeviceType() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600 ? 'phone' : 'tablet';
  }

/*Widget productDetailsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 1.w, right: 1.w),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Flexible(
              child: Text(productPreviewController.argumentData['name'],
                  overflow: TextOverflow.clip,
                  style: TextStore.textTheme.headlineLarge!
                      .copyWith(fontWeight: FontWeight.bold,color: Colors.black)),
            ),
          ]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GetBuilder<ProductPreviewController>(builder: (_) {
              return Padding(
                padding: EdgeInsets.only(
                    left: 1.w,
                    right: 1.w,
                    bottom: productPreviewController.productDescription!.isEmpty
                        ? 0
                        : 0.h),
                child: Text(
                    '\$ ${numberFormat.format(productPreviewController.priceCalculation(productPreviewController.productQuality.toInt(), productPreviewController.totalPrice))}',
                    style: TextStore.textTheme.displaySmall
                        ?.copyWith(fontWeight: FontWeight.bold,color: mainColor)),
                    '\$ ${numberFormat.format(productPreviewController.priceCalculation1(productPreviewController.productQuality.toInt(), productPreviewController.totalPrice))}',
                    style: TextStore.boldTheme.displayMedium
                        ?.copyWith(color: mainColor)),
              );
            }),
          ],
        ),
        GetBuilder<ProductPreviewController>(builder: (_) {
          return productPreviewController.productDescription!.isEmpty
              ? Container()
              : Container(
                  padding: EdgeInsets.only(left: 1.w, right: 1.w),
                  // height: 12.h,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                              productPreviewController.productDescription ==
                                      null
                                  ? ''
                                  : productPreviewController
                                      .productDescription!,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStore.textTheme.titleLarge!.copyWith(
                                  color: borderColor, fontSize: 10.5.sp)),
                        ),
                      ]),
                );
        }),
      ],
    );
  }*/

  Widget priceContent() {
    return productPreviewController.slashedPrice == 0.0
        ? const SizedBox()
        : GetBuilder<ProductPreviewController>(builder: (_) {
            return Padding(
              padding: EdgeInsets.only(
                  left: 1.w,
                  right: 1.w,
                  bottom: productPreviewController.productDescription!.isEmpty
                      ? 0
                      : 0.h),
              child: Text(
                  '\$ ${numberFormat.format(productPreviewController.slashedPrice)}',
                  style: TextStore.textTheme.displaySmall?.copyWith(
                      decoration: TextDecoration.lineThrough,
                      fontWeight: FontWeight.w300,
                      color: mainColor)),
            );
          });
  }

  Widget onlinePrice() {
    return GetBuilder<ProductPreviewController>(builder: (_) {
      return Padding(
        padding: EdgeInsets.only(
            left: 5.w,
            right: 1.w,
            bottom:
                productPreviewController.productDescription!.isEmpty ? 0 : 0.h),
        child: productPreviewController.totalPrice == 0.0
            ? Text(
                '\$ ${numberFormat.format(productPreviewController.priceCalculation1(1, double.parse(productPreviewController.totalPrice.toStringAsFixed(2))))}',
                style: TextStore.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w900, color: Colors.green))
            : Text(
                '\$ ${numberFormat.format(double.parse(productPreviewController.totalPrice.toStringAsFixed(2)))}',
                style: TextStore.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w900, color: Colors.green)),
      );
    });
  }

  Widget addButton() {
    return GetBuilder<ProductPreviewController>(builder: (_) {
      Color? color = Get.isDarkMode ? Colors.white : borderColor;
      return HandlingDataView(
          statusRequest: productPreviewController.statusRequestProductPreview!,
          widget: CounterButton(
              onIncrementSelected: () {
                productPreviewController.increaseCount();
              },
              onDecrementSelected: () {
                productPreviewController.decreaseCount();
              },
              label:
              // Container(
              //     width: 8.w,
              //     // margin: EdgeInsets.symmetric(horizontal: 2.w),
              //     // padding: EdgeInsets.symmetric(horizontal: 1.2.w, vertical: 0.6.h),
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(3), color: Colors.transparent),
              //     child: Center(
              //       child: Text('145',
              //           style: TextStore.textTheme.displaySmall!.copyWith(
              //               color:  color, fontWeight: FontWeight.bold)),
              //     )),
              Text(
                productPreviewController.productQuality.toString(),
                style: TextStore.textTheme.displaySmall
                    ?.copyWith(color: color, fontWeight: FontWeight.bold),
              )

          ));
    });
  }

  Widget favouriteContent() {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (SharedPrefs.instance.getString('token') != null) {
            if (productPreviewController.isFavourite == true) {
              productPreviewController.favouriteValuesChecking =
                  'favouriteScreen';
              productPreviewController.isFavourite = false;
              productPreviewController.removeFavourite(
                  productCode: productPreviewController.productID!);
            } else if (productPreviewController.isFavourite == false) {
              productPreviewController.favouriteValuesChecking =
                  'favouriteScreen';
              productPreviewController.isFavourite = true;
              productPreviewController.someFavouriteValuesChecking();
            }
          } else {
            FavLoginPopUp().showFavLoginAlertDialog(context,
                userNameController: productPreviewController.emailController,
                passWordController: productPreviewController.passwordController,
                onButtonTapped: () {
              String email =
                  productPreviewController.emailController.text.trim();
              String password =
                  productPreviewController.passwordController.text.trim();
              productPreviewController.productPreviewFavLogin(
                  email: email,
                  password: password,
                  productCode: productPreviewController.productID!,
                  status: '0');
            });
            // showFavLoginAlertDialog(context);
          }
        });
      },
      child: productPreviewController.isFavourite == true
          ? SizedBox(
              height: 5.h,
              width: 12.w,
              child: Icon(Icons.favorite,
                  size: getDeviceType() == 'phone' ? 26.sp : 13.sp,
                  color: Colors.red))
          : SizedBox(
              height: 5.h,
              width: 12.w,
              child: Icon(Icons.favorite_outline_outlined,
                  size: getDeviceType() == 'phone' ? 26.sp : 13.sp,
                  color: Colors.grey)),
    );
  }

  Widget productDescription1() {
    return GetBuilder<ProductPreviewController>(builder: (_) {
      return productPreviewController.productDescription!.isEmpty
          ? const SizedBox()
          : ( Text(productPreviewController.productDescription!,
          style: TextStore.textTheme.headlineSmall!
              .copyWith(color: Get.isDarkMode ? Colors.white : borderColor))
          // productPreviewController.productDescription!.length < 64
          //     ?
          //     : ExpandableText(
          //         productPreviewController.productDescription == null
          //             ? ''
          //             : productPreviewController.productDescription!,
          //         trimLines: 1,
          //       )
      );
    });
  }

  Widget totalPrizeValues() {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        // Text('Total Price',
        //     style: TextStore.textTheme.headlineLarge
        //         ?.copyWith(color: borderColor, fontWeight: FontWeight.bold)),
        GetBuilder<ProductPreviewController>(builder: (_) {
          String values = productPreviewController
              .priceCalculation1(
                  productPreviewController.productQuality.toInt(),
                  productPreviewController.totalPrice)
              .toStringAsFixed(2);
          return Text('\$ ${numberFormat.format(double.parse(values))}',
              style: TextStore.textTheme.displaySmall
                  ?.copyWith(fontWeight: FontWeight.w900, color: Colors.green));
        })
      ],
    );
  }

  // Widget productDescription() {
  //   return GetBuilder<ProductPreviewController>(builder: (_) {
  //     return Container(
  //       padding: EdgeInsets.only(left: 1.w, right: 1.w),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           Wrap(
  //             direction: Axis.horizontal,
  //             crossAxisAlignment: WrapCrossAlignment.center,
  //             alignment: WrapAlignment.spaceEvenly,
  //             children: [
  //               Text(NameValues.chooseSize,
  //                   style: TextStore.textTheme.headlineLarge?.copyWith(
  //                       color: borderColor, fontWeight: FontWeight.bold)),
  //               SizedBox(width: 2.w),
  //               GetBuilder<ProductPreviewController>(builder: (_) {
  //                 //statusRequestProductPreview
  //                 return HandlingDataView(
  //                     statusRequest:
  //                         productPreviewController.statusRequestProductPreview!,
  //                     widget: DropdownMethod(
  //                         controller: productPreviewController,
  //                         onViewbuttonpressed: (dynamic) {
  //                           productPreviewController.selectedValue = dynamic;
  //                         }));
  //               })
  //             ],
  //           ),
  //         ],
  //       ),
  //     );
  //   });
  // }
  Widget productDescription() {
    return GetBuilder<ProductPreviewController>(builder: (_) {
      return Container(
          padding: EdgeInsets.only(left: 1.w, right: 1.w),
          child: HandlingDataView(
              statusRequest:
                  productPreviewController.statusRequestProductPreview!,
              widget: DropdownMethod(
                  controller: productPreviewController,
                  onViewbuttonpressed: (dynamic) {
                    productPreviewController.handleDropdownSelection(
                        item: productPreviewController
                            .dropdownChooseingValues(dynamic));

                    // productPreviewController.selectedValue = dynamic;
                  })));
    });
  }

  showFavLoginAlertDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.w)),
            content: SizedBox(
              width: 85.w,
              height: 40.h,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(0.01.h),
                  child: TextScaleFactorClamper(
                    child: Form(
                      key: controller.fromKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        children: [
                          Text(NameValues.singIn.tr,
                              textAlign: TextAlign.center,
                              style: TextStore.textTheme.displayMedium!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 1.5.h),
                          AuthTextFromField2(
                            readOnly: false,
                            controller:
                                productPreviewController.emailController,
                            obscureText: false,
                            validator: (value) {
                              if (value.toString().trim().isEmpty) {
                                return NameValues.pleaseEnterEmail.tr;
                              } else if (!RegExp(
                                      ValidationRegex.validationEmail)
                                  .hasMatch(value)) {
                                return NameValues.pleaseEnterValidEmail.tr;
                              } else {
                                return null;
                              }
                            },
                            labelText: NameValues.email,
                            values: 1,
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 1.5.h),
                          GetBuilder<AuthController>(
                            builder: (_) {
                              return AuthTextFromField2(
                                readOnly: false,
                                controller:
                                    productPreviewController.passwordController,
                                obscureText:
                                    controller.isVisibilty ? true : false,
                                validator: (value) {
                                  if (value.toString().trim().isEmpty) {
                                    return NameValues.pleaseEnterPassword.tr;
                                  } else if (!RegExp(
                                          ValidationRegex.passwordRegex)
                                      .hasMatch(value)) {
                                    return NameValues.pleaseWrongPassword.tr;
                                  } else {
                                    return null;
                                  }
                                },
                                labelText: NameValues.password.tr,
                                values: 1,
                                textInputAction: TextInputAction.done,
                                suffixIcon: InkWell(
                                  onTap: () {
                                    controller.visibility();
                                  },
                                  child: controller.isVisibilty
                                      ? const Icon(Icons.visibility_outlined,
                                          color: Colors.black)
                                      : const Icon(
                                          Icons.visibility_off_outlined,
                                          color: Colors.black),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 3.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextWithFont().textWithPoppinsFont(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w300,
                                  text: 'Create account? '.tr,
                                  color: hintColor),
                              InkWell(
                                onTap: () {
                                  controller.fromKey.currentState?.reset();
                                  controller.emailController.clear();
                                  controller.passwordController.clear();
                                  Get.toNamed(Routes.signUpScreen);
                                },
                                child: TextWithFont().textWithPoppinsFont(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w300,
                                    text: NameValues.singUP.tr,
                                    color: mainColor),
                              ),
                            ],
                          ),
                          SizedBox(height: 3.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey),
                                  child: Text('Back',style: TextStyle(color: Colors.white))),
                              SizedBox(width: 3.w),
                              ElevatedButton(
                                  onPressed: () {
                                    if (controller.fromKey.currentState!
                                        .validate()) {
                                      String email = productPreviewController
                                          .emailController.text
                                          .trim();
                                      String password = productPreviewController
                                          .passwordController.text
                                          .trim();
                                      productPreviewController
                                          .productPreviewFavLogin(
                                              email: email,
                                              password: password,
                                              productCode:
                                                  productPreviewController
                                                      .productID!,
                                              status: '0');
                                      Get.back();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: mainColor),
                                  child: Text('Login',style: TextStyle(color: Colors.white)))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget verticalBar() {
    return Obx(() => SizedBox(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
              productPreviewController
                  .customMenu[productPreviewController.productIndex.toInt()]
                  .name!,
              style: TextStore.textTheme.titleLarge!.copyWith(
                  // color: Get.isDarkMode ? Colors.white : Colors.black,
                  color: Colors.transparent,
                  fontWeight: FontWeight.bold)),
          productPreviewController.isWeightCheck != '1' &&
                  productPreviewController.hybridProduct != 1
              ? VerticalBarIndicator(
                  percent: productPreviewController.valuesChanges(
                      productPreviewController.productIndex.toInt(),
                      'productValues'),
                  height: 1.h,
                  animationDuration: const Duration(seconds: 3),
                  color: const [Colors.limeAccent, Colors.green],
                  header:
                      '${(productPreviewController.valuesChanges(productPreviewController.productIndex.toInt(), 'productValues') * 100).toStringAsFixed(2)} %',
                  footer: '',
                  footerStyle: TextStore.textTheme.headlineSmall?.copyWith(
                      fontSize: 9.sp,
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                  headerStyle: TextStore.textTheme.headlineSmall?.copyWith(
                      fontSize: 9.sp,
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                  width: 40.w)
              : (productPreviewController.hybridProduct == 1
                  ? VerticalBarIndicator(
                      percent: productPreviewController.valuesChanges(
                          productPreviewController.productIndex.toInt(),
                          'productValues'),
                      height: 1.h,
                      animationDuration: const Duration(seconds: 3),
                      color: const [Colors.limeAccent, Colors.green],
                      header:
                          '${(productPreviewController.valuesChanges(productPreviewController.productIndex.toInt(), 'productValues') * 100).toStringAsFixed(2)} %',
                      footerStyle: TextStore.textTheme.headlineSmall?.copyWith(
                          fontSize: 9.sp,
                          color: Get.isDarkMode ? Colors.white : Colors.black),
                      headerStyle: TextStore.textTheme.headlineSmall?.copyWith(
                          fontSize: 9.sp,
                          color: Get.isDarkMode ? Colors.white : Colors.black),
                      width: 53.w)
                  : VerticalBarIndicator(
                      percent: productPreviewController.lineGraphValues,
                      height: 1.h,
                      animationDuration: const Duration(seconds: 3),
                      color: const [Colors.limeAccent, Colors.green],
                      header:
                          '${(productPreviewController.lineGraphValues * 100).toStringAsFixed(2)} %',
                      footerStyle: TextStore.textTheme.headlineSmall?.copyWith(
                          fontSize: 9.sp,
                          color: Get.isDarkMode ? Colors.white : Colors.black),
                      headerStyle: TextStore.textTheme.headlineSmall?.copyWith(
                          fontSize: 9.sp,
                          color: Get.isDarkMode ? Colors.white : Colors.black),
                      width: 53.w))
        ])));
  }
}
