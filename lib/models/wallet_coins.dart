import 'dart:convert';

WalletCoinsResponse walletCoinFromJson(String str) => WalletCoinsResponse.fromJson(json.decode(str));

String walletCoinToJson(WalletCoinsResponse data) => json.encode(data.toJson());

class WalletCoinsResponse {
  WalletCoinsResponse({
    this.success,
    this.coins,
  });

  bool? success;
  List<Coin>? coins;

  factory WalletCoinsResponse.fromJson(Map<String, dynamic> json) => WalletCoinsResponse(
    success: json["success"],
    coins: List<Coin>.from(json["coins"].map((x) => Coin.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "coins": List<dynamic>.from(coins!.map((x) => x.toJson())),
  };
}

class Coin {
  Coin({
    this.name,
    this.shortName,
    this.image,
    this.currentPrice,
    this.quantity,
  });

  String? name;
  String? shortName;
  String? image;
  double? currentPrice;
  double? quantity;

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
    name: json["name"],
    shortName: json["short_name"],
    image: json["image"],
    currentPrice: json["current_price"].toDouble(),
    quantity: json["quantity"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "short_name": shortName,
    "image": image,
    "current_price": currentPrice,
    "quantity": quantity,
  };
}