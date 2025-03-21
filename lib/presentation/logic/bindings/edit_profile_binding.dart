import 'package:dipmenu_ios/presentation/logic/controller/edit_profile_controller.dart';
import 'package:get/get.dart';

class EditProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(EditProfileController());
  }

}


