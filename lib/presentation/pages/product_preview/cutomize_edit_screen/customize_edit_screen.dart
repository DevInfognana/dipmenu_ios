import 'package:dipmenu_ios/domain/entities/handling_data_view.dart';
import 'package:dipmenu_ios/domain/local_handler/Local_handler.dart';
import 'package:dipmenu_ios/extra/common_widgets/image_view.dart';
import 'package:dipmenu_ios/extra/common_widgets/text_form_field_2.dart';
import 'package:dipmenu_ios/extra/common_widgets/text_scalar_factor.dart';
import 'package:dipmenu_ios/extra/packages/linear_progress_bar.dart';
import 'package:dipmenu_ios/presentation/logic/controller/authentication_controller.dart';
import 'package:dipmenu_ios/presentation/logic/controller/customize_edit_controller.dart';
import 'package:dipmenu_ios/presentation/pages/product_preview/cutomize_edit_screen/widget/customize_dropdown.dart';
import 'package:dipmenu_ios/presentation/pages/product_preview/cutomize_edit_screen/widget/customize_edit_view.dart';
import 'package:dipmenu_ios/presentation/pages/product_preview/cutomize_edit_screen/widget/merch_category.dart';
import 'package:dipmenu_ios/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_textstyle.dart';
import '../../../../core/config/theme.dart';
import '../../../../core/static/stactic_values.dart';
import '../../../../extra/common_widgets/alert_dialog.dart';
import '../../../../extra/common_widgets/bottom_navigation.dart';
import '../../../../extra/common_widgets/common_product_page_widgets.dart';
import '../../../../extra/common_widgets/counter_increment.dart';
import '../../../../extra/common_widgets/description_text.dart';
import '../../../../extra/common_widgets/fav_login_alert_dialog.dart';
import '../../../../extra/packages/scrollable_list_tab_scroller.dart';
import '../widget/custom_menu.dart';

class CustomizeProductPreviewScreen extends StatefulWidget {
  const CustomizeProductPreviewScreen({Key? key}) : super(key: key);

  @override
  State<CustomizeProductPreviewScreen> createState() =>
      _CustomizeProductPreviewScreenState();
}

