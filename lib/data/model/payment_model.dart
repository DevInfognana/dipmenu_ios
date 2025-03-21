class PaymentModel {
  bool? status;
  String? message;
  int? orderId;

  PaymentModel({this.status, this.message, this.orderId});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    orderId = json['orderId'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['status'] = this.status;
  //   data['message'] = this.message;
  //   data['orderId'] = this.orderId;
  //   return data;
  // }
}
