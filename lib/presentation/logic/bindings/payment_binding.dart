import 'package:dipmenu_ios/presentation/logic/controller/payment_controller.dart';
import 'package:get/get.dart';

class PaymentBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(PaymentController());
  }

}