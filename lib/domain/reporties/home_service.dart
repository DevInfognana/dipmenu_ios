import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../entities/crud_operation.dart';
import '../local_handler/Local_handler.dart';
import '../provider/http_request.dart';

class HomeServices {
  static viewHomeBannersRequest() async {
    var url = '${BaseAPI.api}/website/banners';
    // print(url);

    var response = await Crud.getData(
      url,
    );
    return response.fold((l) => l, (r) => r);
  }

  static viewHomeCategoryRequest() async {
    var url = '${BaseAPI.api}/website/category';

    print('==>homescreen: $url');
    var response = await Crud.getData(url);
    return response.fold((l) => l, (r) => r);
  }

  static generalSettingApi() async {
    var url = BaseAPI.cartListTaxGetApi;

    print('==>homescreen: $url');
    var response = await Crud.getData(url);
    return response.fold((l) => l, (r) => r);
  }

  static viewColorPlateRequest() async {
    var url = BaseAPI.colorPlaate;

    var response = await Crud.getData(url,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'x-access-token': SharedPrefs.instance.getString('token')
        }));
    return response.fold((l) => l, (r) => r);
  }

  googleplayvalues(dynamic values) async {
    // var now = new DateTime.now();[6:28 pm] Ameersuhail  S
    //
    //
    //
    //
    // 5271001:2023-05-29 182821:10.00:05-29-2023:18:28:21:906:Test@123456789011
    // print(values);
    // print('-------------------------');
    // print(values);
    var formData = FormData.fromMap({
      'HASH': values.toString(),
      'TERMINALID': "5271001",
      'ORDERID': '240',
      'CURRENCY': 'USD',
      "AMOUNT": "40.00",
      'PAGES': "DIPWALLET",
      "DATETIME": "05-29-2023:21:39:21:906"
    });
    dynamic responseValues;
    try {
      await Dio().post(BaseAPI.googlePayTest).then((response) {
        if (response.statusCode == 200) {
          // print(response.data);
          responseValues = response.data;
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print('$e');
      }
    }
    return responseValues;
  }

  checkinFeature(dynamic values) async {
    var body = jsonEncode({
      "payload": values,
    });
    // print(body);
    // print(BaseAPI().checkInApi);
    dynamic responseValues;
    try {
      await Dio()
          .post(
        BaseAPI().checkInApi,
        data: body,
        options: Options(headers: {
          'x-access-token': SharedPrefs.instance.getString('token')
        }),
      )
          .then((response) {
        if (response.statusCode == 200) {
          // print(response.data);
          responseValues = response.data;
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print('$e');
      }
    }
    return responseValues;
  }
}
