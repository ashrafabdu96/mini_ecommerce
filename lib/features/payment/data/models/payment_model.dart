import 'package:mini_ecommerce/features/payment/domain/entities/payment_entities/payment_entity.dart';

class PaymentModel extends PaymentEntity {
  PaymentModel(
      {super.status,
      super.userIdPay,
      super.payTypeId,
      super.senderName,
      super.accountNumber,
      super.amount,
      super.phoneNumber,
      super.remittanceNumber});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userIdPay = json['data']['user_id_pay'];
    payTypeId = json['data']['pay_type_id'];
    senderName = json['data']['sender_name'];
    accountNumber = json['data']['account_number'];
    amount = json['data']['amount'];
    phoneNumber = json['data']['phone_number'];
    remittanceNumber = json['data']['remittance_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['user_id_pay'] = userIdPay;
    data['pay_type_id'] = payTypeId;
    data['sender_name'] = senderName;
    data['account_number'] = accountNumber;
    data['amount'] = amount;
    data['phone_number'] = phoneNumber;
    data['remittance_number'] = remittanceNumber;
    return data;
  }
}
