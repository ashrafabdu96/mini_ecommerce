class PaymentEntity {
  String? status;
  String? userIdPay;
  String? payTypeId;
  String? senderName;
  String? accountNumber;
  String? amount;
  String? phoneNumber;
  String? remittanceNumber;

  PaymentEntity(
      {this.status,
      this.userIdPay,
      this.payTypeId,
      this.senderName,
      this.accountNumber,
      this.amount,
      this.phoneNumber,
      this.remittanceNumber});
}