class _CustomizeProductPreviewScreenState
    extends State<CustomizeProductPreviewScreen>
    with SingleTickerProviderStateMixin {
  final customizeProductPreviewController = Get.find<CustomizeEditController>();

  final controller = Get.put(AuthController());

  final numberFormat = NumberFormat("#,##0.00##", "en_US");

  // TabController? tabController;
  // bool? isUnselected;

  @override
  void initState() {
    super.initState();
  }


  // onEndScroll(ScrollMetrics metrics) {
  //   setState(() {
  //     customizeProductPreviewController.endPoint = true;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(7.5.h),
                child: ProductAppBar(
                  press: () {
                    Get.back();
                  },
                )),
            backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
            body: TextScaleFactorClamper(
              child: GetBuilder<CustomizeEditController>(
                builder: (_) {
                  return HandlingDataView(
                      statusRequest: customizeProductPreviewController
                          .statusRequestCustomMenu!,
                      widget: NotificationListener(
                          child: NotificationListener<ScrollNotification>(
                        onNotification: (ScrollNotification scrollInfo) {
                          if (customizeProductPreviewController
                              .customMenu.isNotEmpty) {
                            if (scrollInfo is UserScrollNotification) {
                              if (scrollInfo.direction ==
                                  ScrollDirection.reverse) {
                                customizeProductPreviewController
                                    .scrollingValues();
                              }
                            }
                          } else {
                            customizeProductPreviewController.scrollingValues();
                          }

                          return true;
                        },
                        child: customizeProductPreviewController
                                    .categoryIdValues !=
                                5
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                    SizedBox(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 1.w, right: 1.w),
                                        child: Card(
                                          color: Theme.of(Get.context!)
                                              .scaffoldBackgroundColor,
                                          elevation: 0,
                                          child: Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    height: 15.h,
                                                    width: getDeviceType() ==
                                                            'phone'
                                                        ? 27.w
                                                        : 23.w,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.w),
                                                      child: ImageView(
                                                        imageUrl: imageview(
                                                            customizeProductPreviewController
                                                                    .argumentData[
                                                                'image']!),
                                                        showValues: false,
                                                        mainImageViewWidth:
                                                            34.w,
                                                        bottomImageViewHeight:
                                                            5.h,
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(0.1.h),
                                                      child: Column(
                                                        children: [
                                                          Row(children: [
                                                            CommonWidget().productName(
                                                                context,
                                                                customizeProductPreviewController
                                                                        .argumentData[
                                                                    'name'])
                                                          ]),
                                                          Row(
                                                            children: [
                                                              priceContent(),
                                                              const Spacer(),
                                                              totalPrizeValues(),
                                                              const Spacer(
                                                                  flex: 2),
                                                              favouriteContent(),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    addButton(),
                                                    chooseSize(),
                                                  ]),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 2.w),
                                                child: productDescription(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  customizeProductPreviewController
                                      .customMenuBoolValues.value ==
                                      false?
                                    Expanded(
                                        child: Container(
                                            // alignment: Alignment.center,
                                            padding: EdgeInsets.only(
                                                left: 4.w,
                                                top: 2.h,
                                                right: 4.w,
                                                bottom: 0.2.h),
                                            child:
                                                ScrollableListTabScrollerView(
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              tabBuilder: (BuildContext context,
                                                      int index, bool active) =>
                                                  Container(
                                                color: Get.isDarkMode
                                                    ? (Colors.transparent)
                                                    : (customizeProductPreviewController
                                                                .customMenu
                                                                .length <=
                                                            1
                                                        ? Colors.transparent
                                                        : Colors.grey.shade100),
                                                height: 9.h,
                                                width:
                                                customizeProductPreviewController
                                                                .customMenu
                                                                .length <=
                                                            1
                                                        ? MediaQuery.of(context)
                                                            .size
                                                            .width
                                                        : null,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 4.w),
                                                child: Text(
                                                  customizeProductPreviewController
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
                                              ),
                                              itemCount:
                                              customizeProductPreviewController
                                                      .customMenu.length,
                                              //data.length,
                                              tabChanged: (int values) {
                                                customizeProductPreviewController
                                                    .valuesChanges(values, '');
                                              },
                                              addingWidget: verticalBar(),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                final size =
                                                customizeProductPreviewController
                                                        .minMaxShow(
                                                    customizeProductPreviewController
                                                                .customMenu[
                                                                    index]
                                                                .id);
                                                return Column(
                                                  children: [
                                                    // SizedBox(height: 1.h),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 1.h),
                                                      child:
                                                          CusMenuCategoryItem(
                                                        title:
                                                        customizeProductPreviewController
                                                                .customMenu[
                                                                    index]
                                                                .name!,
                                                            customMenuId:
                                                            customizeProductPreviewController
                                                                .customMenu[index]
                                                                .id,
                                                        customMenuItemValues:
                                                        customizeProductPreviewController
                                                                .customMenu[
                                                                    index]
                                                                .customMenuItems!,
                                                        minMaxValues: size,
                                                        controller:
                                                            customizeProductPreviewController,
                                                        customProductsValues:
                                                            customizeProductPreviewController
                                                                .customMenu[
                                                                    index]
                                                                .customProducts!,
                                                        customizeMenuItems:
                                                            customizeProductPreviewController
                                                                .customMenu[
                                                                    index]
                                                                .customizeMenuItems,
                                                        isHybrid:
                                                            customizeProductPreviewController
                                                                .customMenu[
                                                                    index]
                                                                .isHybrid,
                                                        selectedItems:
                                                            customizeProductPreviewController
                                                                .customMenu[
                                                                    index]
                                                                .selectedItems,
                                                      ),
                                                    ),
                                                    index ==
                                                            customizeProductPreviewController
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
                                            ))):const SizedBox(),
                                  ])
                            : CustomMerchCategory(
                                customizeEditController:
                                    customizeProductPreviewController),
                      )));
                },
              ),
            ),
            floatingActionButton:
                GetBuilder<CustomizeEditController>(builder: (_) {
              return HandlingDataView(
                  statusRequest: customizeProductPreviewController
                      .statusRequestCustomMenu!,
                  widget: TextScaleFactorClamper(
                    child: TextScaleFactorClamper(
                        child: customizeProductPreviewController
                                .customMenu.isNotEmpty
                            ? floatingbtn(
                                endPointValues:
                                    customizeProductPreviewController.endPoint,
                                totalLength: customizeProductPreviewController
                                    .productTotal,
                                onViewbuttonpressed: () {
                                  final bool values =
                                      customizeProductPreviewController
                                          .minimumCheckValues();

                                  if (values == false) {
                                    ShowDialogBox.alertDialogBox(
                                        context: context,
                                        title: 'Alert',
                                        content:
                                            customizeProductPreviewController
                                                .minCustMenuName
                                                .join(', '),
                                        onButtonTapped: () {
                                          Get.back();
                                        },
                                        cartScreen: 1,
                                        categoryId:
                                            customizeProductPreviewController
                                                .categoryIdValues,
                                        textOkButton: 'OK');
                                  } else {
                                    double subTotal = 0.0;
                                    customizeProductPreviewController
                                            .overAllPriceCalculation()
                                        .forEach((element) {
                                      subTotal += double.parse(element);
                                    });
                                    if (customizeProductPreviewController
                                        .customMenu.isNotEmpty) {
                                      final priceValues =
                                          customizeProductPreviewController
                                                  .overAllPriceCalculation()
                                              .join(',');
                                      // .reduce((value, element) => value + ',' + element);
                                      dynamic selectIDValues =
                                          customizeProductPreviewController
                                                  .selectedID()
                                              .join(',');
                                      // .reduce((value, element) => value + ',' + element);

                                      dynamic selectNameValues =
                                          customizeProductPreviewController
                                                  .selectedName()
                                              .join(',');
                                      // .reduce((value, element) => value + ',' + element);

                                      customizeProductPreviewController.addCart(
                                          itemPrize:
                                              customizeProductPreviewController
                                                          .valuescheck() ==
                                                      false
                                                  ? '0'
                                                  : priceValues,
                                          itemID: customizeProductPreviewController
                                                      .valuescheck() ==
                                                  false
                                              ? ''
                                              : selectIDValues,
                                          totalCost:
                                              customizeProductPreviewController
                                                  .allProductTotalValues(
                                                      subTotal),
                                          defaultCustom:
                                              customizeProductPreviewController
                                                          .defaultCustomItems() ==
                                                      true
                                                  ? 1
                                                  : 0,
                                          itemNames:
                                              customizeProductPreviewController
                                                          .valuescheck() ==
                                                      false
                                                  ? ''
                                                  : selectNameValues);
                                    } else {
                                      customizeProductPreviewController.addCart(
                                          itemPrize: '0',
                                          itemID: '',
                                          totalCost:
                                              customizeProductPreviewController
                                                  .allProductTotalValues(
                                                      subTotal),
                                          defaultCustom:
                                              customizeProductPreviewController
                                                          .defaultCustomItems() ==
                                                      true
                                                  ? 1
                                                  : 0,
                                          itemNames: '');
                                    }
                                  }
                                },
                            name: NameValues.update)
                            : FloatingActionButton.extended(
                                onPressed: () {
                                  double subTotal = 0.0;
                                  customizeProductPreviewController
                                          .overAllPriceCalculation()
                                      .forEach((element) {
                                    subTotal += double.parse(element);
                                  });
                                  customizeProductPreviewController.addCart(
                                      itemPrize: '0',
                                      itemID: '',
                                      totalCost:
                                          customizeProductPreviewController
                                              .allProductTotalValues(subTotal),
                                      defaultCustom: 1,
                                      itemNames: '');
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.w)),
                                extendedPadding: EdgeInsets.all(5.w),
                                label: Text(NameValues.productupdate,
                                    style: TextStore.textTheme.headlineLarge!
                                        .copyWith(color: Colors.white)),
                                backgroundColor: mainColor)),
                  ));
            })));
  }

  static String getDeviceType() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600 ? 'phone' : 'tablet';
  }

  Widget priceContent() {
    return customizeProductPreviewController.slashedPrice == 0.0
        ? const SizedBox()
        : GetBuilder<CustomizeEditController>(builder: (_) {
            return Padding(
              padding: EdgeInsets.only(
                  left: 1.w,
                  right: 1.w,
                  bottom: customizeProductPreviewController
                          .productDescription!.isEmpty
                      ? 0
                      : 0.h),
              child: Text(
                  '\$ ${numberFormat.format(customizeProductPreviewController.slashedPrice)}',
                  style: TextStore.textTheme.displaySmall?.copyWith(
                      decoration: TextDecoration.lineThrough,
                      fontWeight: FontWeight.w300,
                      color: mainColor)),
            );
          });
  }

  Widget onlinePriceContent() {
    return GetBuilder<CustomizeEditController>(builder: (_) {
      return Padding(
        padding: EdgeInsets.only(
            left: 5.w,
            right: 1.w,
            bottom:
                customizeProductPreviewController.productDescription!.isEmpty
                    ? 0
                    : 0.h),
        child: customizeProductPreviewController.defaultPrice == 0.0
            ? Text(
                '\$ ${numberFormat.format(customizeProductPreviewController.priceCalculation1(1, double.parse(customizeProductPreviewController.defaultPrice.toStringAsFixed(2))))}',
                style: TextStore.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w900, color: Colors.green))
            : Text(
                '\$ ${numberFormat.format(double.parse(customizeProductPreviewController.defaultPrice.toStringAsFixed(2)))}',
                style: TextStore.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w900, color: Colors.green)),
      );
    });
  }

  Widget totalPrizeValues() {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        GetBuilder<CustomizeEditController>(builder: (_) {
          String values = customizeProductPreviewController.priceCalculation1(
                  customizeProductPreviewController.custProductQuanity.toInt(),
                  customizeProductPreviewController.defaultPrice)
              .toStringAsFixed(2);

          return Text('\$ ${numberFormat.format(double.parse(values))}',
              style: TextStore.textTheme.displaySmall
                  ?.copyWith(fontWeight: FontWeight.w900, color: Colors.green));
        })
      ],
    );
  }

  Widget addButton() {
    return GetBuilder<CustomizeEditController>(builder: (_) {
      Color? color = Get.isDarkMode ? Colors.white : borderColor;
      return HandlingDataView(
          statusRequest:
              customizeProductPreviewController.statusRequestProductPreview!,
          widget: CounterButton(
              onIncrementSelected: () {
                customizeProductPreviewController.increaseCount();
              },
              onDecrementSelected: () {
                customizeProductPreviewController.decreaseCount();
              },
              label: Text(
                customizeProductPreviewController.custProductQuanity.toString(),
                style: TextStore.textTheme.displaySmall
                    ?.copyWith(color: color, fontWeight: FontWeight.bold),
              )));
    });
  }

  Widget favouriteContent() {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (SharedPrefs.instance.getString('token') != null) {
            if (customizeProductPreviewController.isFavourite == true) {
              customizeProductPreviewController.favouriteValues =
                  'favouriteScreen';
              customizeProductPreviewController.isFavourite = false;
              customizeProductPreviewController.removeFavourite(
                  productCode: customizeProductPreviewController.productID!);
            } else if (customizeProductPreviewController.isFavourite == false) {
              customizeProductPreviewController.favouriteValues =
                  'favouriteScreen';
              customizeProductPreviewController.isFavourite = true;
              customizeProductPreviewController.someFavouriteValuesChecking();
            }
          } else {
            FavLoginPopUp().showFavLoginAlertDialog(context,
                userNameController:
                    customizeProductPreviewController.emailController,
                passWordController: customizeProductPreviewController
                    .passwordController, onButtonTapped: () {
              String email =
                  customizeProductPreviewController.emailController.text.trim();
              String password = customizeProductPreviewController
                  .passwordController.text
                  .trim();
              customizeProductPreviewController.productPreviewFavLogin(
                  email: email,
                  password: password,
                  productCode: customizeProductPreviewController.productID!,
                  status: '0');
            });
          }
        });
      },
      child: customizeProductPreviewController.isFavourite == true
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

  Widget productDescription() {
    return GetBuilder<CustomizeEditController>(builder: (_) {
      Color? color = Get.isDarkMode ? Colors.white : borderColor;
      return customizeProductPreviewController.productDescription!.isEmpty
          ? Container()
          : (  Text(customizeProductPreviewController.productDescription!,
          style: TextStore.textTheme.headlineSmall!
              .copyWith(color: Get.isDarkMode ? Colors.white : borderColor))
          // customizeProductPreviewController.productDescription!.length < 64
          //     ? Text(customizeProductPreviewController.productDescription!,
          //         style: TextStore.textTheme.headlineSmall!.copyWith(color: color))
          //     : ExpandableText(
          //         customizeProductPreviewController.productDescription == null
          //             ? ''
          //             : customizeProductPreviewController.productDescription!,
          //         trimLines: 1,
          //       )
      );
    });
  }

  Widget chooseSize() {
    return Padding(
        padding: EdgeInsets.only(left: 3.w, right: 2.w, top: 1.w),
        child: HandlingDataView(
            statusRequest:
                customizeProductPreviewController.statusRequestProductPreview!,
            widget: CustomizeDropdown(
                controller: customizeProductPreviewController,
                onViewbuttonpressed: (dynamic) {
                  customizeProductPreviewController.handleDropdownSelection(
                      item: customizeProductPreviewController
                          .dropdownChooseingValues(dynamic));
                })));
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
              width: 90.w,
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
                            controller: customizeProductPreviewController
                                .emailController,
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
                                controller: customizeProductPreviewController
                                    .passwordController,
                                obscureText:
                                    controller.isVisibilty ? true : false,
                                validator: (value) {
                                  if (value.toString().trim().isEmpty ||
                                      value.toString().length < 6) {
                                    return 'Password should be 6 characters'.tr;
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
                                  customizeProductPreviewController
                                      .emailController
                                      .clear();
                                  customizeProductPreviewController
                                      .passwordController
                                      .clear();
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
                                      customizeProductPreviewController.productPreviewFavLogin(
                                          email:
                                              customizeProductPreviewController
                                                  .emailController.text
                                                  .trim(),
                                          password:
                                              customizeProductPreviewController
                                                  .passwordController.text
                                                  .trim(),
                                          productCode:
                                              customizeProductPreviewController
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
          // Text(
          //     customizeProductPreviewController
          //         .customMenu[
          //             customizeProductPreviewController.productIndex.toInt()]
          //         .name!,
          //     style: TextStore.textTheme.headlineMedium!.copyWith(
          //         color: Get.isDarkMode ? Colors.white : Colors.black,
          //         fontWeight: FontWeight.bold)),
          Text(
              customizeProductPreviewController
                  .customMenu[customizeProductPreviewController.productIndex.toInt()]
                  .name!,
              style: TextStore.textTheme.titleLarge!.copyWith(
                // color: Get.isDarkMode ? Colors.white : Colors.black,
                  color: Colors.transparent,
                  fontWeight: FontWeight.bold)),
          customizeProductPreviewController.isWeightCheck != '1' &&
                  customizeProductPreviewController.hybridProduct != 1
              ? VerticalBarIndicator(
                  percent: customizeProductPreviewController.valuesChanges(
                      customizeProductPreviewController.productIndex.toInt(),
                      'productValues'),
                  height: 1.h,
                  animationDuration: const Duration(seconds: 3),
                  color: const [Colors.limeAccent, Colors.green],
                  header:
                      '${(customizeProductPreviewController.valuesChanges(customizeProductPreviewController.productIndex.toInt(), 'productValues') * 100).toStringAsFixed(2)} %',
                  footer: '',
                  footerStyle: TextStore.textTheme.headlineSmall
                      ?.copyWith(fontSize: 9.sp, color: Get.isDarkMode ? Colors.white : Colors.black),
                  headerStyle: TextStore.textTheme.headlineSmall
                      ?.copyWith(fontSize: 9.sp, color: Get.isDarkMode ? Colors.white : Colors.black),
                  width: 40.w)
              : (customizeProductPreviewController.hybridProduct == 1
                  ? VerticalBarIndicator(
                      percent: customizeProductPreviewController.valuesChanges(
                          customizeProductPreviewController.productIndex
                              .toInt(),
                          'productValues'),
                      height: 1.h,
                      animationDuration: const Duration(seconds: 3),
                      color: const [Colors.limeAccent, Colors.green],
                      header:
                          '${(customizeProductPreviewController.valuesChanges(customizeProductPreviewController.productIndex.toInt(), 'productValues') * 100).toStringAsFixed(2)} %',
                      footerStyle: TextStore.textTheme.headlineSmall
                          ?.copyWith(fontSize: 9.sp, color: Get.isDarkMode ? Colors.white : Colors.black),
                      headerStyle: TextStore.textTheme.headlineSmall
                          ?.copyWith(fontSize: 9.sp, color: Get.isDarkMode ? Colors.white : Colors.black),
                      width: 53.w)
                  : VerticalBarIndicator(
                      percent:
                          customizeProductPreviewController.lineGraphValues,
                      height: 1.h,
                      animationDuration: const Duration(seconds: 3),
                      color: const [Colors.limeAccent, Colors.green],
                      header:
                          '${(customizeProductPreviewController.lineGraphValues * 100).toStringAsFixed(2)} %',
                      footerStyle: TextStore.textTheme.headlineSmall
                          ?.copyWith(fontSize: 9.sp, color: Get.isDarkMode ? Colors.white : Colors.black),
                      headerStyle: TextStore.textTheme.headlineSmall
                          ?.copyWith(fontSize: 9.sp, color: Get.isDarkMode ? Colors.white : Colors.black),
                      width: 53.w))
        ])));
  }
}
