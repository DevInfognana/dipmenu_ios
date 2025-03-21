

import 'package:dipmenu_ios/domain/entities/status_reques.dart';

handlingData(response){
  if (response is StatusRequest){
    return response ;
  }else {
    return StatusRequest.success ;
  }
}