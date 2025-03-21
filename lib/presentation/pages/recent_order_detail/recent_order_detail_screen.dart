//recent order detail
import 'package:dipmenu_ios/data/model/recent_order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../logic/controller/recent_order_detail_controller.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:dipmenu_ios/presentation/pages/index.dart';


class RecentOrderDetailScreen extends StatelessWidget {
  RecentOrderDetailScreen({Key? key}) : super(key: key);

  final recentOrderDetailController = Get.find<RecentOrderDetailController>();
  final numberFormat = NumberFormat("#,##0.00", "en_US");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(10.h),
        child: AppBar(
            leading: AuthBackButton(
              press: () {
                Get.back(); //Get.offAllNamed(Routes.mainScreen,arguments: 0);
              },
            ),
            centerTitle: true,
            title: TextScaleFactorClamper(
                child: AuthTitleText(text: NameValues.orderDetails))),
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: TextScaleFactorClamper(
        child: GetBuilder<RecentOrderDetailController>(builder: (controller) {
          return controller.status.isEmpty
              ? Container(
                  alignment: Alignment.center,
                  child: const Text(
                    'Empty',
                    style: TextStyle(color: Colors.red),
                  ),
                )
              : controller.status.isError
                  ? Container(
                      alignment: Alignment.center,
                      child:
                          Text('Api error - ${controller.status.errorMessage}'),
                    )
                  : controller.status.isLoading
                      ? Container(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(color: mainColor),
                        )
                      : SingleChildScrollView(
                          reverse: false,
                          physics: const BouncingScrollPhysics(),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.h),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                      ' Order ID  # ${recentOrderDetailController.recentOrderData!.data![0].id}',
                                      style: context.theme.textTheme.displaySmall
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold)),
                                  SizedBox(height: 1.h),
                                  ListView.builder(
                                      itemCount: recentOrderDetailController
                                          .recentOrderData!
                                          .data![0]
                                          .orderDetails!
                                          .length,
                                      scrollDirection: Axis.vertical,
                                      physics: const ScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        dynamic orderDetailsValus =
                                            recentOrderDetailController
                                                .recentOrderData!
                                                .data![0]
                                                .orderDetails![index];
                                        return listTileValues(
                                            orderDetailsValus, context);
                                      }),
                                           DividerView(),
                                  textView(
                                      context: context,
                                      title: 'Subtotal',
                                      values:
                                          '\$ ${numberFormat.format(double.parse(recentOrderDetailController.recentOrderData!.data![0].subTotal!))}'),
                                  SizedBox(height: 2.h),
                                  textView(
                                      context: context,
                                      title: 'Reward Points',
                                      values:
                                          '${recentOrderDetailController.recentOrderData!.data![0].redeemPoints} pts'),
                                  SizedBox(height: 2.h),
                                  textView(
                                      context: context,
                                      title:
                                          'Sales Tax (${recentOrderDetailController.recentOrderData!.data![0].taxPercent} %)',
                                      values:
                                          '\$ ${numberFormat.format(double.parse(recentOrderDetailController.recentOrderData!.data![0].taxAmount!))}'),
                                  SizedBox(height: 2.h),
                                  recentOrderDetailController.recentOrderData!
                                              .data![0].giftCard ==
                                          null
                                      ? const SizedBox()
                                      : textView(
                                          context: context,
                                          title:
                                              'GiftCard (${recentOrderDetailController.recentOrderData!.data![0].giftCard} )',
                                          values:
                                              '\$ ${numberFormat.format(double.parse(recentOrderDetailController.recentOrderData!.data![0].giftPoint!))}'),
                                  SizedBox(height: 2.h),
                                           DividerView(),
                                  SizedBox(height: 1.h),
                                  textView(
                                      context: context,
                                      title: 'Total',
                                      values:
                                          '\$ ${numberFormat.format(double.parse(recentOrderDetailController.recentOrderData!.data![0].orderTotal!))}'),
                                  SizedBox(height: 2.h),
                                           DividerView(),
                                ]),
                          ));
        }),
      ),
      bottomNavigationBar: TextScaleFactorClamper(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.w),
            child: ElevatedButton(
                onPressed: () {
                  int? values =
                      recentOrderDetailController.recentOrderData!.data![0].id;
                  recentOrderDetailController.reorderAlertDialog(selectedIndex: values!);
                  // recentOrderDetailController.recreateOrder(values.toString());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.w)),
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 24.w)),
                child: Text(NameValues.reOrder,
                    style: context.theme.textTheme.headlineLarge))),
      ),
    );
  }

  divider() {
    return const Divider(
        height: 20,
        thickness: 0.5,
        indent: 2,
        endIndent: 6,
        color: Colors.grey);
  }

  textView({String? title, String? values, required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title!,
            style: context.theme.textTheme.headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold)),
        Text(values!,
            style: context.theme.textTheme.headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }

  listTileValues(OrderDetails orderDetails, BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0.5.h),
      title: Text('${orderDetails.productName}',
          style: context.theme.textTheme.headlineMedium
              ?.copyWith(fontWeight: FontWeight.bold)),
      subtitle:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('Qty : ${orderDetails.quantity}',
            style: context.theme.textTheme.headlineSmall),
        Text('${orderDetails.itemsizeName}',
            style: context.theme.textTheme.headlineSmall
                ?.copyWith(color: Colors.grey)),
        orderDetails.reward != 0
            ? Text(
                '${numberFormat.format(double.parse(orderDetails.productPrice!))} pts',
                style: context.theme.textTheme.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold))
            : Text(
                '\$ ${numberFormat.format(double.parse(orderDetails.productPrice!))}',
                style: context.theme.textTheme.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
      ]),
    );
  }
}
