import 'package:dip_menu/core/static/stactic_values.dart';
import 'package:dip_menu/extra/common_widgets/text_scalar_factor.dart';
import 'package:dip_menu/presentation/logic/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
// import 'package:upgrader/upgrader.dart';

import '../../../core/config/app_textstyle.dart';
import '../../../core/config/icon_config.dart';
import '../../../core/config/theme.dart';

// import '../../../domain/local_handler/Local_handler.dart';
import '../../../extra/common_widgets/bottom_navigation.dart';

// import '../../../extra/common_widgets/floating_icon_button.dart';
import '../../logic/controller/connection_manager_controller.dart';
import '../../logic/controller/favourite_controller.dart';
import '../../logic/controller/profile_controller.dart';

// import '../../logic/controller/dim_menu_search_controller.dart';
import '../../logic/controller/rewards_controller.dart';
import 'dart:io' show Platform;

// import '../../routes/routes.dart';
// import 'package:location/location.dart';

// class MainScreen extends StatefulWidget {
//   const MainScreen({Key? key}) : super(key: key);
//
//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen> {
//   final homeController = Get.find<MainController>();
//   final favController = Get.find<FavouriteController>();
//   final searchController = Get.find<DipMenuSearchController>();
//   final profileController = Get.find<ProfileController>();
//
//   // Location locationValues1 = Location();
//
//   final ConnectionManagerController controller =
//   Get.find<ConnectionManagerController>();
//
//   PageController page = PageController(initialPage: 0);
//   bool outValue = false;
//
//   void _onItemTapped(int index) {
//     setState(() {
//       if (index == 4) {
//         null;
//       } else {
//         homeController.selectedIndex = index;
//       }
//       if (index == 2) {
//         if (SharedPrefs.instance.getString('user_id') != null) {
//           favController.viewFavourites();
//         }
//       } else if (index == 1) {
//         searchController.viewHomeBanners();
//       } else if (index == 3) {
//         if (SharedPrefs.instance.getString('user_id') != null) {
//           profileController.profile(
//               iD: SharedPrefs.instance.getString('user_id')!);
//         }
//       }
//
//       if (index != 1) {
//         searchController.searchController.clear();
//       }
//     });
//     homeController.bottomNavigation(index);
//   }
//
//   DateTime preBackPress = DateTime.now();
//
//   @override
//   void initState() {
//     homeController.cartListApi();
//     super.initState();
//     if (controller.connectionType.value == 0) {
//       FlutterBackgroundService().invoke("stopService");
//     } else {
//
//     }
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   String getDeviceType() {
//     final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
//     return data.size.shortestSide < 600 ? 'phone' : 'tablet';
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child: Obx(
//           () {
//         return controller.connectionType.value != 0
//             ? WillPopScope(
//           onWillPop: () async {
//             // Dialog should show for confirmation of exit
//             setState(() {
//               // if (homeController.selectedIndex == 3) {
//               //   outValue = false;
//               //   homeController.selectedIndex = 0;
//               //   // Get.delete<FavouriteController>();
//               //   // Get.delete<SearchController>();
//               //   // Get.delete<ProfileController>();
//               // } else if (homeController.selectedIndex == 2) {
//               //   outValue = false;
//               //   homeController.selectedIndex = 0;
//               //   // Get.delete<FavouriteController>();
//               //   // Get.delete<SearchController>();
//               //   // Get.delete<ProfileController>();
//               // } else if (homeController.selectedIndex == 1) {
//               //   outValue = false;
//               //   homeController.selectedIndex = 0;
//               //   // Get.delete<FavouriteController>();
//               //   // Get.delete<SearchController>();
//               //   // Get.delete<ProfileController>();
//               // } else
//               if (homeController.selectedIndex == 0) {
//                 // SystemNavigator.pop();
//                 FlutterBackgroundService().startService();
//                 FlutterBackgroundService().invoke("setAsBackground");
//                 // locationValues1.enableBackgroundMode(enable: true);
//                 outValue = true;
//
//                 // showAppExitPopup();/
//               } else {
//                 outValue = false;
//                 homeController.selectedIndex = 0;
//               }
//             });
//             return outValue;
//           },
//           child: Scaffold(
//             body: IndexedStack(
//               index: homeController.selectedIndex,
//               children: homeController.tabs,
//             ),
//             bottomNavigationBar: BottomNavigationBar(
//               backgroundColor: Colors.white,
//               selectedIconTheme:
//               IconThemeData(color: mainColor, size: 3.h),
//               selectedItemColor: mainColor,
//               unselectedItemColor: Colors.grey,
//               unselectedIconTheme:
//               IconThemeData(color: Colors.grey, size: 3.h),
//               showSelectedLabels: false,
//               showUnselectedLabels: false,
//               type: BottomNavigationBarType.fixed,
//               items: const <BottomNavigationBarItem>[
//                 BottomNavigationBarItem(
//                     icon: ImageIcon(AssetImage(ImageAsset.bottomImage1)),
//                     label: ''),
//                 BottomNavigationBarItem(
//                     icon: ImageIcon(AssetImage(ImageAsset.bottomImage2)),
//                     label: ''),
//                 BottomNavigationBarItem(
//                     icon: ImageIcon(AssetImage(ImageAsset.bottomImage3)),
//                     label: ''),
//                 BottomNavigationBarItem(
//                     icon: ImageIcon(AssetImage(ImageAsset.bottomImage4)),
//                     label: ''),
//                 BottomNavigationBarItem(
//                     icon: Icon(Icons.chat,
//                         size: 2, color: Colors.transparent),
//                     label: ''),
//               ],
//               currentIndex: homeController.selectedIndex,
//               onTap: _onItemTapped,
//             ),
//             floatingActionButton: TextScaleFactorClamper(
//               child: GetBuilder<MainController>(builder: (_) {
//                 return floatingIcon(
//                     values: homeController.totalCount.toString(),
//                     devicetype: getDeviceType(),
//                     onButtonTapped: () {
//                       Get.toNamed(Routes.cartScreen);
//                     });
//               }),
//             ),
//             resizeToAvoidBottomInset: false,
//             floatingActionButtonLocation:
//             FloatingActionButtonLocation.endDocked,
//           ),
//         )
//             : Scaffold(
//             backgroundColor: Colors.white,
//             body: TextScaleFactorClamper(
//               child: Center(
//                 child: Padding(
//                   padding:
//                   EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
//                   child: Column(
//                     children: [
//                       Image.asset(ImageAsset.noConnection,
//                           width: double.infinity,
//                           height: 50.h,
//                           fit: BoxFit.fill),
//                       Row(
//                         children: [
//                           Expanded(
//                               child: Text(
//                                   'No Internet found. Check your connection or try again.',
//                                   textAlign: TextAlign.left,
//                                   style: TextStore.textTheme.headline4!
//                                       .copyWith(color: Colors.black)))
//                         ],
//                       ),
//                       SizedBox(height: 2.h),
//                       ElevatedButton(
//                         onPressed: () {
//                           controller.getConnectivityType();
//                         },
//                         style: ElevatedButton.styleFrom(
//                             primary: mainColor,
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 15, vertical: 7),
//                             textStyle: TextStore.textTheme.headline4!
//                                 .copyWith(color: Colors.black)),
//                         child: Text(NameValues.tryAgain),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ));
//       },
//     ));
//   }
//
//   Future<bool> showAppExitPopup() async {
//     return await showDialog(
//         context: context,
//         builder: (context) =>
//             TextScaleFactorClamper(
//               child: AlertDialog(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(5.w)),
//                 content: Text('Do you want to exit an App?',
//                     style: TextStore.textTheme.headline5!
//                         .copyWith(color: descriptionColor),
//                     textAlign: TextAlign.center),
//                 actions: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ElevatedButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.grey),
//                           child: Text('No',
//                               style: TextStore.textTheme.headline4!
//                                   .copyWith(color: Colors.white))),
//                       SizedBox(width: 2.w),
//                       ElevatedButton(
//                           onPressed: () {
//                             FlutterBackgroundService().startService();
//                             FlutterBackgroundService()
//                                 .invoke("setAsBackground");
//                           },
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: mainColor),
//                           child: Text('Yes',
//                               style: TextStore.textTheme.headline4!
//                                   .copyWith(color: Colors.white)))
//                     ],
//                   ),
//                 ],
//               ),
//             )) ??
//         false;
//   }
// }

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final homeController = Get.find<MainController>();
  final favController = Get.find<FavouriteController>();
  final rewardController = Get.find<RewardsController>();

  // final searchController = Get.find<DipMenuSearchController>();
  final profileController = Get.find<ProfileController>();
  final ConnectionManagerController controller =
      Get.find<ConnectionManagerController>();
  PageController page = PageController(initialPage: 0);
  bool outValue = false;

  @override
  void initState() {
    homeController.cartListApi();
    super.initState();
    initializeBackgroundService();
  }

  void initializeBackgroundService() {
    if (controller.connectionType.value == 0) {
      FlutterBackgroundService().invoke("stopService");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return controller.connectionType.value != 0
            ? buildConnectedScaffold()
            : buildDisconnectedScaffold();
      }),
    );
  }

  buildConnectedScaffold() {
    return GetBuilder<MainController>(builder: (controller) {
      return WillPopScope(
          onWillPop: onWillPop,
          child: Scaffold(
            body: IndexedStack(
              index: homeController.selectedIndex,
              children: homeController.tabs,
            ),
            bottomNavigationBar: BottomNavigation(
                elevation: 0,
                onTap: homeController.onItemTapped,
                index: homeController.selectedIndex),
            floatingActionButton: FloatingButton(
              totalValues: homeController.totalCount.toString(),
            ),
            resizeToAvoidBottomInset: false,
            floatingActionButtonLocation:
            FloatingActionButtonLocation.endDocked,
          ),
      );
    });
  }

  Scaffold buildDisconnectedScaffold() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: TextScaleFactorClamper(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              children: [
                Image.asset(
                  ImageAsset.noConnection,
                  width: double.infinity,
                  height: 50.h,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 2.h),
                ElevatedButton(
                  onPressed: () {
                    controller.getConnectivityType();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: mainColor,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    textStyle: context.theme.textTheme.headline4!
                        .copyWith(color: Colors.black),
                  ),
                  child: Text(NameValues.tryAgain),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> onWillPop() async {
    setState(() {
      if (homeController.selectedIndex == 0) {
        FlutterBackgroundService().startService();
        FlutterBackgroundService().invoke("setAsBackground");
        outValue = true;
      } else {
        outValue = false;
        homeController.selectedIndex = 0;
      }
    });
    return outValue;
  }
}
