import 'package:dipmenu_ios/presentation/logic/controller/connection_manager_controller.dart';
import 'package:dipmenu_ios/presentation/logic/controller/splash_controller.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectionManagerController>(
            () => ConnectionManagerController());

    Get.lazyPut<SplashScreenController>(
            () => SplashScreenController());

  }
}