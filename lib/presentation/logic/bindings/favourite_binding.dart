import 'package:dipmenu_ios/presentation/logic/controller/favourite_controller.dart';
import 'package:get/get.dart';




class FavouriteBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(FavouriteController());
  }

}