import 'package:dipmenu_ios/presentation/logic/controller/rewards_controller.dart';
import 'package:get/get.dart';


class RewardsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(RewardsController());
  }

}