import 'package:dipmenu_ios/presentation/logic/controller/profile_controller.dart';
import 'package:get/get.dart';
class ProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ProfileController());
  }

}