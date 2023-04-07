import 'dart:convert';

CryptoListResponse cryptoListResponseFromJson(String str) => CryptoListResponse.fromJson(json.decode(str));

String cryptoListResponseToJson(CryptoListResponse data) => json.encode(data.toJson());

class CryptoListResponse {
  CryptoListResponse({
    this.success,
    this.crypto,
  });

  bool? success;
  List<Crypto>? crypto;

  factory CryptoListResponse.fromJson(Map<String, dynamic> json) => CryptoListResponse(
    success: json["success"],
    crypto: List<Crypto>.from(json["crypto"].map((x) => Crypto.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "crypto": List<dynamic>.from(crypto!.map((x) => x.toJson())),
  };
}

class Crypto {
  Crypto({
    this.name,
    this.shortName,
    this.currentPrice,
    this.fluctuatedPercent,
    this.image,
  });

  String? name;
  String? shortName;
  double? currentPrice;
  double? fluctuatedPercent;
  String? image;

  factory Crypto.fromJson(Map<String, dynamic> json) => Crypto(
    name: json["name"],
    shortName: json["shortName"],
    currentPrice: json["currentPrice"].toDouble(),
    fluctuatedPercent: json["fluctuatedPercent"].toDouble(),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "shortName": shortName,
    "currentPrice": currentPrice,
    "fluctuatedPercent": fluctuatedPercent,
    "image": image,
  };
}


List<Crypto> cryptoList = [
  Crypto(
    name: 'Bitcoin',
    shortName: 'BTC',
    currentPrice: 28455.08,
    fluctuatedPercent: 0.39,
    image: 'https://assets.coinlayer.com/icons/BTC.png',
  ),
  Crypto(
    name: 'Ethereum',
    shortName: 'ETH',
    currentPrice: 1828.70,
    fluctuatedPercent: 0.16,
    image: 'https://assets.coinlayer.com/icons/ETH.png',
  ),
  Crypto(
    name: 'TetherUSD',
    shortName: 'USDT',
    currentPrice: 1002,
    fluctuatedPercent: 0.56,
    image: 'https://assets.coinlayer.com/icons/USDT.png',
  ),
  Crypto(
    name: 'Binance Coin',
    shortName: 'BNB',
    currentPrice: 315.23,
    fluctuatedPercent: -0.76,
    image: 'https://assets.coinlayer.com/icons/BNB.png',
  ),
  Crypto(
    name: 'Ripple',
    shortName: 'XRP',
    currentPrice: 0.5122,
    fluctuatedPercent: -4.07,
    image: 'https://assets.coinlayer.com/icons/XRP.png',
  ),
  Crypto(
    name: 'Cardano',
    shortName: 'ADA',
    currentPrice: 0.3926,
    fluctuatedPercent: -1.58,
    image: 'https://assets.coinlayer.com/icons/ADA.png',
  ),
  Crypto(
    name: 'Dogecoin',
    shortName: 'DOGE',
    currentPrice: 0.07668,
    fluctuatedPercent: 1.44,
    image: 'https://assets.coinlayer.com/icons/DOGE.png',
  ),
  Crypto(
    name: 'Chain Link',
    shortName: 'LINK',
    currentPrice: 7.539,
    fluctuatedPercent: -0.93,
    image: 'https://assets.coinlayer.com/icons/LINK.png',
  ),
  Crypto(
    name: 'Tronix',
    shortName: 'TRX',
    currentPrice: 0.06677,
    fluctuatedPercent: 1.36,
    image: 'https://assets.coinlayer.com/icons/TRX.png',
  ),
  Crypto(
    name: 'Ethereum Classic',
    shortName: 'ETC',
    currentPrice: 20.80,
    fluctuatedPercent: 1.51,
    image: 'https://assets.coinlayer.com/icons/ETC.png',
  ),
  Crypto(
    name: 'Monero',
    shortName: 'XMR',
    currentPrice: 156.81,
    fluctuatedPercent: 0.08,
    image: 'https://assets.coinlayer.com/icons/XMR.png',
  ),
  Crypto(
    name: 'Bitcoin Cash',
    shortName: 'BCH',
    currentPrice: 124.48,
    fluctuatedPercent: 0.74,
    image: 'https://assets.coinlayer.com/icons/BCH.png',
  ),
  Crypto(
    name: 'Stellar',
    shortName: 'XLM',
    currentPrice: 0.1084,
    fluctuatedPercent: -1.51,
    image: 'https://assets.coinlayer.com/icons/ETC.png',
  ),
  Crypto(
    name: 'Decentraland',
    shortName: 'MANA',
    currentPrice: 0.5904,
    fluctuatedPercent: 1.65,
    image: 'https://assets.coinlayer.com/icons/MANA.png',
  ),
  Crypto(
    name: 'EOS',
    shortName: 'EOS',
    currentPrice: 1198,
    fluctuatedPercent: 0.82,
    image: 'https://assets.coinlayer.com/icons/EOS.png',
  ),
  Crypto(
    name: 'Theta Token',
    shortName: 'THETA',
    currentPrice: 1068,
    fluctuatedPercent: 4.14,
    image: 'https://assets.coinlayer.com/icons/THETA.png',
  ),
  Crypto(
    name: 'Tezos',
    shortName: 'XTZ',
    currentPrice: 1120,
    fluctuatedPercent: -0.16,
    image: 'https://assets.coinlayer.com/icons/XTZ.png',
  ),
  Crypto(
    name: 'NEO',
    shortName: 'NEO',
    currentPrice: 12.34,
    fluctuatedPercent: -1.78,
    image: 'https://assets.coinlayer.com/icons/NEO.png',
  ),
  Crypto(
    name: 'Stacks',
    shortName: 'STX',
    currentPrice: 0.8941,
    fluctuatedPercent: -2.93,
    image: 'https://assets.coinlayer.com/icons/STX.png',
  ),
  Crypto(
    name: 'MAKER',
    shortName: 'MKR',
    currentPrice: 687.16,
    fluctuatedPercent: 0.77,
    image: 'https://assets.coinlayer.com/icons/MKR.png',
  ),
  Crypto(
    name: 'DigitalCash',
    shortName: 'DASH',
    currentPrice: 58.66,
    fluctuatedPercent: 2.76,
    image: 'https://assets.coinlayer.com/icons/DASH.png',
  ),
  Crypto(
    name: 'Kucoin Token',
    shortName: 'KCS',
    currentPrice: 8255,
    fluctuatedPercent: -0.34,
    image: 'https://assets.coinlayer.com/icons/KCS.png',
  ),
  Crypto(
    name: 'IOTA',
    shortName: 'MIOTA',
    currentPrice: 0.2214,
    fluctuatedPercent: 3.85,
    image: 'https://assets.coinlayer.com/icons/MIOTA.png',
  ),
  Crypto(
    name: 'Zilliqa',
    shortName: 'ZIL',
    currentPrice: 0.03070,
    fluctuatedPercent: 8.20,
    image: 'https://assets.coinlayer.com/icons/ZIL.png',
  ),
];