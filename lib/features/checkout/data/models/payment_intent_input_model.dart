class PaymentIntentInputModel {
  final int amount;
  final String currency;
  final String customerId;
  PaymentIntentInputModel({
    required this.customerId,
    required this.amount,
    required this.currency,
  });

  Map<String, dynamic> toJson() =>
      {'amount': amount * 100, "currency": currency, "customer": customerId};
}
//  Data Encapsulation
// The class allows you to encapsulate the data related to the PaymentIntent request
//  (like the amount and currency). This way,
//  you're grouping related data together, making it easier to manage and less prone to errors.
