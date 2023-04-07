import 'dart:convert';

WalletNfTsResponse walletNfTsResponseFromJson(String str) => WalletNfTsResponse.fromJson(json.decode(str));

String walletNfTsResponseToJson(WalletNfTsResponse data) => json.encode(data.toJson());

class WalletNfTsResponse {
  WalletNfTsResponse({
    this.success,
    this.nfts,
  });

  bool? success;
  List<NFT>? nfts;

  factory WalletNfTsResponse.fromJson(Map<String, dynamic> json) => WalletNfTsResponse(
    success: json["success"],
    nfts: List<NFT>.from(json["nfts"].map((x) => NFT.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "nfts": List<dynamic>.from(nfts!.map((x) => x.toJson())),
  };
}

class NFT {
  NFT({
    this.name,
    this.image,
  });

  String? name;
  String? image;

  factory NFT.fromJson(Map<String, dynamic> json) => NFT(
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
  };
}