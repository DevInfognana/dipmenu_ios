import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {


  static Future<bool> requestAllPermission() async {
    PermissionStatus? status;
    try {
      // status = await Permission.locationAlways.request();
      // status = await Permission.locationWhenInUse.request();
      status = await Permission.notification.request();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return status == PermissionStatus.granted ? true : false;
  }

  static Future<bool> requestLocationPermission() async {
    PermissionStatus? status;
  try{
    status = await Permission.notification.request();
    status = await Permission.location.request();
  }catch(e){
    if (kDebugMode) {
      print(e);
    }
  }

    return status == PermissionStatus.granted ? true : false;
  }

}


// class PermissionController extends GetxController {
//   bool hasCameraPermission = false;
//
//   Future<void> checkCameraPermission() async {
//     final status = await Permission.camera.status;
//
//     if (status == Permission.camera.isGranted) {
//       hasCameraPermission = true;
//       update();
//       return;
//     }  else if(  status == Permission.camera.isDenied){}
//
//     if (status.isDenied) {
//       await Permission.camera.request();
//     }
//     // ...continue to handle all the possible outcomes
//     update();
//   }
// }