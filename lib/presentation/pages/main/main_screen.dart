import 'package:dipmenu_ios/core/config/app_textstyle.dart';
import 'package:dipmenu_ios/data/model/home/category/category_data_model.dart';
import 'package:dipmenu_ios/extra/common_widgets/back_button.dart';
import 'package:dipmenu_ios/extra/common_widgets/image_view.dart';
import 'package:dipmenu_ios/presentation/logic/controller/Controller_Index.dart';
import 'package:dipmenu_ios/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../core/config/icon_config.dart';
import '../../../core/config/theme.dart';
import '../../../domain/entities/handling_data_view.dart';
import '../../../domain/local_handler/Local_handler.dart';
import '../../../extra/common_widgets/text_scalar_factor.dart';
import '../../logic/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController = Get.find();

  @override
  void dispose() {
    // homeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return HandlingDataView(
        statusRequest: homeController.statusRequestBanner,
        widget: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          // body: Stack(
          //   children: [
          //     Container(
          //       width: context.width,
          //       height: context.height,
          //       color: Colors.white,
          //       child: Padding(
          //         padding: const EdgeInsets.only(bottom: 250),
          //         child: GetBuilder<HomeController>(builder: (_) {
          //           return HandlingDataView(
          //             statusRequest: homeController.statusRequestBanner,
          //             widget: CarouselSliderExample(controller: homeController),
          //           );
          //         }),
          //       ),
          //     ),
          //     DraggableScrollableSheet(
          //       initialChildSize: .65,
          //       minChildSize: .65,
          //       maxChildSize: 1.0, //homeController.homeCategoryList.length > 3 ? 1.0 : 0.67,
          //       //controller: DraggableScrollableController(),
          //       builder: (BuildContext buildContext,
          //           ScrollController scrollController) {
          //         return Container(
          //           decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(1),
          //               color: Colors.white),
          //           child:
          //         );
          //       },
          //     ),
          //   ],
          // ),
          body: TextScaleFactorClamper(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  height: 6.h,
                  padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Wrap(children: [
                    Image.asset(ImageAsset.appLogo, width: 55.w, height: 4.h)
                  ]),
                ),
                Flexible(
                  child: ListView.builder(
                    itemCount: homeController.homeCategoryList.length,
                    padding: EdgeInsets.all(2.w),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext buildContext, int index) {
                      return GestureDetector(
                        onTap: () {
                          var data = {
                            'id': homeController.homeCategoryList[index].id,
                            'name': homeController.homeCategoryList[index].name,
                            'image':
                                homeController.homeCategoryList[index].image
                          };
                          Get.toNamed(Routes.subCategoryScreen,
                              arguments: data);
                        },
                        child: HomeScreenCardView(
                            categoryData:
                                homeController.homeCategoryList[index]),
                        // child: Card(
                        //   color: Theme.of(context).scaffoldBackgroundColor,
                        //   margin: EdgeInsets.all(0.0.h),
                        //   elevation: 0,
                        //   child: Column(
                        //     children: [
                        //       Row(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Flexible(
                        //             child: Container(
                        //                 padding: EdgeInsets.all(0.5.h),
                        //                 child: Text(
                        //                   homeController
                        //                       .homeCategoryList[index].name!,
                        //                   style: context
                        //                       .theme.textTheme.headlineLarge
                        //                       ?.copyWith(
                        //                           fontWeight: FontWeight.bold),
                        //                 )),
                        //           ),
                        //           SizedBox(width: 3.w),
                        //           FittedBox(
                        //             fit: BoxFit.fill,
                        //             child: SizedBox(
                        //               height: 13.3.h,
                        //               width: getDeviceType() == 'phone'
                        //                   ? 27.w
                        //                   : 23.w,
                        //               child: ClipRRect(
                        //                 borderRadius:
                        //                     BorderRadius.circular(4.w),
                        //                 child: ImageView(
                        //                   imageUrl: imageview(homeController
                        //                       .homeCategoryList[index].image!),
                        //                   showValues: false,
                        //                   mainImageViewWidth: 34.w,
                        //                   bottomImageViewHeight: 3.h,
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //       Padding(
                        //           padding: EdgeInsets.only(
                        //               left: 0.5.h, right: 0.5.h),
                        //           child: DividerView(values: 1)),
                        //     ],
                        //   ),
                        // ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: /*GetBuilder<HomeController>(builder: (_) {*/
              TextScaleFactorClamper(
            child: checkingOrderSTATUS(context),
          ),
          resizeToAvoidBottomInset: false,
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        ),
      );
    });
  }

  checkingOrderSTATUS(BuildContext context) {
    Widget? alertDialogValues;
    // if (homeController.isCheckInFeature == true) {
    //   // if (homeController.orderListValues.isNotEmpty) {
    //   //   alertDialogValues = Padding(
    //   //     padding: EdgeInsets.only(bottom: 2.h),
    //   //     child: ElevatedButton(
    //   //       style: ElevatedButton.styleFrom(
    //   //           backgroundColor: darkSeafoamGreen1,
    //   //           fixedSize: Size(30.w, 4.h),
    //   //           textStyle: TextStore.textTheme.headlineMedium!
    //   //               .copyWith(color: Colors.white),
    //   //           elevation: 6),
    //   //       onPressed: () {
    //   //         if (SharedPrefs.instance.getString('token') != null) {
    //   //           homeController.mobileOrder();
    //   //         }
    //   //         setState(() {
    //   //           homeController.isCheckInFeature = false;
    //   //         });
    //   //       },
    //   //       child: const TextScaleFactorClamper(child: Text('Check-in')),
    //   //     ),
    //   //   );
    //   // } else
    //   //   if (homeController.avictveListValues.isNotEmpty) {
    //   //   alertDialogValues = Padding(
    //   //     padding: EdgeInsets.only(bottom: 2.h),
    //   //     child: ElevatedButton(
    //   //       style: ElevatedButton.styleFrom(
    //   //           fixedSize: Size(30.w, 4.h),
    //   //           backgroundColor: darkSeafoamGreen1,
    //   //           textStyle: TextStore.textTheme.headlineMedium!
    //   //               .copyWith(color: Colors.white),
    //   //           elevation: 6),
    //   //       onPressed: () {
    //   //         if (SharedPrefs.instance.getString('token') != null) {
    //   //           homeController.mobileOrder();
    //   //         }
    //   //
    //   //         // showAlertDialog(context);
    //   //         setState(() {
    //   //           homeController.isCheckInFeature = false;
    //   //         });
    //   //       },
    //   //       child: const TextScaleFactorClamper(child: Text('Check-in')),
    //   //     ),
    //   //   );
    //   // } else {
    //   //   alertDialogValues = Padding(
    //   //     padding: EdgeInsets.only(bottom: 2.h),
    //   //     child: ElevatedButton(
    //   //       style: ElevatedButton.styleFrom(
    //   //           backgroundColor: darkSeafoamGreen1,
    //   //           fixedSize: Size(30.w, 4.h),
    //   //           textStyle: TextStore.textTheme.headlineMedium!
    //   //               .copyWith(color: Colors.white),
    //   //           elevation: 6),
    //   //       onPressed: () {
    //   //         if (SharedPrefs.instance.getString('token') != null) {
    //   //           homeController.mobileOrder();
    //   //         }
    //   //
    //   //         // showAlertDialog(context);
    //   //         setState(() {
    //   //           homeController.isCheckInFeature = false;
    //   //         });
    //   //       },
    //   //       child: const TextScaleFactorClamper(child: Text('Check-in')),
    //   //     ),
    //   //   );
    //   // }
    // } else {
    //
    // }

    alertDialogValues = Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: darkSeafoamGreen1,
            fixedSize: Size(30.w, 4.h),
            textStyle:
            TextStore.textTheme.headlineMedium!.copyWith(color: Colors.white),
            elevation: 6,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        onPressed: () {
          if (SharedPrefs.instance.getString('token') != null) {
            if(homeController.statusRequestRecentOrder==StatusRequest.success){
              homeController.mobileOrder(values: 0);
            }
          } else {
            homeController.emptyListDialog(context);
          }
        },
        child: TextScaleFactorClamper(child: Text('Check-in',style: TextStyle(color: Colors.white, fontSize: 11.sp, fontWeight: FontWeight.bold))),
      ),
    );

    return alertDialogValues;
  }
}

class HomeScreenCardView extends StatelessWidget {
  HomeScreenCardView({Key? key, this.categoryData}) : super(key: key);

  CategoryModelData? categoryData;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      margin: EdgeInsets.all(0.0.h),
      elevation: 0,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Container(
                    padding: EdgeInsets.all(0.5.h),
                    child: Text(
                      categoryData!.name!,
                      style: context.theme.textTheme.displayMedium
                      // style: context.theme.textTheme.headlineLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(width: 3.w),
              FittedBox(
                fit: BoxFit.fill,
                child: SizedBox(
                  height: 13.3.h,
                  width: getDeviceType() == 'phone' ? 27.w : 23.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.w),
                    child: ImageView(
                      imageUrl: imageview(categoryData!.image!),
                      showValues: false,
                      mainImageViewWidth: 34.w,
                      bottomImageViewHeight: 3.h,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
              padding: EdgeInsets.only(left: 0.5.h, right: 0.5.h),
              child: DividerView(values: 1)),
        ],
      ),
    );
  }

  static String getDeviceType() {
    final data = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.first);
    // final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600 ? 'phone' : 'tablet';
  }

}
