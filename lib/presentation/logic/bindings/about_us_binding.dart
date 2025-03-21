import 'package:dipmenu_ios/presentation/logic/controller/about_us_controller.dart';
import 'package:get/get.dart';




class AboutUsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AboutUsController());
  }

}
