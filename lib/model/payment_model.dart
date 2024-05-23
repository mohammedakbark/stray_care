class PaymentModel {
  String uid;
  String? payemntId;
  double amount;

  PaymentModel(
      {required this.amount, required this.uid});
      Map<String,dynamic>toJson(id)=>{
        "uid":uid,
        "payemntId":id,
        "amount":amount
      };


}
