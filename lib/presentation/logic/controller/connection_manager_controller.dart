import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ConnectionManagerController extends GetxController {
  // 0 = No Internet, 1 = WiFi Connected, 2 = Mobile Data Connected.
  var connectionType = 0.obs;

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _streamSubscription;

  @override
  void onInit() {
    super.onInit();
    getConnectivityType();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
  }

  Future<void> getConnectivityType() async {
    List<ConnectivityResult> connectivityResults = [];
    try {
      connectivityResults = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    _updateState(connectivityResults);
  }

  void _updateState(List<ConnectivityResult> results) {
    if (results.contains(ConnectivityResult.wifi)) {
      connectionType.value = 1;
    } else if (results.contains(ConnectivityResult.mobile)) {
      connectionType.value = 2;
    } else {
      connectionType.value = 0;
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
    super.onClose();
  }
}

// class ConnectionManagerController extends GetxController {
//   //0 = No Internet, 1 = WIFI Connected ,2 = Mobile Data Connected.
//   var connectionType = 0.obs;
//
//   final Connectivity _connectivity = Connectivity();
//   late StreamSubscription<List<ConnectivityResult>> _streamSubscription;
//
//   // late StreamSubscription _streamSubscription;
//
//   @override
//   void onInit() {
//     super.onInit();
//     getConnectivityType();
//     _streamSubscription =
//         _connectivity.onConnectivityChanged.listen(_updateState);
//   }
//
//   Future<void> getConnectivityType() async {
//     late ConnectivityResult connectivityResult;
//     try {
//       connectivityResult = await (_connectivity.checkConnectivity());
//     } on PlatformException catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//     return _updateState(connectivityResult);
//   }
//
//   _updateState(ConnectivityResult result) {
//     switch (result) {
//       case ConnectivityResult.wifi:
//         connectionType.value = 1;
//         break;
//       case ConnectivityResult.mobile:
//         connectionType.value = 2;
//
//         break;
//       case ConnectivityResult.none:
//         connectionType.value = 0;
//         break;
//       default:
//         connectionType.value = 0;
//         // Get.snackbar(
//         //   'Error',
//         //   'Failed to get connection type',
//         // );
//         break;
//     }
//   }
//
//   @override
//   void onClose() {
//     _streamSubscription.cancel();
//   }
// }
