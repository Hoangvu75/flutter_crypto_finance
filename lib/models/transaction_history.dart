import 'dart:convert';

TransactionHistoryResponse transactionHistoryFromJson(String str) => TransactionHistoryResponse.fromJson(json.decode(str));

String transactionHistoryToJson(TransactionHistoryResponse data) => json.encode(data.toJson());

class TransactionHistoryResponse {
  TransactionHistoryResponse({
    this.success,
    this.transaction,
  });

  bool? success;
  List<Transaction>? transaction;

  factory TransactionHistoryResponse.fromJson(Map<String, dynamic> json) => TransactionHistoryResponse(
    success: json["success"],
    transaction: List<Transaction>.from(json["transaction"].map((x) => Transaction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "transaction": List<dynamic>.from(transaction!.map((x) => x.toJson())),
  };
}

class Transaction {
  Transaction({
    this.tradingCrypto,
    this.transactionStatus,
    this.transactionDate,
    this.transactionHour,
  });

  List<TradingCrypto>? tradingCrypto;
  String? transactionStatus;
  String? transactionDate;
  String? transactionHour;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    tradingCrypto: List<TradingCrypto>.from(json["trading_crypto"].map((x) => TradingCrypto.fromJson(x))),
    transactionStatus: json["transaction_status"],
    transactionDate: json["transaction_date"],
    transactionHour: json["transaction_hour"],
  );

  Map<String, dynamic> toJson() => {
    "trading_crypto": List<dynamic>.from(tradingCrypto!.map((x) => x.toJson())),
    "transaction_status": transactionStatus,
    "transaction_date": transactionDate,
    "transaction_hour": transactionHour,
  };
}

class TradingCrypto {
  TradingCrypto({
    this.name,
    this.price,
    this.amount,
  });

  String? name;
  double? price;
  int? amount;

  factory TradingCrypto.fromJson(Map<String, dynamic> json) => TradingCrypto(
    name: json["name"],
    price: json["price"].toDouble(),
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
    "amount": amount,
  };
}
