import 'package:dipmenu_ios/domain/entities/status_reques.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/config/theme.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? containerView(context: context, errorValues: "Loading")
        : statusRequest == StatusRequest.offlinefailure
            ? containerView(context: context, errorValues: "Offline Failure")
            : statusRequest == StatusRequest.serverfailure
                ? containerView(context: context, errorValues: "Server Failure")
                : statusRequest == StatusRequest.failure
                    ? containerView(context: context, errorValues: "No Data")
                    : statusRequest == StatusRequest.pleaseCheckAfterSomeTime
                        ? containerView(
                            context: context, errorValues: "No Data")
                        : widget;
  }

  Widget containerView({required BuildContext context, String? errorValues}) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration:
            BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
        child: Center(
            child: errorValues == "Loading"
                ? CircularProgressIndicator(color: mainColor)
                : Text(
                    errorValues!,
                    style: Get.context?.theme.textTheme.headlineLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                    // style: TextStyle(color: mainColor)
                  )));
  }
}
