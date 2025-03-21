import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dip_menu/domain/entities/status_reques.dart';
import 'check_internet.dart';
import 'dio_exception.dart';

class Crud {
  static Future<Either<StatusRequest, Map>> postData(
      String linkurl, String data, Options options) async {
    try {
      if (await checkInternet()) {

        // await checkInternetSpeed();
        Response response = await Dio().post(
          linkurl,
          data: data,
          options: options,
        );
        // print('-----');

        if (response.statusCode == 200 || response.statusCode == 201) {
          // print('------>Status${response.statusMessage}');
          // Map<String, dynamic> map = json.decode(response.data);
          // print('map---->${response.data}');

          return Right(response.data);
          // Map responsebody = jsonDecode(response.data);
          // return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } on DioError {
      // final errorMessage = DioExceptions.fromDioError(e).toString();
      // print(errorMessage);
      return const Left(StatusRequest.timeoutfailure);
    }
  }

  static Future<Either<StatusRequest, Map>> getData(
    String linkurl, {
    Map<String, dynamic>? map,
    Options? options,
  }) async {
    try {
      if (await checkInternet()) {
        // checkInternetSpeed();
        Response response = await Dio().get(
          linkurl,
          queryParameters: map,
          options: options,
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map<String, dynamic> data = Map<String, dynamic>.from(response.data);

          return Right(data);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } on DioError {
      // final errorMessage = DioExceptions.fromDioError(e).toString();
      return const Left(StatusRequest.serverfailure);
    }
  }

  static Future<Either<StatusRequest, Map>> deleteData(
      String linkurl, Options options) async {
    try {
      if (await checkInternet()) {
        Response response = await Dio().delete(
          linkurl,
          options: options,
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map<String, dynamic> data = Map<String, dynamic>.from(response.data);
          return Right(data);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } on DioError {
      // final errorMessage = DioExceptions.fromDioError(e).toString();
      return const Left(StatusRequest.serverfailure);
    }
  }
}

class Crud1 {
  Future<dynamic> postData({String? linkUrl, String? data, Options? options,dynamic RxStatus}) async {
    try {
      if (await checkInternet()) {
        RxStatus =RxStatus.loading();
        // change(null, status: RxStatus.loading());
        dynamic response =
            await Dio().post(linkUrl!, data: data, options: options);

        if (response.statusCode == 200 || response.statusCode == 201) {
          // change(null, status: RxStatus.success());
          RxStatus= RxStatus.success();
          return response.data;
        }
      } else {
        // change(null, status: RxStatus.error('Offline Failure'));
        RxStatus=  RxStatus.error('Offline Failure');
        return 'Offline Failure';
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      // change(null, status: RxStatus.error(errorMessage));
      RxStatus= RxStatus.error(errorMessage);

      return errorMessage;
    }
  }

  Future<dynamic> getData(String linkUrl,
      {Map<String, dynamic>? map, Options? options, dynamic  RxStatus}) async {
    try {
      if (await checkInternet()) {
        RxStatus.loading();
        // change(null, status: RxStatus.loading());
        dynamic response =
            await Dio().get(linkUrl, queryParameters: map, options: options);

        if (response.statusCode == 200 || response.statusCode == 201) {
          // change(null, status: RxStatus.success());
          RxStatus.success();
          return response.data;
        }
      } else {
        RxStatus.error('Offline Failure');
        // change(null, status: RxStatus.error('Offline Failure'));
        return 'Offline Failure';
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      // change(null, status: RxStatus.error(errorMessage));
      RxStatus.error(errorMessage);
      return errorMessage;
    }
  }

  Future<dynamic> deleteData(String linkUrl, Options options) async {
    try {
      if (await checkInternet()) {
        // change(null, status: RxStatus.loading());
        dynamic response = await Dio().delete(linkUrl, options: options);

        if (response.statusCode == 200 || response.statusCode == 201) {
          // change(null, status: RxStatus.success());
          return response.data;
        }
      } else {
        // change(null, status: RxStatus.error('Offline Failure'));
        return 'Offline Failure';
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      // change(null, status: RxStatus.error(errorMessage));
      return errorMessage;
    }
  }
}

/*  static Future<Either<StatusRequest, Map>> postData(
      String linkurl, String data, Options options) async {
    try {
      if (await checkInternet()) {
        // await checkInternetSpeed();
        Response response = await Dio().post(
          linkurl,
          data: data,
          options: options,
        );
        print('-----');

        if (response.statusCode == 200 || response.statusCode == 201) {
          // print('------>Status${response.statusMessage}');
          // Map<String, dynamic> map = json.decode(response.data);
          // print('map---->${response.data}');

          return Right(response.data);
          // Map responsebody = jsonDecode(response.data);
          // return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      return const Left(StatusRequest.serverfailure);
    }
  }*/